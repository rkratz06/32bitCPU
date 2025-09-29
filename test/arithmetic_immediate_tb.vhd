library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.regfile_pkg.all;
entity arithmetic_immediate_tb is
end arithmetic_immediate_tb;

architecture behavior of arithmetic_immediate_tb is
constant init_file_tb : string := "arithmetic_immediate_test.mif";

signal clk_tb : std_logic := '0';
signal reset_tb : std_logic := '1';
signal PC_fetch_out_tb, PC_decode_out_tb, IR_fetch_out_tb, immediate_decode_out_tb, writeData_execute_out_tb, rs1_execute_out_tb, rs2_execute_out_tb, 
rd_execute_out_tb, writeData_mem_out_tb, newAddress_execute_out_tb, writeData_wb_out_tb,
rs1_decode_out_tb, rs2_decode_out_tb: std_logic_vector(31 downto 0);
signal opcode_decode_out_tb, func7_decode_out_tb : std_logic_vector(6 downto 0);
signal instructionType_decode_out_tb, func3_decode_out_tb, func3_execute_out_tb : std_logic_vector(2 downto 0);
signal rs1_index_decode_out_tb, rs2_index_decode_out_tb, rd_index_decode_out_tb, shamt_decode_out_tb, rd_index_execute_out_tb,
rd_index_mem_out_tb, rd_index_wb_out_tb : std_logic_vector(4 downto 0);
signal RAMen_execute_out_tb, RAMwe_execute_out_tb, REGwe_execute_out_tb, REGwe_mem_out_tb, jump_or_branch_flag_execute_out_tb, REGwe_wb_out_tb : std_logic;
signal regs_tb : regfile_array;

begin
    dut: entity work.CPU32bit
		generic map(
			init_file => init_file_tb
		)
        port map(
			clk => clk_tb,
			reset => reset_tb,
			PC_fetch_out_o => PC_fetch_out_tb,
			PC_decode_out_o => PC_decode_out_tb,
			IR_fetch_out_o => IR_fetch_out_tb,
			immediate_decode_out_o => immediate_decode_out_tb,
			writeData_execute_out_o => writeData_execute_out_tb,
			rs1_execute_out_o => rs1_execute_out_tb,
			rs2_execute_out_o => rs2_execute_out_tb,
			rd_execute_out_o => rd_execute_out_tb,
			writeData_mem_out_o => writeData_mem_out_tb,
			newAddress_execute_out_o => newAddress_execute_out_tb,
			writeData_wb_out_o => writeData_wb_out_tb,
			rs1_decode_out_o => rs1_decode_out_tb,
			rs2_decode_out_o => rs2_decode_out_tb,
			opcode_decode_out_o  => opcode_decode_out_tb,
			func7_decode_out_o => func7_decode_out_tb,
			instructionType_decode_out_o => instructionType_decode_out_tb,
			func3_decode_out_o => func3_decode_out_tb,
			func3_execute_out_o => func3_execute_out_tb,
			rs1_index_decode_out_o => rs1_index_decode_out_tb,
			rs2_index_decode_out_o => rs2_index_decode_out_tb,
			rd_index_decode_out_o => rd_index_decode_out_tb,
			shamt_decode_out_o => shamt_decode_out_tb,
			rd_index_execute_out_o => rd_index_execute_out_tb,
			rd_index_mem_out_o => rd_index_mem_out_tb,
			rd_index_wb_out_o => rd_index_wb_out_tb,
			RAMen_execute_out_o => RAMen_execute_out_tb,
			RAMwe_execute_out_o => RAMwe_execute_out_tb,
			REGwe_execute_out_o => REGwe_execute_out_tb,
			REGwe_mem_out_o => REGwe_mem_out_tb,
			jump_or_branch_flag_execute_out_o => jump_or_branch_flag_execute_out_tb,
			REGwe_wb_out_o => REGwe_wb_out_tb,
			regs_o => regs_tb
        );
		  clk_tb <= not clk_tb after 1ns;
		  reset_process: process
			begin
				 reset_tb <= '1';
				 wait for 5 ns;
				 reset_tb <= '0';
				 wait; -- hold forever
			end process;
		tb : process
		begin
			wait for 5ns; --give time to update
			wait for 13ns; --5ns for reset, 4 cycles after reset for instruction
			assert regs_tb(1) = x"000000A0"
			report "addi instruction failed" severity error;
			report "addi instruction passed" severity note;
			wait for 14ns; --7 cycles after first instruction, pipeline latency, using nop to pad instructions so x1 is ready for next instruction
			assert regs_tb(1) = x"000000AA"
			report "addi instruction failed" severity error;
			report "addi instruction passed" severity note;
			wait for 10ns; --5 cycles, using nop to pad instructions so x1 is ready for next instruction
			assert regs_tb(1) = x"000000FA"
			report "ori instruction failed" severity error;
			report "ori instruction passed" severity note;
			wait for 10ns; --5 cycles, using nop to pad instructions so x1 is ready for next instruction
			assert regs_tb(1) = x"0000000A"
			report "andi instruction failed" severity error;
			report "andi instruction passed" severity note;
			wait for 10ns; --5 cycles, using nop to pad instructions so x1 is ready for next instruction
			assert regs_tb(1) = x"00000014"
			report "slli instruction failed" severity error;
			report "slli instruction passed" severity note;
			wait for 10ns; --5 cycles, using nop to pad instructions so x1 is ready for next instruction
			assert regs_tb(1) = x"0000000A"
			report "srli instruction failed" severity error;
			report "srli instruction passed" severity note;
			wait;
		end process;
end architecture;