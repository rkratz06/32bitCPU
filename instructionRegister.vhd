--instruction register
--when IR_LD is true, the instruction will be set to INPUT (comes from ROM in top level design)
--instruction decoder is currently included as a component, the outputs of instruction decoder are registered and included as outputs

library ieee;
use ieee.std_logic_1164.all;

entity instructionRegister is
	port(
		INPUT : in std_logic_vector(31 downto 0);
		IR_LD : in std_logic;
		clk: in std_logic;
		reset: in std_logic;
		JALRFlag_reg : out std_logic;
		instructionType_reg : out std_logic_vector(2 downto 0);
		opcode_reg : out std_logic_vector(6 downto 0);
      func3_reg          : out std_logic_vector(2 downto 0);
      func7_reg          : out std_logic_vector(6 downto 0);
      shamt_reg          : out std_logic_vector(4 downto 0);
      immediate_reg      : out std_logic_vector(31 downto 0);
		readReg1, readReg2, writeReg : out std_logic_vector(4 downto 0);
		IR: out std_logic_vector(31 downto 0));
end instructionRegister;

architecture behavior of instructionRegister is
signal IR_internal : std_logic_vector(31 downto 0);
signal rr1_internal, rr2_internal, wr_internal : std_logic_vector(4 downto 0);
signal instructionType_internal : std_logic_vector(2 downto 0);
signal func3_internal : std_logic_vector(2 downto 0);
signal func7_internal : std_logic_vector(6 downto 0);
signal shamt_internal : std_logic_vector(4 downto 0);
signal JALRFlag_internal : std_logic;
signal immediate_internal : std_logic_vector(31 downto 0);
signal instructionType_dec : std_logic_vector(2 downto 0);
signal func3_dec : std_logic_vector(2 downto 0);
signal func7_dec : std_logic_vector(6 downto 0);
signal shamt_dec : std_logic_vector(4 downto 0);
signal imm_calc : std_logic_vector(31 downto 0);
signal JALRFlag_dec : std_logic;
signal opcode_dec : std_logic_vector(6 downto 0);
signal opcode_internal : std_logic_vector(6 downto 0);

--instruction decoder included to register outputs from decoder
component instructionDecoder
	port(
		IR : in std_logic_vector(31 downto 0); 
		JALRFlag : out std_logic; 
		instructionType : out std_logic_vector(2 downto 0);
		opcode : out std_logic_vector(6 downto 0);
		func3 : out std_logic_vector(2 downto 0);
		func7 : out std_logic_vector(6 downto 0);
		shamt : out std_logic_vector(4 downto 0)
	);
end component;

--immediateCalc is used to get the immediate using information from the decoder
component immediateCalc
	port(
		IR : in std_logic_vector(31 downto 0);
		instructionType : in std_logic_vector(2 downto 0);
		immediate : out std_logic_vector(31 downto 0)
	);
end component;

begin

	decoder : instructionDecoder port map(IR => INPUT, instructionType => instructionType_dec, func3 => func3_dec, func7 => func7_dec, shamt => shamt_dec, JALRFlag => JALRFlag_dec, opcode => opcode_dec);

	immCalc : immediateCalc port map(IR => INPUT, instructionType => instructionType_dec, immediate => imm_calc);

	process(clk, reset)
	begin
		if reset = '1' then
			IR_internal <= (others => '0');
			rr1_internal <= (others => '0');
			rr2_internal <= (others => '0');
			wr_internal <= (others => '0');
			instructionType_internal <= (others => '0');
			func3_internal <= (others => '0');
			func7_internal <= (others => '0');
			shamt_internal <= (others => '0');
			immediate_internal <= (others => '0');
			JALRFlag_internal <= '0';
			opcode_internal <= (others => '0');
		elsif rising_edge(clk) then
			if IR_LD = '1' then
				IR_internal <= INPUT;
				rr1_internal <= INPUT(19 downto 15);
				rr2_internal <= INPUT(24 downto 20);
				wr_internal <= INPUT(11 downto 7);
				instructionType_internal <= instructionType_dec;
				func3_internal <= func3_dec;
				func7_internal <= func7_dec;
				shamt_internal <= shamt_dec;
				immediate_internal <= imm_calc;
				JALRFlag_internal <= JALRFlag_dec;
				opcode_internal <= opcode_dec;
			end if;
		end if;
	end process;
	IR <= IR_internal;
	readReg1 <= rr1_internal;
	readReg2 <= rr2_internal;
	writeReg <= wr_internal;
	instructionType_reg <= instructionType_internal;
	func3_reg <= func3_internal;
	func7_reg <= func7_internal;
	shamt_reg <= shamt_internal;
	immediate_reg <= immediate_internal;
	JALRFlag_reg <= JALRFlag_internal;
	opcode_reg <= opcode_internal;
end behavior;