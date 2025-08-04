--program counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programCounter is 
	port(
		immediate: in std_logic_vector(31 downto 0); --RISCV RV32I supports branching with addresses of IMM[12|10:5|4:1|11]
		clk: in std_logic;
		PC_INC: in std_logic;
		PC_LD: in std_logic;
		reset: in std_logic;
		PC: out std_logic_vector(13 downto 0));
end programCounter;

architecture behavior of programCounter is 
signal PC_internal: std_logic_vector(13 downto 0) := (others => '0');
signal immediate_internal: std_logic_vector(12 downto 0) := (others => '0');
begin
	immediate_internal <= immediate(12 downto 0);
	process(clk, reset)
	begin
		if reset = '1' then
				PC_internal <= (others => '0');
		elsif rising_edge(clk) then
			if PC_LD = '1' then
				PC_internal(12 downto 0) <= immediate_internal; --loads lower bits with input
			elsif PC_INC = '1' then
				PC_internal <= std_logic_vector(unsigned(PC_internal) + 1);
			end if;
		end if;
	end process;
	PC <= PC_internal;
end behavior;