--32-bit CPU

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU32bit is
	port(
		INPUT : in std_logic_vector(31 downto 0); --32 bit input, will later be taken from ROM
		clk : in std_logic;
		reset : in std_logic);
end CPU32bit;

architecture structure of CPU32bit is
	
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
	
	component alu32bit
		port(
			reg1 : in std_logic_vector(31 downto 0);
			reg2 : in std_logic_vector(31 downto 0);
			cin : in std_logic; --carry in for addition
			s : in std_logic_vector (2 downto 0); --mux select lines, will be used to pick the operation that will be performed
			output : out std_logic_vector(31 downto 0));
	end component;
	
	component instructionRegister
		port(
			INPUT : in std_logic_vector(31 downto 0);
			IR_LD : in std_logic;
			clk: in std_logic;
			reset: in std_logic;
			IR: out std_logic_vector(31 downto 0));
	end component;
	
	component programCounter
		port(
			INPUT: in std_logic_vector(31 downto 0);
			clk: in std_logic;
			PC_INC: in std_logic;
			PC_LD: in std_logic;
			reset: in std_logic;
			PC: out std_logic_vector(31 downto 0));
	end component;
	
	component aluController
		port(
			IR : in std_logic_vector(31 downto 0); --instruction, comes from instruction register
			Q : in std_logic_vector (2 downto 0); --state bits, increase size later
			writeReg : out std_logic_vector(4 downto 0);
			readReg1 : out std_logic_vector(4 downto 0);
			readReg2 : out std_logic_vector(4 downto 0);
			IR_LD : out std_logic;
			PC_INC : out std_logic;
			PC_LD : out std_logic;
			S : out std_logic_vector(2 downto 0); --mux select lines for ALU
			output : out std_logic_vector(31 downto 0)); --used to output immediate values
	end component;
	
	signal IR_internal : std_logic_vector(31 downto 0);
	signal IR_LD_internal : std_logic;
	signal rr1_internal : std_logic_vector(4 downto 0);
	signal rr2_internal : std_logic_vector(4 downto 0);
	signal wr_internal : std_logic_vector(4 downto 0);
	signal Q_internal : std_logic_vector(2 downto 0); --internal state bits
	signal PC_INC_internal : std_logic;
	signal PC_LD_internal : std_logic;
	signal S_internal : std_logic_vector(2 downto 0); --internal mux select lines
	signal output_internal : std_logic_vector(31 downto 0); --internal output for ALU controller, can be fed into ALU inputs
	signal reg1_internal : std_logic_vector(31 downto 0);
	signal reg2_internal : std_logic_vector(31 downto 0);
	signal cin_internal : std_logic;
	signal immediate_internal : std_logic_vector(31 downto 0);
	signal we_internal : std_logic;
	signal PC_internal : std_logic_vector(31 downto 0); --will be fed into ROM to get instructions when ROM implemented
	
	begin
		InstructionRegister32 : instructionRegister port map(INPUT => INPUT, IR_LD => IR_LD_internal, clk => clk, reset => reset, IR => IR_internal);
		Controller : aluController port map(IR => IR_internal, Q => Q_internal, writeReg => wr_internal, readReg1 => rr1_internal,
							readReg2 => rr2_internal, IR_LD => IR_LD_internal, PC_INC => PC_INC_internal, PC_LD => PC_LD_internal, S => S_internal, output => immediate_internal);
		ALU : alu32bit port map(reg1 => reg1_internal, reg2 => reg2_internal, cin => cin_internal, s => s_internal, output => output_internal);
		Registers : registerFile port map(clk => clk, we => we_internal, writeReg => wr_internal, readReg1 => rr1_internal, readReg2 => rr2_internal, 
							writeData => output_internal, readData1 => reg1_internal, readData2 => reg2_internal);
		ProgramCounter32 : programCounter port map(INPUT => INPUT, clk => clk, PC_INC => PC_INC_internal, PC_LD => PC_LD_internal, reset => reset, PC => PC_internal);
end structure;