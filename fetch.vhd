--instruction fetch module
--design is redundant, just uses instruction register, BUT useful for organization
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fetch is
	port(
	ROM_in, PC : in std_logic_vector(31 downto 0);
	clk, reset : in std_logic;
	IR : out std_logic;
	PC_out : out std_logic_vector(31 downto 0);
	);
end fetch;



architecture behavior of fetch is
component instructionRegister
	port(
		INPUT : in std_logic_vector(31 downto 0);
		IR_LD, reset, clk : in std_logic
	);
end component;

signal PC_internal, PC_reg : std_logic_vector(31 downto 0);

begin
	PC_internal <= PC;
	instructionRegister_inst : instructionRegister port map (INPUT => ROM_in, clk => clk, IR_LD => '1', reset => reset, IR => IR);
	process(clk, reset):
		if reset = '1' then
			PC_internal <= (others => '0');
		elsif rising_edge(clk)
			PC_reg <= PC_internal;
		end if;
	end process;
	PC_reg <= PC_internal;
end behavior;