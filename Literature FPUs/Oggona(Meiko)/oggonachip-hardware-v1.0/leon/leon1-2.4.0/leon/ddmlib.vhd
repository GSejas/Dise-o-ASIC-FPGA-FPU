LIBRARY ieee;
use IEEE.std_logic_1164.all;
use work.iface.all;
use work.amba.all;

package ddmlib is
component ddm 
  port (
    rst   : in  std_logic;  
    clk   : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    ahbi   : in  ahb_mst_in_type;
    ahbo   : out ahb_mst_out_type;
    ddmi  : in  ddm_in_type;
    ddmo  : out ddm_out_type
);
end component;


end; 



