--32-bit CPU top level design

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU32bit is
	port(
		clk : in std_logic;
		reset : in std_logic;
		--below outputs are used for testing
		PC, rs1, rs2, writeData, IR, immediate, newAddress : out std_logic_vector(31 downto 0);
		rs1_index, rs2_index, rd_index, shamt : out std_logic_vector(4 downto 0);
		opcode, func7 : out std_logic_vector(6 downto 0);
		func3, instructionType : out std_logic_vector(2 downto 0);
		RAMen, RAMwe, REGwe, jump_or_branch_flag : out std_logic
		);
end CPU32bit;

architecture structure of CPU32bit is
	
	component fetch
		port(
			clk, reset, jump_or_branch_flag : in std_logic;
			new_address : in std_logic_vector(31 downto 0);
			PC_out : out std_logic_vector(31 downto 0));
	end component;
	
	component decode
		port(
			IR, PC : in std_logic_vector(31 downto 0);
			clk, reset : in std_logic;
			opcode : out std_logic_vector(6 downto 0);
			instructionType : out std_logic_vector(2 downto 0);
			func3 : out std_logic_vector(2 downto 0);
			func7 : out std_logic_vector(6 downto 0);
			shamt : out std_logic_vector(4 downto 0);
			rs1_index, rs2_index, rd_index : out std_logic_vector(4 downto 0);
			immediate, PC_out : out std_logic_vector(31 downto 0));
	end component;
	
	component execute
		port(
			shamt, rs1_index, rs2_index, rd_index : in std_logic_vector(4 downto 0);
			clk, reset : in std_logic;
			opcode, func7 : in std_logic_vector(6 downto 0);
			instructionType, func3 : in std_logic_vector(2 downto 0);
			immediate, rs1, rs2 : in std_logic_vector(31 downto 0);
			PC : in std_logic_vector(31 downto 0);
			writeData, rs1_out, rs2_out, newAddress : out std_logic_vector(31 downto 0);
			RAMen, RAMwe, REGwe, jump_or_branch_flag:  out std_logic;
			rd_index_out : out std_logic_vector(4 downto 0);
			func3_out : out std_logic_vector(2 downto 0));
	end component;
	
	component memory
		port(
			clk, reset, RAMwe, RAMen, REGwe : in std_logic;
			writeData, rs1, rs2 : in std_logic_vector(31 downto 0);
			rd_index : in std_logic_vector(4 downto 0);
			func3 : in std_logic_vector(2 downto 0);
			writeData_out : out std_logic_vector(31 downto 0);
			REGwe_out : out std_logic;
			rd_index_out : out std_logic_vector(4 downto 0));
	end component;
	
	component writeback
		port(
			writeData : in std_logic_vector(31 downto 0);
			REGwe, clk, reset : in std_logic;
			rd_index : in std_logic_vector(4 downto 0);
			REGwe_out : out std_logic;
			writeData_out : out std_logic_vector(31 downto 0);
			rd_index_out : out std_logic_vector(4 downto 0));
	end component;
	
	component registerFile
		port(
		clk : in std_logic;
		we : in std_logic; --write enable, writes when true, reads when false
		writeReg : in std_logic_vector(4 downto 0);
		readReg1 : in std_logic_vector(4 downto 0); 
		readReg2 : in std_logic_vector(4 downto 0); 
		writeData : in std_logic_vector(31 downto 0); --data to write to register
		readData1 : out std_logic_vector(31 downto 0); --data contained in chosen register 1
		readData2 : out std_logic_vector(31 downto 0)); --data contained in chosen register 2
	end component;
	
	component CPUROM
	port(
		address		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	
	component decode_to_execute_register is
	port(
		clk, reset : in std_logic;
		rs1, rs2 : in std_logic_vector(31 downto 0);
		rs1_out, rs2_out : out std_logic_vector(31 downto 0));
	end component;

	signal PC_fetch_out, PC_decode_out, IR_fetch_out, immediate_decode_out, writeData_execute_out, rs1_execute_out, rs2_execute_out, 
	rd_execute_out, writeData_mem_out, newAddress_execute_out, rs1_execute_in, rs2_execute_in, writeData_wb_out,
	rs1_decode_out, rs2_decode_out: std_logic_vector(31 downto 0) := (others => '0');
	signal opcode_decode_out, func7_decode_out : std_logic_vector(6 downto 0) := (others => '0');
	signal instructionType_decode_out, func3_decode_out, func3_execute_out: std_logic_vector(2 downto 0) := (others => '0');
	signal rs1_index_decode_out, rs2_index_decode_out, rd_index_decode_out, shamt_decode_out, rd_index_execute_out,
	rd_index_mem_out, rd_index_wb_out: std_logic_vector(4 downto 0) := (others => '0');
	signal RAMen_execute_out, RAMwe_execute_out, REGwe_execute_out, REGwe_mem_out, jump_or_branch_flag_execute_out, REGwe_wb_out : std_logic := '0';

	
	begin
		fetch_inst : fetch port map (clk => clk, reset => reset, PC_out => PC_fetch_out, 
		jump_or_branch_flag => jump_or_branch_flag_execute_out, new_address => newAddress_execute_out);
		
		decode_inst : decode port map(clk => clk, reset => reset, IR => IR_fetch_out, PC => PC_fetch_out, opcode => opcode_decode_out, 
		instructionType => instructionType_decode_out, func3 => func3_decode_out, func7 => func7_decode_out, shamt => shamt_decode_out,
		rs1_index => rs1_index_decode_out, rs2_index => rs2_index_decode_out, rd_index => rd_index_decode_out, immediate => immediate_decode_out, 
		PC_out => PC_decode_out);
		
		execute_inst : execute port map(shamt => shamt_decode_out, rs1_index => rs1_index_decode_out, rs2_index => rs2_index_decode_out,
		rd_index => rd_index_decode_out, clk => clk, reset => reset, opcode => opcode_decode_out, func7 => func7_decode_out, 
		instructionType => instructionType_decode_out, func3 => func3_decode_out, immediate => immediate_decode_out, PC => PC_decode_out, 
		writeData => writeData_execute_out, rs1 => rs1_execute_in, rs2 => rs2_execute_in, RAMen => RAMen_execute_out, RAMwe => RAMwe_execute_out,
		REGwe => REGwe_execute_out, rd_index_out => rd_index_execute_out, func3_out => func3_execute_out, 
		jump_or_branch_flag => jump_or_branch_flag_execute_out, newAddress => newAddress_execute_out, rs1_out => rs1_execute_out, rs2_out => rs2_execute_out);
		
		memory_inst : memory port map(clk => clk, reset => reset, RAMwe => RAMwe_execute_out, RAMen => RAMen_execute_out, REGwe => REGwe_execute_out, 
		writeData => writeData_execute_out, rs1 => rs1_execute_out, rs2 => rs2_execute_out, rd_index => rd_index_execute_out, func3 => func3_execute_out,
		writeData_out => writeData_mem_out, REGwe_out => REGwe_mem_out, rd_index_out => rd_index_mem_out);
		
		writeback_inst : writeback port map(clk => clk, reset => reset, writeData => writeData_mem_out, REGwe => REGwe_mem_out, rd_index => rd_index_mem_out, 
		writeData_out => writeData_wb_out, REGwe_out => REGwe_wb_out, rd_index_out => rd_index_wb_out);
		
		registerFile_inst : registerFile port map(clk => clk, we => REGwe_wb_out, writeReg => rd_index_wb_out, readReg1 => rs1_index_decode_out, 
		readReg2 => rs2_index_decode_out, writeData => writeData_wb_out, readData1 => rs1_decode_out, readData2 => rs2_decode_out);
		
		CPUROM_inst : CPUROM port map(address => PC_fetch_out(15 downto 2), clock => clk, q => IR_fetch_out);
		
		decode_to_execute_register_inst : decode_to_execute_register port map(clk => clk, reset => reset,
		rs1 =>rs1_decode_out, rs2 => rs2_decode_out, rs1_out => rs1_execute_in, rs2_out => rs2_execute_in);
		
		PC <= PC_fetch_out;
		rs1 <= rs1_execute_in;
		rs2 <= rs2_execute_in;
		writeData <= writeData_wb_out;
		IR <= IR_fetch_out;
		immediate <= immediate_decode_out;
		rs1_index <= rs1_index_decode_out;
		rs2_index <= rs2_index_decode_out;
		rd_index <= rd_index_wb_out;
		shamt <= shamt_decode_out; --shamt is updated in execute section if registers are used, reading will be inaccurate for shift with register shamt
		opcode <= opcode_decode_out;
		func7 <= func7_decode_out;
		func3 <= func3_decode_out;
		instructionType <= instructionType_decode_out;
		RAMen <= RAMen_execute_out;
		RAMwe <= RAMwe_execute_out;
		REGwe <= REGwe_wb_out;
		jump_or_branch_flag <= jump_or_branch_flag_execute_out;
		newAddress <= newAddress_execute_out;
end structure;