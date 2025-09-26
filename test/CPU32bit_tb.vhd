--universal testbench file

library ieee;
use ieee.std_logic_1164.all;
use work.regfile_pkg.all;
entity CPU32bit_tb is
end CPU32bit_tb;

architecture behavior of CPU32bit_tb is
constant checker_type : integer := 1; --corresponds to the different checker modules used for different programs
--1 = arithmetic with immediate, 2 = arithmetic, 3 = branch, 4 = jump, 5 = load and store
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
		  reset_tb <= '1', '0' after 5ns;
		  
		checker_gen1: if checker_type = 1 generate
		begin
			arithmetic_immediate_checker : entity work.arithmetic_immediate_tb
				port map(
					clk => clk_tb,
					reset => reset_tb,
					regs => regs_tb
			);
		end generate checker_gen1;
		
		checker_gen2: if checker_type = 2 generate
		begin
			arithmetic_checker : entity work.arithmetic_tb
				port map(
					clk => clk_tb,
					reset => reset_tb,
					regs => regs_tb
			);
		end generate checker_gen2;
		
		checker_gen3: if checker_type = 3 generate
		begin
		branch_checker : entity work.branch_tb
				port map(
					clk => clk_tb,
					reset => reset_tb,
					regs => regs_tb
			);
		end generate checker_gen3;
		
		checker_gen4: if checker_type = 4 generate
		begin
			jump_checker : entity work.jump_tb
				port map(
					clk => clk_tb,
					reset => reset_tb,
					regs => regs_tb
			);
		end generate checker_gen4;
		
		checker_gen5: if checker_type = 5 generate
		begin
			load_and_store_checker : entity work.load_and_store_tb
				port map(
					clk => clk_tb,
					reset => reset_tb,
					regs => regs_tb
			);
		end generate checker_gen5;
end architecture;