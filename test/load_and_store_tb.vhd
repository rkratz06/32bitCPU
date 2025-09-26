--test of load and store instructions
library ieee;
use ieee.std_logic_1164.all;
use work.regfile_pkg.all;
entity load_and_store_tb is
	port(
		clk : in std_logic;
		reset : in std_logic;
		regs : in regfile_array
		);
end load_and_store_tb;

architecture behavior of load_and_store_tb is

begin
	check_process : process(clk)
	begin
		if rising_edge(clk) then
			assert regs(0) = x"00000000";
			report "r0 is not equal to 0" severity error;
		end if;
	end process;
end behavior;