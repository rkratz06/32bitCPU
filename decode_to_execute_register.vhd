--decode to execute register for rs1 and rs2 (expanded later)
library ieee;
use ieee.std_logic_1164.all;

entity decode_to_execute_register is
	port(
		clk, reset : in std_logic;
		rs1, rs2 : in std_logic_vector(31 downto 0);
		rs1_out, rs2_out : out std_logic_vector(31 downto 0));
end decode_to_execute_register;

architecture behavior of decode_to_execute_register is
signal rs1_internal, rs1_reg, rs2_internal, rs2_reg : std_logic_vector(31 downto 0) := (others => '0');
begin
	rs1_internal <= rs1;
	rs2_internal <= rs2;
	process(clk, reset)
	begin
		if reset = '1' then
			rs1_reg <= (others => '0');
			rs2_reg <= (others => '0');
		elsif rising_edge(clk) then
			rs1_reg <= rs1_internal;
			rs2_reg <= rs2_internal;
		end if;
	end process;
	rs1_out <= rs1_reg;
	rs2_out <= rs2_reg;
end behavior;