--testbench file

library ieee;
use ieee.std_logic_1164.all;

entity CPU32bit_tb is
end CPU32bit_tb;

architecture behavior of CPU32bit_tb is
signal clk_tb : std_logic := '0';
signal reset_tb : std_logic := '1';
signal PC_tb, rs1_tb, rs2_tb, writeData_tb, IR_tb, immediate_tb : std_logic_vector(31 downto 0);
signal rs1_index_tb, rs2_index_tb, rd_index_tb, shamt_tb : std_logic_vector(4 downto 0);
signal opcode_tb, func7_tb : std_logic_vector(6 downto 0);
signal func3_tb, instructionType_tb : std_logic_vector(2 downto 0);
signal RAMen_tb, RAMwe_tb, REGwe_tb : std_logic;
begin

    dut: entity work.CPU32bit
        port map(
            clk => clk_tb,
            reset => reset_tb,
				PC => PC_tb,
				rs1 => rs1_tb,
				rs2 => rs2_tb,
				writeData => writeData_tb,
				IR => IR_tb,
				immediate => immediate_tb,
				rs1_index => rs1_index_tb, 
				rs2_index => rs2_index_tb,
				rd_index => rd_index_tb,
				shamt => shamt_tb,
				opcode => opcode_tb,
				func7 => func7_tb,
				func3 => func3_tb,
				instructionType => instructionType_tb,
				RAMen => RAMen_tb,
				RAMwe => RAMwe_tb,
				REGwe => REGwe_tb
        );
		  clk_tb <= not clk_tb after 1ns;
		  reset_tb <= '1', '0' after 5ns;
end architecture;