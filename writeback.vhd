--writeback module
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity writeback is
	port(
		writeData : in std_logic_vector(31 downto 0);
		REGwe, clk, reset : in std_logic;
		rd_index : in std_logic_vector(4 downto 0);
		REGwe_out : out std_logic;
		writeData_out : out std_logic_vector(31 downto 0);
		rd_index_out : out std_logic_vector(4 downto 0)
	);
end writeback;

architecture behavior of writeback is
signal REGwe_internal, REGwe_reg : std_logic;
signal rd_index_internal, rd_index_reg : std_logic_vector(4 downto 0);
signal writeData_internal, writeData_reg : std_logic_vector(31 downto 0);
begin
	REGwe_internal <= REGwe;
	rd_index_internal <= rd_index;
	writeData_internal <= writeData;
	process(clk, reset)
		begin
			if reset = '1' then
				REGwe_reg <= '0';
				rd_index_reg <= (others => '0');
				writeData_reg <= (others => '0');
			elsif rising_edge(clk) then
				REGwe_reg <= REGwe_internal;
				rd_index_reg <= rd_index_internal;
				writeData_reg <= writeData_internal;
			end if;
		end process;
	REGwe_out <= REGwe_reg;
	rd_index_out <= rd_index_reg;
	writeData_out <= writeData_reg;
end behavior;