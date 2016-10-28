--
-- Test bench for signed multiplier.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity;

architecture arch of tb is

    procedure test_mul(constant xbits: in  integer;
                       constant ybits: in  integer;
                       constant npipe: in  integer;
                       signal   clk:   out std_ulogic;
                       signal   xin:   out std_logic_vector;
                       signal   yin:   out std_logic_vector;
                       signal   zout:  in  std_logic_vector) is
        variable all_x: boolean;
        variable all_y: boolean;
        variable num_x: integer;
        variable num_y: integer;
        variable x: integer;
        variable y: integer;
        variable i: integer;
        type pipe_type is array (0 to npipe) of integer;
        variable px, py: pipe_type;
    begin

        -- Test all X inputs if xbits <= 11; otherwise test a subset.
        all_x := (xbits <= 11);
        if all_x then
            num_x := 2**xbits;
        else
            num_x := (xbits-8) * 2 * 256;
        end if;

        -- Test all Y inputs if ybits <= 11; otherwise test a subset.
        all_y := (ybits <= 11);
        if all_y then
            num_y := 2**ybits;
        else
            num_y := (ybits-8) * 2 * 256;
        end if;

        i := 0;

        for kx in 0 to num_x-1 loop

            if all_x then
                x := kx - 2**(xbits-1);
            else
                x := (kx mod 512 - 256) * 2**(kx/512);
            end if;

            for ky in 0 to num_y-1 loop

                if all_y then
                    y := ky - 2**(ybits-1);
                else
                    y := (ky mod 512 - 256) * (2**(ky/512));
                end if;

                clk <= '0';
                xin <= std_logic_vector(to_signed(x, xbits));
                yin <= std_logic_vector(to_signed(y, ybits));
                wait for 5 ns;

                px(1 to npipe) := px(0 to npipe-1);
                py(1 to npipe) := py(0 to npipe-1);
                px(0) := x;
                py(0) := y;

                if i >= npipe then
                    assert zout =
                        std_logic_vector(to_signed(px(npipe), xbits) *
                                         to_signed(py(npipe), ybits));
                end if;

                clk <= '1';
                wait for 5 ns;

                i := i + 1;

            end loop;
        end loop;

        xin(xin'high downto xin'low) <= (others => 'U');
        yin(yin'high downto yin'low) <= (others => 'U');

        for i in 1 to npipe loop

            px(1 to npipe) := px(0 to npipe-1);
            py(1 to npipe) := py(0 to npipe-1);
            assert zout = std_logic_vector(to_signed(px(npipe), xbits) *
                                           to_signed(py(npipe), ybits));

            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;

        end loop;
   
        clk <= '0';

    end procedure; 

    signal s1_clk:  std_ulogic;
    signal s1_xin:  std_logic_vector(3 downto 0);
    signal s1_yin:  std_logic_vector(3 downto 0);
    signal s1_zout: std_logic_vector(7 downto 0);
    signal s2_clk:  std_ulogic;
    signal s2_xin:  std_logic_vector(6 downto 0);
    signal s2_yin:  std_logic_vector(7 downto 0);
    signal s2_zout: std_logic_vector(14 downto 0);
    signal s3_clk:  std_ulogic;
    signal s3_xin:  std_logic_vector(7 downto 0);
    signal s3_yin:  std_logic_vector(7 downto 0);
    signal s3_zout: std_logic_vector(15 downto 0);
    signal s4_clk:  std_ulogic;
    signal s4_xin:  std_logic_vector(9 downto 0);
    signal s4_yin:  std_logic_vector(10 downto 0);
    signal s4_zout: std_logic_vector(20 downto 0);
    signal s5_clk:  std_ulogic;
    signal s5_xin:  std_logic_vector(3 downto 0);
    signal s5_yin:  std_logic_vector(11 downto 0);
    signal s5_zout: std_logic_vector(15 downto 0);
    signal s6_clk:  std_ulogic;
    signal s6_xin:  std_logic_vector(17 downto 0);
    signal s6_yin:  std_logic_vector(17 downto 0);
    signal s6_zout: std_logic_vector(35 downto 0);
    signal s7_clk:  std_ulogic;
    signal s7_xin:  std_logic_vector(18 downto 0);
    signal s7_yin:  std_logic_vector(23 downto 0);
    signal s7_zout: std_logic_vector(42 downto 0);

begin

    -- Signed 4x4 multiplier, latency 0 clocks.
    u1: entity work.smul_4_4
        port map ( clk => s1_clk,
                   clken => '1',
                   xin => s1_xin,
                   yin => s1_yin,
                   zout => s1_zout );

    -- Signed 7x8 multiplier, latency 0 clocks.
    u2: entity work.smul_7_8
        port map ( clk => s2_clk,
                   clken => '1',
                   xin => s2_xin,
                   yin => s2_yin,
                   zout => s2_zout );

    -- Signex 8x8 multiplier, latency 0 clocks.
    u3: entity work.smul_8_8
        port map ( clk => s3_clk,
                   clken => '1',
                   xin => s3_xin,
                   yin => s3_yin,
                   zout => s3_zout );

    -- Signex 10x11 multiplier, latency 0 clocks.
    u4: entity work.smul_10_11
       port map ( clk => s4_clk,
                  clken => '1',
                  xin => s4_xin,
                  yin => s4_yin,
                  zout => s4_zout );

    -- Signex 4x12 multiplier, latency 1 clock.
    u5: entity work.smul_4_12
       port map ( clk => s5_clk,
                  clken => '1',
                  xin => s5_xin,
                  yin => s5_yin,
                  zout => s5_zout );

    -- Signex 18x18 multiplier, latency 2 clocks.
    u6: entity work.smul_18_18
       port map ( clk => s6_clk,
                  clken => '1',
                  xin => s6_xin,
                  yin => s6_yin,
                  zout => s6_zout );

    -- Signex 19x24 multiplier, latency 1 clock.
    u7: entity work.smul_19_24
       port map ( clk => s7_clk,
                  clken => '1',
                  xin => s7_xin,
                  yin => s7_yin,
                  zout => s7_zout );

    process is
    begin

        report "Start test bench";

        report "Testing 4x4 multiplier, latency 0";
        test_mul(4, 4, 0, s1_clk, s1_xin, s1_yin, s1_zout);

        report "Testing 7x8 multiplier, latency 0";
        test_mul(7, 8, 0, s2_clk, s2_xin, s2_yin, s2_zout);

        report "Testing 8x8 multiplier, latency 0";
        test_mul(8, 8, 0, s3_clk, s3_xin, s3_yin, s3_zout);

        report "Testing 10x11 multiplier, latency 0";
        test_mul(10, 11, 0, s4_clk, s4_xin, s4_yin, s4_zout);

        report "Testing 4x12 multiplier, latency 1 (subset of inputs)";
        test_mul(4, 12, 1, s5_clk, s5_xin, s5_yin, s5_zout);

        report "Testing 18x18 multiplier, latency 2 (subset of inputs)";
        test_mul(18, 18, 2, s6_clk, s6_xin, s6_yin, s6_zout);

        report "Testing 19x24 multiplier, latency 1 (subset of inputs)";
        test_mul(19, 24, 1, s7_clk, s7_xin, s7_yin, s7_zout);

        report "End test bench";
        wait;

    end process;

end architecture;
