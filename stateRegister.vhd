--state register

library ieee;
use ieee.std_logic_1164.all;

entity stateRegister is
	port(
		D : in std_logic_vector(4 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(4 downto 0));
end stateRegister;

architecture behavior of stateRegister is
signal Q_internal : std_logic_vector(4 downto 0);
begin
	process(clk, reset)
	begin
		if reset = '1' then
			Q_internal <= "00000";
		elsif rising_edge(clk) then
			Q_internal <= D;
		end if;
	end process;
	Q <= Q_internal;
end behavior;