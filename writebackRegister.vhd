--writeback register

library ieee;
use ieee.std_logic_1164.all;

entity writebackRegister is
	port(
		newData : in std_logic_vector(31 downto 0);
		updateWritebackReg : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		writebackData : out std_logic_vector(31 downto 0));
end writebackRegister;

architecture behavior of writebackRegister is
begin
	process(reset, clk)
	begin
	if reset = '1' then
		writebackData <= x"00000000";
	elsif rising_edge(clk) and updateWritebackReg = '1' then
		writebackData <= newData;
	end if;
	end process;
end behavior;