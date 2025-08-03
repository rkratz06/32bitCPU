--32 32-bit registers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerFile is 
	port(
		clk : in std_logic;
		we : in std_logic; --write enable, writes when true, reads when false
		writeReg : in integer;
		readReg1 : in integer; 
		readReg2 : in integer; 
		writeData : in std_logic_vector(31 downto 0); --data to write to register
		readData1 : out std_logic_vector(31 downto 0); --data contained in chosen register 1
		readData2 : out std_logic_vector(31 downto 0)); --data contained in chosen register 2
end registerFile;

architecture behavior of registerFile is
	type regfile_array is array (31 downto 0) of std_logic_vector(31 downto 0); --32 registers in a vector
	signal regs : regfile_array := (others => (others => '0')); --initalizes signal regs to contain registers of 0
	
	begin
		
		process(clk)
		begin
			if rising_edge(clk) then
				if we = '1' then
					regs(writeReg) <= writeData;
				end if;
			end if;
		end process;
		
		readData1 <= regs(readReg1); --async read 
		readData2 <= regs(readReg2);
		
end behavior;
	