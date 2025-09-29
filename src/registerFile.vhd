--32 32-bit registers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.regfile_pkg.all;

entity registerFile is 
	port(
		clk, reset : in std_logic;
		we : in std_logic; --write enable, writes when true, reads when false
		writeReg : in std_logic_vector(4 downto 0) := (others => '0');
		readReg1 : in std_logic_vector(4 downto 0) := (others => '0'); 
		readReg2 : in std_logic_vector(4 downto 0) := (others => '0'); 
		writeData : in std_logic_vector(31 downto 0); --data to write to register
		readData1 : out std_logic_vector(31 downto 0); --data contained in chosen register 1
		readData2 : out std_logic_vector(31 downto 0); --data contained in chosen register 2
		regs_out : out regfile_array); --used in testbenches. disconnect when programming to de10
end registerFile;

architecture behavior of registerFile is

	signal regs : regfile_array := (others => (others => '0')); --initalizes signal regs to contain registers of 0
	
	begin
		process(clk)
		begin
			if rising_edge(clk) then
				if reset = '1' then
					for i in 0 to 31 loop
						regs(i) <= (others => '0');
					end loop;
				elsif (we = '1' and writeReg /= "00000") then --write enable must be true, and register x0 cannot be written to and will remain containing the value 0x00000000
					regs(to_integer(unsigned(writeReg))) <= writeData;
				end if;
			end if;
		end process;
		
		readData1 <= regs(to_integer(unsigned(readReg1))); --async read 
		readData2 <= regs(to_integer(unsigned(readReg2)));
		
		regs_out <= regs;
end behavior;
	