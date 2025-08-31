--writeback module
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity writeback is
	port(
		writeData : in std_logic_vector(31 downto 0);
		REGwe, clk, reset : in std_logic;
		rd_index : in std_logic_vector(4 downto 0);
	);
end writeback;

architecture behavior of writeback
component registerFile --only writing
	port(
		clk : in std_logic;
		we : in std_logic; --write enable, writes when true, reads when false
		writeReg : in std_logic_vector(4 downto 0);
		readReg1 : in std_logic_vector(4 downto 0); 
		readReg2 : in std_logic_vector(4 downto 0); 
		writeData : in std_logic_vector(31 downto 0); --data to write to register
		readData1 : out std_logic_vector(31 downto 0); --data contained in chosen register 1
		readData2 : out std_logic_vector(31 downto 0)); --data contained in chosen register 2
end registerFile;
begin
	process(clk, reset, REGwe)
	begin
		if reset = '0' & rising_edge(clk) then
			registerFile_inst : registerFile port map (clk => clk, we => REGwe, writeReg => rd_index, readReg1 => (others => '0'), readReg2 => (others => '0'), writeData => writeData);
		end if;	
	end process;
end behavior;