-- regfile_pkg.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package regfile_pkg is
    type regfile_array is array (31 downto 0) of std_logic_vector(31 downto 0);
end package;

package body regfile_pkg is
end package body;