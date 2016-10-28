"""
Generate VHDL or Verilog code for a signed multiplier.

Usage: genmul.py --lang=vhdl|verilog [--nolib] Xbits Ybits npipe
Usage: genmul.py --lang=vhdl|verilog --lib

    --lang=...  Specify VHDL or Verilog code
    --nolib     Do not generate library components
    --lib       Generate only library components
    Xbits       Length of input word in bits (Xbits >= 4)
    Ybits       Length of input word in bits (Ybits >= Xbits)
    npipe       Number of register stages (0 or 1 or 2)

See also:
  G. Knagge, "ASIC Design for Signal Processing",
    http://www.geoffknagge.com/fyp/booth.shtml, 2010.
  L. Dadda, "Some schemes for parallel multipliers",
    Associazione Elettrotecnica et Elettronica Italiana, 1965.
  R. P. Brent, H. T. Kung, "A Regular Layout for Parallel Adders",
    IEEE Transactions on Computers, 1982.
"""

#
# Copyright 2016 Joris van Rantwijk
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.
#


import sys
import argparse


class Expr:
    """Represent a node in the expression tree."""

    wire = None
    done = False


class ConstBit(Expr):
    """Represent constant '0' or '1' bit."""

    def __init__(self, v):
        assert v in (0, 1)
        self.v = v


class InBit(Expr):
    """Represent an input bit in the expression tree."""

    def __init__(self, xy, p):
        assert xy in ('x', 'y')
        self.xy = xy
        self.p = p


class Reg(Expr):
    """Represent flip-flop."""

    def __init__(self, v):
        self.v = v


class NotBit(Expr):
    """Represent inverter."""

    def __init__(self, v):
        self.v = v


class BoothNeg(Expr):
    """Represent calculation of radix-4 Booth sign-inversion flag."""

    def __init__(self, pat):
        assert len(pat) == 3
        self.pat = pat


class BoothProd(Expr):
    """Represent calculation of partial product bit with radix-4 Booth."""

    def __init__(self, pat, b):
        assert len(pat) == 3
        assert len(b) == 2
        self.pat = pat
        self.b = b


class AddBitD(Expr):
    """Represent selection of data bit from adder."""

    def __init__(self, v):
        self.v = v


class AddBitC(Expr):
    """Represent selection of carry bit from adder."""

    def __init__(self, v):
        self.v = v


class HalfAdd(Expr):
    """Represent half adder."""

    def __init__(self, a, b):
        self.a = a
        self.b = b


class FullAdd(Expr):
    """Represent full adder."""

    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c


class CarryProp(Expr):
    """Represent base node of carry propagation tree."""

    def __init__(self, a, b):
        self.a = a
        self.b = b


class CarryMerge(Expr):
    """Represent internal node of carry propagation tree."""

    def __init__(self, p0, p1):
        self.p0 = p0
        self.p1 = p1


class CarryEval(Expr):
    """Represent logic to calculate carry-out."""

    def __init__(self, p, c):
        self.p = p
        self.c = c


def gen_partial_products(xvec, yvec):
    """Generate list of partial products using radix-4 Booth algorithm.

    Return [ (exponent, bit), ... ].
    """

    partial_products = [ ]

    # Append zero on LSB side of xvec, sign-extend on MSB side of xvec.
    xtmp = [ ConstBit(0) ] + xvec + xvec[-1:]

    # Append zero on LSB side of yvec, sign-extend on MSB side of yvec.
    ytmp = [ ConstBit(0) ] + yvec + yvec[-1:]

    # Step through xvec, 2 bits at a time.
    for i in xrange(0, len(xvec), 2):

        # Select group of 3 bits from xvec (one bit overlap with last group).
        pat = xtmp[i:i+3]

        # Add either 0, +1, +2, -1 or -2 times yvec according to Booth method.
        # Step through the bits of yvec.
        for j in xrange(len(yvec)+1):

            # Use Booth encoder to choose between 0, yvec[j], yvec[j-1] or
            # inverted bits yvec[j] or yvec[j-1].
            t = BoothProd(pat, ytmp[j:j+2])

            # Invert the MSB bit, except on first row.
            if i > 0 and j == len(yvec):
                t = NotBit(t)

            # Add result as partial product.
            partial_products.append( (i+j, t) )

        # For first row, sign-extend by two bits.
        # Apply sign inversion on the new MSB bit.
        if i == 0:
            partial_products.append( (i+len(yvec)+1, t) )
            partial_products.append( (i+len(yvec)+2, NotBit(t)) )

        # For each row except the first row, add constant 1 in the next column.
        if i > 0:
            partial_products.append( (i+len(yvec)+1, ConstBit(1)) )

        # Use Booth encoder to add 1 in case of negative factor (-1 or -2).
        t = BoothNeg(pat)
        partial_products.append( (i, t) )

    return partial_products


def gen_dadda_tree(partial_products, nbits):
    """Generate carry save adder based on Dadda tree."""

    # Sort partial products by bit position.
    tvec = [ [ ] for p in xrange(nbits) ]
    for (p, b) in partial_products:
        if p < nbits:
            tvec[p].append(b)

    # Build Dadda tree.
    while any([ len(t) > 3 for t in tvec ]):
        # New layer.
        nvec = [ [ ] for p in xrange(nbits+1) ]
        for p in xrange(nbits):
            t = tvec[p]
            i = 0
            while i + 2 < len(t):
                # build full adder
                a = FullAdd(t[i], t[i+1], t[i+2])
                nvec[p].append(AddBitD(a))
                nvec[p+1].append(AddBitC(a))
                i += 3
            if i + 1 < len(t) and len(nvec[p]) % 3 == 2:
                # build half adder
                a = HalfAdd(t[i], t[i+1])
                nvec[p].append(AddBitD(a))
                nvec[p+1].append(AddBitC(a))
                i += 2
            if i < len(t):
                # pass through
                nvec[p] += t[i:]
        tvec = nvec[:nbits]

    # Last layer.
    nvec = [ [ ] for p in xrange(nbits+1) ]
    for p in xrange(nbits):
        t = tvec[p]
        if len(t) == 3:
            # full adder
            a = FullAdd(t[0], t[1], t[2])
            nvec[p].append(AddBitD(a))
            nvec[p+1].append(AddBitC(a))
        elif len(t) == 2 and len(nvec[p]) > 0:
            # half adder
            a = HalfAdd(t[0], t[1])
            nvec[p].append(AddBitD(a))
            nvec[p+1].append(AddBitC(a))
        else:
            # pass through
            nvec[p] += t
    tvec = nvec[:nbits]

    # Extract remaining two rows of bits.
    avec = [ (t[0] if len(t) > 0 else ConstBit(0)) for t in tvec ]
    bvec = [ (t[1] if len(t) > 1 else ConstBit(0)) for t in tvec ]

    return (avec, bvec)


def gen_adder(avec, bvec):
    """Generate carry-lookahead adder."""

    def carry_lookahead(pvec, cin):
        """Recursively determine carry propagation."""

        if len(pvec) == 1:
            prop = pvec[0]
            cvec = [ cin ]
        else:
            k = (len(pvec) + 1) // 2
            (p0, c0) = carry_lookahead(pvec[:k], cin)
            ctmp  = CarryEval(p0, cin)
            (p1, c1) = carry_lookahead(pvec[k:], ctmp)
            prop  = CarryMerge(p0, p1)
            cvec = c0 + c1

        return (prop, cvec)

    assert len(avec) == len(bvec)

    # Determine carry-generate and carry-propagate for each position.
    pvec = [ CarryProp(a, b) for (a, b) in zip(avec, bvec) ]

    # Determine carry-in for each position.
    (prop, cvec) = carry_lookahead(pvec, ConstBit(0))

    # Array of full adders.
    sumvec = [ AddBitD(FullAdd(a, b, c))
               for (a, b, c) in zip(avec, bvec, cvec) ]

    return sumvec


def gen_multiplier(xbits, ybits, npipe):
    """Generate expression tree describing multiplier logic."""

    xvec = [ InBit('x', p) for p in xrange(xbits) ]
    yvec = [ InBit('y', p) for p in xrange(ybits) ]

    partial_products = gen_partial_products(xvec, yvec)
    (avec, bvec) = gen_dadda_tree(partial_products, xbits+ybits)

    if npipe > 0:
        avec = [ Reg(a) for a in avec ]
        bvec = [ Reg(b) for b in bvec ]

    zvec = gen_adder(avec, bvec)

    if npipe > 1:
        zvec = [ Reg(z) for z in zvec ]

    return zvec


def gen_netlist(node, wires, insts):
    """Generate netlist consisting of wires and component instances."""

    if node.done:
        # already processed this node
        return

    node.done = True

    if isinstance(node, ConstBit):
        # resolve during code generation
        node.wire = node
    elif isinstance(node, InBit):
        # resolve during code generation
        node.wire = node
    elif isinstance(node, Reg):
        # create output wire
        node.wire = 'wreg%d' % len(wires)
        wires.append(node.wire)
        # recurse
        gen_netlist(node.v, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, NotBit):
        # create output wire
        node.wire = 'winv%d' % len(wires)
        wires.append(node.wire)
        # recurse
        gen_netlist(node.v, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, BoothNeg):
        # create output wire
        node.wire = 'wboothneg%d' % len(wires)
        wires.append(node.wire)
        # recurse
        for v in node.pat:
            gen_netlist(v, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, BoothProd):
        # create output wire
        node.wire = 'wboothprod%d' % len(wires)
        wires.append(node.wire)
        # recurse
        for v in node.pat:
            gen_netlist(v, wires, insts)
        for v in node.b:
            gen_netlist(v, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, AddBitD):
        # recurse
        gen_netlist(node.v, wires, insts)
        node.wire = node.v.wire + 'd'
    elif isinstance(node, AddBitC):
        # recurse
        gen_netlist(node.v, wires, insts)
        node.wire = node.v.wire + 'c'
    elif isinstance(node, HalfAdd):
        # create output wires
        node.wire = 'wadd%d' % len(wires)
        wires.append(node.wire + 'd')
        wires.append(node.wire + 'c')
        # recurse
        gen_netlist(node.a, wires, insts)
        gen_netlist(node.b, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, FullAdd):
        # create output wires
        node.wire = 'wadd%d' % len(wires)
        wires.append(node.wire + 'd')
        wires.append(node.wire + 'c')
        # recurse
        gen_netlist(node.a, wires, insts)
        gen_netlist(node.b, wires, insts)
        gen_netlist(node.c, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, CarryProp):
        # create output wires
        node.wire = 'wcarry%d' % len(wires)
        wires.append(node.wire + 'g')
        wires.append(node.wire + 'p')
        # recurse
        gen_netlist(node.a, wires, insts)
        gen_netlist(node.b, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, CarryMerge):
        # create output wires
        node.wire = 'wcarry%d' % len(wires)
        wires.append(node.wire + 'g')
        wires.append(node.wire + 'p')
        # recurse
        gen_netlist(node.p0, wires, insts)
        gen_netlist(node.p1, wires, insts)
        # create instance
        insts.append(node)
    elif isinstance(node, CarryEval):
        # create output wire
        node.wire = 'wcarry%d' % len(wires)
        wires.append(node.wire)
        # recurse
        gen_netlist(node.p, wires, insts)
        gen_netlist(node.c, wires, insts)
        # create instance
        insts.append(node)
    else:
        assert False


def vhdl_inst(node):
    """Return (name, ports) for a given instance."""

    if isinstance(node, Reg):
        name  = 'smul_flipflop'
        ports = ( 'clk', 'clken', node.v.wire, node.wire )
    elif isinstance(node, NotBit):
        name  = 'smul_inverter'
        ports = ( node.v.wire, node.wire )
    elif isinstance(node, BoothNeg):
        name  = 'smul_booth_neg'
        ports = ( node.pat[0].wire, node.pat[1].wire, node.pat[2].wire,
                  node.wire )
    elif isinstance(node, BoothProd):
        name  = 'smul_booth_prod'
        ports = ( node.pat[0].wire, node.pat[1].wire, node.pat[2].wire,
                  node.b[0].wire, node.b[1].wire,
                  node.wire )
    elif isinstance(node, HalfAdd):
        name  = 'smul_half_add'
        ports = ( node.a.wire, node.b.wire,
                  node.wire + 'd', node.wire + 'c' )
    elif isinstance(node, FullAdd):
        name  = 'smul_full_add'
        ports = ( node.a.wire, node.b.wire, node.c.wire,
                  node.wire + 'd', node.wire + 'c' )
    elif isinstance(node, CarryProp):
        name  = 'smul_carry_prop'
        ports = ( node.a.wire, node.b.wire,
                  node.wire + 'g', node.wire + 'p' )
    elif isinstance(node, CarryMerge):
        name  = 'smul_carry_merge'
        ports = ( node.p0.wire + 'g', node.p0.wire + 'p',
                  node.p1.wire + 'g', node.p1.wire + 'p',
                  node.wire + 'g', node.wire + 'p' )
    elif isinstance(node, CarryEval):
        name  = 'smul_carry_eval'
        ports = ( node.p.wire + 'g', node.p.wire + 'p', node.c.wire,
                  node.wire )
    else:
        assert False

    return (name, ports)


def vhdl_wire(wire):
    """Resolve wire to VHDL expression string."""

    if isinstance(wire, ConstBit):
        return "'%d'" % wire.v
    elif isinstance(wire, InBit):
        return "%sin(%d)" % (wire.xy, wire.p)
    else:
        assert isinstance(wire, str)
        return wire


def gen_vhdl_lib():
    """Generate VHDL code for library components."""

    print """
--
-- Flip-flop.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_flipflop is
    port (
        clk:    in  std_ulogic;
        clken:  in  std_ulogic;
        d:      in  std_ulogic;
        q:      out std_ulogic );
end entity;

architecture smul_flipflop_arch of smul_flipflop is
begin
    process (clk) is
    begin
        if rising_edge(clk) then
            if to_x01(clken) = '1' then
                q <= d;
            end if;
        end if;
    end process;
end architecture;


--
-- Inverter.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_inverter is
    port (
        d:      in  std_ulogic;
        q:      out std_ulogic );
end entity;

architecture smul_inverter_arch of smul_inverter is
begin
    q <= not d;
end architecture;


--
-- Half-adder.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_half_add is
    port (
        x:      in  std_ulogic;
        y:      in  std_ulogic;
        d:      out std_ulogic;
        c:      out std_ulogic );
end entity;

architecture smul_half_add_arch of smul_half_add is
begin
    d <= x xor y;
    c <= x and y;
end architecture;


--
-- Full-adder.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_full_add is
    port (
        x:      in  std_ulogic;
        y:      in  std_ulogic;
        z:      in  std_ulogic;
        d:      out std_ulogic;
        c:      out std_ulogic );
end entity;

architecture smul_full_add_arch of smul_full_add is
begin
    d <= x xor y xor z;
    c <= (x and y) or (y and z) or (x and z);
end architecture;


--
-- Booth negative flag.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_booth_neg is
    port (
        p0:     in  std_ulogic;
        p1:     in  std_ulogic;
        p2:     in  std_ulogic;
        f:      out std_ulogic );
end entity;

architecture smul_booth_neg_arch of smul_booth_neg is
begin
    f <= p2 and ((not p1) or (not p0));
end architecture;


--
-- Booth partial product generation.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_booth_prod is
    port (
        p0:     in  std_ulogic;
        p1:     in  std_ulogic;
        p2:     in  std_ulogic;
        b0:     in  std_ulogic;
        b1:     in  std_ulogic;
        y:      out std_ulogic );
end entity;

architecture smul_booth_prod_arch of smul_booth_prod is
begin
    process (p0, p1, p2, b0, b1) is
        variable p: std_ulogic_vector(2 downto 0);
    begin
        p := (p2, p1, p0);
        case p is
            when "000"  => y <= '0';            -- factor 0
            when "001"  => y <= b1;             -- factor 1
            when "010"  => y <= b1;             -- factor 1
            when "011"  => y <= b0;             -- factor 2
            when "100"  => y <= not b0;         -- factor -2
            when "101"  => y <= not b1;         -- factor -1
            when "110"  => y <= not b1;         -- factor -1
            when others => y <= '0';            -- factor 0
        end case;
    end process;
end architecture;


--
-- Determine carry generate and carry propagate.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_carry_prop is
    port (
        a:      in  std_ulogic;
        b:      in  std_ulogic;
        g:      out std_ulogic;
        p:      out std_ulogic );
end entity;

architecture smul_carry_prop of smul_carry_prop is
begin
    g <= a and b;
    p <= a xor b;
end architecture;


--
-- Merge two carry propagation trees.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_carry_merge is
    port (
        g0:     in  std_ulogic;
        p0:     in  std_ulogic;
        g1:     in  std_ulogic;
        p1:     in  std_ulogic;
        g:      out std_ulogic;
        p:      out std_ulogic );
end entity;

architecture smul_carry_merge of smul_carry_merge is
begin
    g <= g1 or (g0 and p1);
    p <= p0 and p1;
end architecture;


--
-- Calculate carry-out through a carry propagation tree.
--

library ieee;
use ieee.std_logic_1164.all;

entity smul_carry_eval is
    port (
        g:      in  std_ulogic;
        p:      in  std_ulogic;
        cin:    in  std_ulogic;
        cout:   out std_ulogic );
end entity;

architecture smul_carry_eval of smul_carry_eval is
begin
    cout <= g or (p and cin);
end architecture;
"""


def gen_vhdl_mul(xbits, ybits, npipe, wires, insts, outputs):
    """Generate VHDL code and write to stdout."""

    # Declaration.
    print """
---
--- %(xbits)d x %(ybits)d bit signed multiplier
---
--- %(npipe)d cycles pipeline delay
---

library ieee;
use ieee.std_logic_1164.all;

entity smul_%(xbits)d_%(ybits)d is
    port (
        clk:    in  std_ulogic;
        clken:  in  std_ulogic;
        xin:    in  std_logic_vector(%(xleft)d downto 0);
        yin:    in  std_logic_vector(%(yleft)d downto 0);
        zout:   out std_logic_vector(%(zleft)d downto 0) );
end entity;

architecture arch of smul_%(xbits)d_%(ybits)d is
""" % { 'xbits': xbits, 'ybits': ybits,
        'npipe': npipe,
        'xleft': xbits-1, 'yleft': ybits-1,
        'zleft': xbits+ybits-1 }

    # Declare signals.
    for w in wires:
        print "signal %s: std_ulogic;" % w

    # Start architecture body.
    print
    print "begin"
    print

    # Instantiate components.
    for (i, node) in enumerate(insts):
        (name, ports) = vhdl_inst(node)
        print "u%d: entity work.%s port map (" % (i, name),
        print ", ".join([ vhdl_wire(p) for p in ports ]),
        print ");"

    print

    # Drive output signals.
    for (i, wire) in enumerate(outputs):
        print "zout(%d) <= %s;" % (i, vhdl_wire(wire)) 

    # End architecture.
    print
    print "end architecture;"


def verilog_wire(wire):
    """Resolve wire to Verilog expression string."""

    if isinstance(wire, ConstBit):
        return "1'b%d" % wire.v
    elif isinstance(wire, InBit):
        return "%sin[%d]" % (wire.xy, wire.p)
    else:
        assert isinstance(wire, str)
        return wire


def gen_verilog_lib():
    """Generate Verilog code for library components."""

    print """
// Flip-flop.

module smul_flipflop (
    input  wire clk,
    input  wire clken,
    input  wire d,
    output reg  q );

always @(posedge clk)
begin
    if (clken)
        q <= d;
end

endmodule


// Inverter.

module smul_inverter (
    input  wire d,
    output wire q );

assign q = ~d;

endmodule


// Half-adder.

module smul_half_add (
    input  wire x,
    input  wire y,
    output wire d,
    output wire c );

assign d = x ^ y;
assign c = x & y;

endmodule


// Full-adder.

module smul_full_add (
    input  wire x,
    input  wire y,
    input  wire z,
    output wire d,
    output wire c );

assign d = x ^ y ^ z;
assign c = (x & y) | (y & z) | (x & z);

endmodule


// Booth negative flag.

module smul_booth_neg (
    input  wire p0,
    input  wire p1,
    input  wire p2,
    output wire f );

assign f = p2 & ((~p1) | (~p0));

endmodule


// Booth partial product generator.

module smul_booth_prod (
    input  wire p0,
    input  wire p1,
    input  wire p2,
    input  wire u0,
    input  wire u1,
    output reg  y );

always @ (*)
begin
    case ({p2, p1, p0})
        3'b000  : y = 1'b0;
        3'b001  : y = u1;
        3'b010  : y = u1;
        3'b011  : y = u0;
        3'b100  : y = ~u0;
        3'b101  : y = ~u1;
        3'b110  : y = ~u1;
        default : y = 1'b0;
    endcase
end

endmodule


// Deterimine carry generate and carry propagate.

module smul_carry_prop (
    input  wire a,
    input  wire b,
    output wire g,
    output wire p );

assign g = a & b;
assign p = a ^ b;

endmodule


// Merge two carry propagation trees.

module smul_carry_merge (
    input  wire g0,
    input  wire p0,
    input  wire g1,
    input  wire p1,
    output wire g,
    output wire p );

assign g = g1 | (g0 & p1);
assign p = p0 & p1;

endmodule


// Calculate carry-out through a carry propagation tree.

module smul_carry_eval (
    input  wire g,
    input  wire p,
    input  wire cin,
    output wire cout );

assign cout = g | (p & cin);

endmodule
"""


def gen_verilog_mul(xbits, ybits, npipe, wires, insts, outputs):
    """Generate Verilog code and write to stdout."""

    # Preamble.
    print """
/*
 * %(xbits)d x %(ybits)d bit signed multiplier
 *
 * %(npipe)d cycles pipeline delay
 */

module smul_%(xbits)d_%(ybits)d (
    input  wire clk,
    input  wire clken,
    input  wire [%(xleft)d:0] xin,
    input  wire [%(yleft)d:0] yin,
    output wire [%(zleft)d:0] zout );
""" % { 'xbits': xbits, 'ybits': ybits,
        'npipe': npipe,
        'xleft': xbits-1, 'yleft': ybits-1,
        'zleft': xbits+ybits-1 }

    # Declare signals.
    for w in wires:
        print "wire %s;" % w

    # Instantiate components.
    for (i, node) in enumerate(insts):
        (name, ports) = vhdl_inst(node)
        print "%s u%d (" % (name, i),
        print ", ".join([ verilog_wire(p) for p in ports ]),
        print ");"

    print

    # Drive output signals.
    for (i, wire) in enumerate(outputs):
        print "assign zout[%d] = %s;" % (i, verilog_wire(wire))

    # End module.
    print
    print "endmodule"


def main():

    parser = argparse.ArgumentParser()
    parser.format_help  = lambda: __doc__
    parser.format_usage = lambda: __doc__

    parser.add_argument('--lang', action='store', type=str)
    parser.add_argument('--nolib', action='store_true', default=False)
    parser.add_argument('--lib', action='store_true', default=False)
    parser.add_argument('Xbits', action='store', type=int, nargs='?')
    parser.add_argument('Ybits', action='store', type=int, nargs='?')
    parser.add_argument('npipe', action='store', type=int, nargs='?')

    args = parser.parse_args()

    if args.lang is None or args.lang.upper() not in ('VHDL', 'VERILOG'):
        print >>sys.stderr, __doc__
        print >>sys.stderr, "ERROR: Must specify --lang=vhdl or --lang=verilog"
        sys.exit(1)

    if args.lib:
        if (args.nolib or
            args.Xbits is not None or
            args.Ybits is not None or
            args.npipe is not None):
            print >>sys.stderr, __doc__
            print >>sys.stderr, "ERROR: Must specify either --lib or",
            print >>sys.stderr, "Xbits, Ybits, npipe"
            sys.exit(1)
    else:
        if (args.Xbits is None or args.Ybits is None or args.npipe is None):
            print >>sys.stderr, __doc__
            print >>sys.stderr, "ERROR: Must specify either --lib or",
            print >>sys.stderr, "Xbits, Ybits, npipe"
            sys.exit(1)

        if args.Xbits < 4 or args.Ybits < args.Xbits:
            print >>sys.stderr, "ERROR: invalid word lengths"
            sys.exit(1)

        if args.npipe < 0 or args.npipe > 2:
            print >>sys.stderr, "ERROR: invalid number of register stages"
            sys.exit(1)

    if not args.lib:
        # Generate expression tree.
        zvec = gen_multiplier(args.Xbits, args.Ybits, args.npipe)

        # Generate wires and instances.
        wires = [ ]
        insts = [ ]
        for node in zvec:
            gen_netlist(node, wires, insts)
        outputs = [ node.wire for node in zvec ]

    # Write library components.
    if not args.nolib:
        if args.lang.upper() == 'VHDL':
            gen_vhdl_lib()
        elif args.lang.upper() == 'VERILOG':
            gen_verilog_lib()

    # Write multiplier.
    if not args.lib:
        if args.lang.upper() == 'VHDL':
            gen_vhdl_mul(args.Xbits, args.Ybits, args.npipe,
                         wires, insts, outputs)
        elif args.lang.upper() == 'VERILOG':
            gen_verilog_mul(args.Xbits, args.Ybits, args.npipe,
                            wires, insts, outputs)


if __name__ == '__main__':
    main()

# end
