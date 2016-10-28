
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

