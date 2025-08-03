--instruction register

library ieee;
use ieee.std_logic_1164.all;

entity instructionRegister is
	port(
		INPUT : in std_logic_vector(31 downto 0);
		IR_LD : in std_logic;
		clk: in std_logic;
		reset: in std_logic;
		IR: out std_logic_vector(31 downto 0));
end instructionRegister;

architecture behavior of instructionRegister is
signal IR_internal : std_logic_vector(31 downto 0);
begin
	process(clk, reset)
	begin
		if reset = '1' then
			IR_internal <= (others => '0');
		elsif rising_edge(clk) then
			if IR_LD = '1' then
				IR_internal <= INPUT;
			end if;
		end if;
	end process;
	IR <= IR_internal;
end behavior;
			