--32-bit CPU

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU32bit is
	port(
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
			s : in std_logic_vector (3 downto 0); --mux select lines, will be used to pick the operation that will be performed
			shamt : in std_logic_vector(4 downto 0);; --shift amount, only used for shift instructions
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
			PC_next : in std_logic_vector(31 downto 0);
			clk: in std_logic;
			PC_LD: in std_logic;
			reset: in std_logic;
			PC: out std_logic_vector(31 downto 0));
	end component;
	
	component instructionDecoder
		port(
			IR : in std_logic_vector(31 downto 0); --instruction, comes from instruction register
			writeReg : out std_logic_vector(4 downto 0);
			readReg1 : out std_logic_vector(4 downto 0);
			readReg2 : out std_logic_vector(4 downto 0);
			PC_LD : out std_logic;
			S : out std_logic_vector(3 downto 0); --mux select lines for ALU
			we : out std_logic; --write enable, if return register is altered will be true
			isBranch : out std_logic; --0 if branch instruction not executed or branch not taken, 1 if branch taken
			JALRFlag : out std_logic; --only 1 if instruction executed is JALR
			instructionType : out std_logic_vector(2 downto 0));
			--000 = R, 001 = I, 010 = S, 011 = SB, 100 = U, 101 = UJ
			shamt : out std_logic_vector(4 downto 0);
			--add a RAM_write output later when RAM is added
	end component;
	
	component PCNextCalc is 
	port(
		PC : in std_logic_vector(31 downto 0);
		PCOffsetFlag : in std_logic; --if true, branch was taken, PC_next <- PC + immediate, otherwise PC_next <- PC + 4
		JALRFlag : in std_logic; --if flag = '1', JALR was executed
		Immediate : in std_logic_vector(31 downto 0); --byte aligned immediate
		reg1 : in std_logic_vector(31 downto 0); --used for JALR instruction
		PC_next : out std_logic_vector(31 downto 0));
	end component;
	
	component immediateCalc is 
	port(
		instructionType : in std_logic_vector(2 downto 0); --6 main instruction types
		--000 = R, 001 = I, 010 = S, 011 = SB, 100 = U, 101 = UJ
		IR : in std_logic_vector(31 downto 0);
		immediate : out std_logic_vector(31 downto 0)); --byte aligned immediate
	end component;
	
	component stateMachine is
	port(
		a
	end component;
	
	component CPUROM
		port(
			address		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	
	signal INPUT : std_logic_vector(31 downto 0); --input taken from ROM
	signal IR_internal : std_logic_vector(31 downto 0); --internal instruction register
	signal IR_LD_internal : std_logic; --If load is true, INPUT => IR
	signal rr1_internal : std_logic_vector(4 downto 0); --value holding register 1 number (0 - 31)
	signal rr2_internal : std_logic_vector(4 downto 0); --value holding register 2 number (0 - 31)
	signal wr_internal : std_logic_vector(4 downto 0); --value holding register to write to number (0 - 31)
	signal Q_internal : std_logic_vector(2 downto 0); --internal state bits
	signal PC_INC_internal : std_logic; --If PC_INC is true, PC += 1
	signal PC_LD_internal : std_logic; --If PC_LD is true, INPUT => PC
	signal S_internal : std_logic_vector(2 downto 0); --internal mux select lines
	signal output_internal : std_logic_vector(31 downto 0); --internal output for ALU controller, can be fed into ALU inputs
	signal reg1_internal : std_logic_vector(31 downto 0); --value at register 1
	signal reg2_internal : std_logic_vector(31 downto 0); --value at register 2
	signal cin_internal : std_logic; --uses a cin if provided, later hold COUT after add and use that as cin?
	signal immediate_internal : std_logic_vector(31 downto 0); --holds immediate value
	signal we_internal : std_logic;
	signal PC_internal : std_logic_vector(31 downto 0); --will be fed into ROM to get instructions
	
	begin
		InstructionRegister32 : instructionRegister port map(INPUT => INPUT, IR_LD => IR_LD_internal, clk => clk, reset => reset, IR => IR_internal);
		
		decoder : instructionDecoder port map();
		
		ALU : alu32bit port map();
		
		Registers : registerFile port map(clk => clk, we => we_internal, writeReg => wr_internal, readReg1 => rr1_internal, readReg2 => rr2_internal, 
							writeData => output_internal, readData1 => reg1_internal, readData2 => reg2_internal);
							
		ProgramCounter32 : programCounter port map();
		
		FSM : stateMachine port map();
		
		immediates : immediateCalc port map();
		
		PCnext : PCNextCalc port map();
		
		ROM : CPUROM port map(address => pc_internal, clock => clk, q => INPUT);
end structure;