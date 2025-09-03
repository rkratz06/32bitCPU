--instruction fetch module
--design is redundant, just uses instruction register, BUT useful for organization
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fetch is
	port(
	clk, reset, jump_or_branch_flag : in std_logic; --comes from execute state
	new_address : in std_logic_vector(31 downto 0); --comes from execute state, will be jump address if jump, will be branch target if branch taken
	PC_out : out std_logic_vector(31 downto 0)
	);
end fetch;

architecture behavior of fetch is
component instructionRegister
	port(
		INPUT : in std_logic_vector(31 downto 0);
		IR_LD, reset, clk : in std_logic;
		IR : out std_logic_vector(31 downto 0)
	);
end component;

signal PC_internal, PC_reg, ROM_data: std_logic_vector(31 downto 0) := (others => '0');

begin
	process(clk, reset)
	begin
		if reset = '1' then
			PC_reg <= (others => '0');
		elsif rising_edge(clk) then
			if jump_or_branch_flag = '1' then
				PC_internal <= new_address;
			else
				PC_internal <= std_logic_vector(unsigned(PC_internal) + 4);
			end if;
			PC_reg <= PC_internal;
		end if;
	end process;
	PC_out <= PC_reg;
end behavior;