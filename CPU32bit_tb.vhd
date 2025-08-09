--testbench file

library ieee;
use ieee.std_logic_1164.all;

entity CPU32bit_tb is
end CPU32bit_tb;

architecture behavior of CPU32bit_tb is
signal clk_tb : std_logic := '0';
signal reset_tb : std_logic := '1';
signal PC_tb, IR_tb, reg1_tb, reg2_tb, writeData_tb, ALU_input1_tb, ALU_input2_tb, ALU_output_tb, immediate_tb, RAMin_tb, RAMout_tb, RAMAddressOut_tb, newWritebackData_tb : std_logic_vector(31 downto 0);
signal opcode_tb, func7_tb : std_logic_vector(6 downto 0);
signal func3_tb : std_logic_vector(2 downto 0);
signal readReg1_tb, readReg2_tb, writeReg_tb, Q_tb : std_logic_vector(4 downto 0);
signal S_tb : std_logic_vector(3 downto 0);
signal IR_LD_tb, PC_LD_tb, RegWE_tb, RAMwe_tb, useRAM_tb, ALUZero_tb, ALULT_tb, ALULTU_tb, updateWritebackReg_tb : std_logic;
begin

    uut: entity work.CPU32bit
        port map(
            clk => clk_tb,
            reset => reset_tb,
            PC => PC_tb,
            IR => IR_tb,
            reg1 => reg1_tb,
            reg2 => reg2_tb,
            writeData => writeData_tb,
            ALU_input1 => ALU_input1_tb,
            ALU_input2 => ALU_input2_tb,
            ALU_output => ALU_output_tb,
            immediate => immediate_tb,
            RAMin => RAMin_tb,
            RAMout => RAMout_tb,
            RAMAddressOut => RAMAddressOut_tb,
            opcode => opcode_tb,
            func7 => func7_tb,
            func3 => func3_tb,
            readReg1 => readReg1_tb,
            readReg2 => readReg2_tb,
            writeReg => writeReg_tb,
            Q => Q_tb,
            IR_LD => IR_LD_tb,
            PC_LD => PC_LD_tb,
            RegWE => RegWE_tb,
            RAMwe => RAMwe_tb,
            useRAM => useRAM_tb,
            ALUZero => ALUZero_tb,
            ALULT => ALULT_tb,
            ALULTU => ALULTU_tb,
				S => S_tb,
				updateWritebackReg => updateWritebackReg_tb,
				newWritebackData => newWritebackData_tb
        );

		clk_process: process
		begin
			 while True loop
				  clk_tb <= '0';
				  wait for 10 ns;
				  clk_tb <= '1';
				  wait for 10 ns;
			 end loop;
		end process;

    reset_process: process
    begin
        reset_tb <= '1';
        wait for 50 ns;
        reset_tb <= '0';
        wait;
    end process;

end architecture;