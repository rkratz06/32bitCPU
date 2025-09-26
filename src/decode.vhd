--decode module
--move JALR flag to execute for uniformity
--add control flags later

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decode is
	port(
		IR, PC : in std_logic_vector(31 downto 0);
		clk, reset, jump_or_branch_flag : in std_logic;
		opcode : out std_logic_vector(6 downto 0);
		instructionType : out std_logic_vector(2 downto 0);
		func3 : out std_logic_vector(2 downto 0);
		func7 : out std_logic_vector(6 downto 0);
		shamt : out std_logic_vector(4 downto 0);
		rs1_index, rs2_index, rd_index : out std_logic_vector(4 downto 0);
		immediate, PC_out : out std_logic_vector(31 downto 0)
	);
end decode;

architecture behavior of decode is

component instructionDecoder
	port(
		IR : in std_logic_vector(31 downto 0); --instruction, comes from instruction register
		instructionType : out std_logic_vector(2 downto 0);
		--000 = R, 001 = I, 010 = S, 011 = SB, 100 = U, 101 = UJ
		opcode : out std_logic_vector(6 downto 0);
		func3 : out std_logic_vector(2 downto 0);
		func7 : out std_logic_vector(6 downto 0);
		shamt : out std_logic_vector(4 downto 0);
		rs1_index, rs2_index, rd_index : out std_logic_vector(4 downto 0)
		);
end component;

component immediateCalc
	port(
		IR : in std_logic_vector(31 downto 0);
		instructionType : in std_logic_vector(2 downto 0);
		immediate : out std_logic_vector(31 downto 0));
end component;

signal instructionType_internal, func3_internal : std_logic_vector(2 downto 0) := (others => '0');
signal shamt_internal, rs1_index_internal, rs2_index_internal, rd_index_internal : std_logic_vector(4 downto 0) := (others => '0');
signal func7_internal, opcode_internal : std_logic_vector(6 downto 0) := (others => '0');
signal immediate_internal: std_logic_vector(31 downto 0) := (others => '0');
signal instructionType_reg, func3_reg : std_logic_vector(2 downto 0) := (others => '0');
signal shamt_reg, rs1_index_reg, rs2_index_reg, rd_index_reg : std_logic_vector(4 downto 0) := (others => '0');
signal func7_reg, opcode_reg : std_logic_vector(6 downto 0) := (others => '0');
signal immediate_reg, PC_internal, PC_reg : std_logic_vector(31 downto 0) := (others => '0');
begin
	decoder_inst : instructionDecoder port map(IR => IR, instructionType => instructionType_internal, opcode => 
	opcode_internal, func3 =>func3_internal, func7 => func7_internal, shamt => shamt_internal, rs1_index => rs1_index_internal, rs2_index => rs2_index_internal,
	rd_index => rd_index_internal);
	immediateCalc_inst : immediateCalc port map(IR => IR, instructionType => instructionType_internal, immediate => immediate_internal);
	PC_internal <= PC;
	process(reset, clk)
	begin
		if reset = '1' then
			instructionType_reg <= (others => '0');
			func3_reg <= (others => '0');
			shamt_reg <= (others => '0');
			rs1_index_reg <= (others => '0');
			rs2_index_reg <= (others => '0');
			rd_index_reg <= (others => '0');
			func7_reg <= (others => '0');
			opcode_reg <= (others => '0');
			immediate_reg <= (others => '0');
			PC_reg <= (others => '0');
		elsif rising_edge(clk) then
			if jump_or_branch_flag = '1' then
				instructionType_reg <= (others => '0');
				func3_reg <= (others => '0');
				shamt_reg <= (others => '0');
				rs1_index_reg <= (others => '0');
				rs2_index_reg <= (others => '0');
				rd_index_reg <= (others => '0');
				func7_reg <= (others => '0');
				opcode_reg <= (others => '0');
				immediate_reg <= (others => '0');
				PC_reg <= (others => '0');
			else
				instructionType_reg <= instructionType_internal;
				func3_reg <= func3_internal;
				shamt_reg <= shamt_internal;
				rs1_index_reg <= rs1_index_internal;
				rs2_index_reg <= rs2_index_internal;
				rd_index_reg <= rd_index_internal;
				func7_reg <= func7_internal;
				opcode_reg <= opcode_internal;
				immediate_reg <= immediate_internal;
				PC_reg <= PC_internal;
			end if;
		end if;
	end process;
	instructionType <= instructionType_reg;
	func3 <= func3_reg;
	shamt <= shamt_reg;
	rs1_index <= rs1_index_reg;
	rs2_index <= rs2_index_reg;
	rd_index <= rd_index_reg;
	func7 <= func7_reg;
	opcode <= opcode_reg;
	immediate <= immediate_reg;
	PC_out <= PC_reg;
end behavior;