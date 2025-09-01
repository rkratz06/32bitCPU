--instruction fetch module
--design is redundant, just uses instruction register, BUT useful for organization
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fetch is
	port(
	clk, reset : in std_logic;
	IR : out std_logic_vector(31 downto 0);
	PC_out : out std_logic_vector(31 downto 0)
	);
end fetch;

architecture behavior of fetch is
component CPUROM
	port(
		address		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component instructionRegister
	port(
		INPUT : in std_logic_vector(31 downto 0);
		IR_LD, reset, clk : in std_logic;
		IR : out std_logic_vector(31 downto 0)
	);
end component;

signal PC_internal, PC_reg, ROM_data: std_logic_vector(31 downto 0);

begin
	CPUROM_inst : CPUROM port map(address => PC_reg(13 downto 0), clock => clk, q => ROM_data);
	instructionRegister_inst : instructionRegister port map (INPUT => ROM_data, clk => clk, IR_LD => '1', reset => reset, IR => IR);
	process(clk, reset)
	begin
		if reset = '1' then
			PC_reg <= (others => '0');
		elsif rising_edge(clk) then
			PC_internal <= std_logic_vector(unsigned(PC_internal) + 4);
			PC_reg <= PC_internal;
		end if;
	end process;
	PC_out <= PC_reg;
end behavior;