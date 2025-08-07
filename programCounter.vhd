--program counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programCounter is 
	port(
		PC_next : in std_logic_vector(31 downto 0);
		clk: in std_logic;
		PC_LD: in std_logic;
		reset: in std_logic;
		PC: out std_logic_vector(31 downto 0));
end programCounter;

architecture behavior of programCounter is 
signal PC_internal: std_logic_vector(31 downto 0) := (others => '0');
begin
	process(clk, reset)
	begin
		if reset = '1' then
				PC_internal <= (others => '0');
		elsif rising_edge(clk) then
			if PC_LD = '1' then
				PC_internal <= PC_next; --loads lower bits with input
			end if;
		end if;
	end process;
	PC <= PC_internal;
end behavior;