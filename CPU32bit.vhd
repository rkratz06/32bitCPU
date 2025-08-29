--32-bit CPU top level design

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU32bit is
	port(
		clk : in std_logic;
		reset : in std_logic;
		--below outputs are used for testing
		PC, IR, reg1, reg2, writeData, ALU_input1, ALU_input2, ALU_output, immediate, RAMin, RAMout, RAMAddressOut, newWritebackData : out std_logic_vector(31 downto 0);
		opcode, func7 : out std_logic_vector(6 downto 0);
		func3, instructionType, Q : out std_logic_vector(2 downto 0);
		readReg1, readReg2, writeReg : out std_logic_vector(4 downto 0);
		S : out std_logic_vector(3 downto 0);
		IR_LD, PC_LD, RegWE, RAMwe, RAMen, ALUZero, ALULT, ALULTU, updateWritebackReg : out std_logic
		);
end CPU32bit;

architecture structure of CPU32bit is
	
	component registerFile
		port(
			clk : in std_logic;
			we : in std_logic; 
			writeReg : in std_logic_vector(4 downto 0);
			readReg1 : in std_logic_vector(4 downto 0); 
			readReg2 : in std_logic_vector(4 downto 0); 
			writeData : in std_logic_vector(31 downto 0); 
			readData1 : out std_logic_vector(31 downto 0); 
			readData2 : out std_logic_vector(31 downto 0));
	end component;
	
	component alu32bit
		port(
			reg1 : in std_logic_vector(31 downto 0);
			reg2 : in std_logic_vector(31 downto 0);
			s : in std_logic_vector (3 downto 0); 
			shamt : in std_logic_vector(4 downto 0);
			ALUZero, ALULT, ALULTU : out std_logic;
			output : out std_logic_vector(31 downto 0));
	end component;
	
	component instructionRegister
		port(
			INPUT : in std_logic_vector(31 downto 0);
			IR_LD : in std_logic;
			clk: in std_logic;
			reset: in std_logic;
			JALRFlag_reg : out std_logic;
			instructionType_reg : out std_logic_vector(2 downto 0);
			func3_reg          : out std_logic_vector(2 downto 0);
			func7_reg          : out std_logic_vector(6 downto 0);
			shamt_reg          : out std_logic_vector(4 downto 0);
			immediate_reg      : out std_logic_vector(31 downto 0);
			opcode_reg : out std_logic_vector(6 downto 0);
			readReg1, readReg2, writeReg : out std_logic_vector(4 downto 0);
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

	component PCNextCalc is 
	port(
		PC : in std_logic_vector(31 downto 0);
		PCOffsetFlag : in std_logic; 
		JALRFlag : in std_logic; 
		Immediate : in std_logic_vector(31 downto 0);
		reg1 : in std_logic_vector(31 downto 0);
		PC_next : out std_logic_vector(31 downto 0));
	end component;

	component stateMachine is
	port(
		Q : in std_logic_vector(2 downto 0); 
		immediate : in std_logic_vector(31 downto 0);
		reg1 : in std_logic_vector(31 downto 0);
		reg2 : in std_logic_vector(31 downto 0);
		PC : in std_logic_vector(31 downto 0);
		ALU_output : in std_logic_vector(31 downto 0);
		opcode : in std_logic_vector(6 downto 0);
		func3 : in std_logic_vector(2 downto 0);
		func7 : in std_logic_vector(6 downto 0);
		RAMData : in std_logic_vector(31 downto 0); 
		shamt : in std_logic_vector(4 downto 0);
		ALUZero, ALULT, ALULTU, reset, JALRFlag : in std_logic;
		updateWritebackReg : out std_logic;
		IR_LD : out std_logic;
		PCOffsetFlag : out std_logic;
		D : out std_logic_vector(2 downto 0); 
		writeData : out std_logic_vector(31 downto 0); 
		writeRAMData : out std_logic_vector(31 downto 0);
		RegWE : out std_logic;
		RAMwe : out std_logic; 
		PC_LD : out std_logic;
		UpdateRAMAddress : out std_logic;
		S : out std_logic_vector(3 downto 0);
		ALU_input1 : out std_logic_vector(31 downto 0);
		ALU_input2 : out std_logic_vector(31 downto 0);
		shamt_out : out std_logic_vector(4 downto 0);
		RAMbyteEN : out std_logic_vector(3 downto 0);
		RAMen : out std_logic); 
	end component;
	
	component stateRegister is
		port(
			D : in std_logic_vector(2 downto 0);
			reset : in std_logic;
			clk : in std_logic;
			Q : out std_logic_vector(2 downto 0));
	end component;
	
	component RAMAddress
		port(
			clk : in std_logic;
			reset : in std_logic;
			updateAddress : in std_logic; 
			newAddress : in std_logic_vector(31 downto 0);
			Address : out std_logic_vector(31 downto 0));
		end component;
		
	component CPURAM
		port(
			address		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
			byteena		: IN STD_LOGIC_VECTOR (3 DOWNTO 0) :=  (OTHERS => '1');
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	
	component CPUROM
		port(
			address		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;
	
	component writebackRegister
	port(
		newData : in std_logic_vector(31 downto 0);
		updateWritebackReg : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		writebackData : out std_logic_vector(31 downto 0));
	end component;
	
	--internal inputs to be fed between components
	signal INPUT : std_logic_vector(31 downto 0); --input taken from ROM
	signal IR_internal : std_logic_vector(31 downto 0); 
	signal IR_LD_internal : std_logic; 
	signal rr1_internal : std_logic_vector(4 downto 0); 
	signal rr2_internal : std_logic_vector(4 downto 0); 
	signal wr_internal : std_logic_vector(4 downto 0); 
	signal Q_internal : std_logic_vector(2 downto 0); 
	signal PC_LD_internal : std_logic; 
	signal S_internal : std_logic_vector(3 downto 0); 
	signal ALUOutput_internal : std_logic_vector(31 downto 0);
	signal reg1_internal : std_logic_vector(31 downto 0); 
	signal reg2_internal : std_logic_vector(31 downto 0); 
	signal immediate_internal : std_logic_vector(31 downto 0); 
	signal RegWE_internal : std_logic;
	signal PC_internal : std_logic_vector(31 downto 0); 
	signal UpdateRAMAddress_internal : std_logic;
	signal isBranch_internal : std_logic;
	signal JALRFlag_internal : std_logic;
	signal instructionType_internal : std_logic_vector(2 downto 0);
	signal shamt_internal : std_logic_vector(4 downto 0);
	signal PC_next_internal : std_logic_vector(31 downto 0);
	signal D_internal : std_logic_vector(2 downto 0);
	signal PCOffsetFlag_internal : std_logic;
	signal writeData_internal : std_logic_vector(31 downto 0);
	signal RAMwe_internal : std_logic;
	signal RAMen_internal : std_logic;
	signal RAMAddress_internal : std_logic_vector(31 downto 0);
	signal RAMEnable : std_logic_vector(3 downto 0);
	signal RAMOutput_internal : std_logic_vector(31 downto 0);
	signal opcode_internal : std_logic_vector(6 downto 0);
	signal func3_internal : std_logic_vector(2 downto 0);
	signal func7_internal : std_logic_vector(6 downto 0);
	signal ALU_input1_internal : std_logic_vector(31 downto 0);
	signal ALU_input2_internal : std_logic_vector(31 downto 0);
	signal shamt_out_internal :std_logic_vector(4 downto 0);
	signal writeRAMData_internal : std_logic_vector(31 downto 0);
	signal RAMbyteEN_internal : std_logic_vector(3 downto 0);
	signal ALUZero_internal : std_logic;
	signal ALULT_internal : std_logic;
	signal ALULTU_internal : std_logic;
	signal newWritebackData_internal : std_logic_vector(31 downto 0);
	signal updateWritebackReg_internal : std_logic;
	signal updatePCNext_internal : std_logic;
	
	
	begin
		--instruction register updates instruction with input from ROM if IR_LD is true. built in decoder with registered outputs
		InstructionRegister32 : instructionRegister port map(INPUT => INPUT, IR_LD => IR_LD_internal, clk => clk, reset => reset, IR => IR_internal, readReg1 => rr1_internal, 
			readReg2 => rr2_internal, writeReg => wr_internal, JALRFlag_reg => JALRFlag_internal, func3_reg => func3_internal, func7_reg => func7_internal, 
			immediate_reg => immediate_internal, instructionType_reg => instructionType_internal, shamt_reg => shamt_internal, opcode_reg => opcode_internal);
		
		--ALU takes 2 32 bit values as an input, select line determines operation. includes 3 flags for when the outputs is zero, rs1 < rs2 unsigned, and rs1 < rs2 signed. flags are not registered
		ALU : alu32bit port map(reg1 => ALU_input1_internal, reg2 => ALU_input2_internal, S => S_internal, shamt => shamt_out_internal, output => ALUOutput_internal, 
			ALUZero => ALUZero_internal, ALULT => ALULT_internal, ALULTU => ALULTU_internal);
		
		--a module containing 32 32 bit general registers. when RegWE is true, the register at index writeReg will be written with writeData on the next clock cycle
		--supports asynchronous read of 2 registers, outputs the data in registers readReg1 and readReg2
		Registers : registerFile port map(clk => clk, we => RegWE_internal, writeReg => wr_internal, readReg1 => rr1_internal, readReg2 => rr2_internal, 
			writeData => writeData_internal, readData1 => reg1_internal, readData2 => reg2_internal);
					
		--registered program counter than is updated with PC_next when PC_LD is true		
		ProgramCounter32 : programCounter port map(PC_next => PC_next_internal, clk => clk, PC_LD => PC_LD_internal, reset => reset, PC => PC_internal);
		
		--state machine module is purely combinatorial. sequential logic is handled in the stateRegister module
		--5 stages included : FETCH, DECODE, EXECUTE, MEM, WRITEBACK. every instruction visits each stage, so each instruction takes 5 clock cycles.
		--state machine designed to assist in the implementation of pipelining later on
		FSM : stateMachine port map(
			reset => reset, 
			Q => Q_internal,
			immediate => immediate_internal,
			reg1 => reg1_internal,
			reg2 => reg2_internal,
			PC => PC_internal,
			ALU_output => ALUOutput_internal,
			opcode => opcode_internal,
			func3 => func3_internal,
			func7 => func7_internal,
			RAMData => RAMOutput_internal,
			shamt => shamt_internal,
			ALUZero => ALUZero_internal,
			ALULT => ALULT_internal,
			ALULTU => ALULTU_internal,
			JALRFlag => JALRFlag_internal,
			IR_LD => IR_LD_internal,
			PCOffsetFlag => PCOffsetFlag_internal, 
			D => D_internal,
			writeData => newWritebackData_internal, 
			writeRAMData => writeRAMData_internal,
			RegWE => RegWE_internal,
			RAMwe => RAMwe_internal,
			PC_LD => PC_LD_internal,
			UpdateRAMAddress => UpdateRAMAddress_internal,
			S => S_internal,
			ALU_input1 => ALU_input1_internal,
			ALU_input2 => ALU_input2_internal, 
			shamt_out => shamt_out_internal,
			RAMbyteEN => RAMbyteEN_internal,
			updateWritebackReg => updateWritebackReg_internal,
			RAMen => RAMen_internal);
		
		--registers the state bits to be used in the stateMachine module
		stateReg : stateRegister port map(D => D_internal, Q => Q_internal, clk => clk, reset => reset);
		
		--calculates the next program counter. If PCOffsetFlag is true, the next PC will be PC + immediate. If JALRFlag is true, the next PC will follow that calculation. Otherwise, increment PC by 4 (byte addressed ROM)
		PCnext : PCNextCalc port map(PC => PC_internal, PCOffsetFlag => PCOffsetFlag_internal, JALRFlag => JALRFlag_internal, Immediate => immediate_internal, reg1 => reg1_internal, PC_next => PC_next_internal);
		
		--register for the RAM address calculated in the ALU as designated by the state machine
		RAMAddr : RAMAddress port map(clk => clk, reset => reset, updateAddress => UpdateRAMAddress_internal, newAddress => ALUOutput_internal, Address => RAMAddress_internal);
		
		--registers the data to be written to the 32 bit general registers. allows for the data to be written to come from the ALU or RAM
		writebackReg : writebackRegister port map(clk => clk, newData => newWritebackData_internal, writebackData => writeData_internal, reset => reset, updateWritebackReg => updateWritebackReg_internal);
		
		--RAM module created by quartus RAM creation wizard. byte enable used to handle storage of different numbers of bytes. stores data, not programs. reads from the RAMMIF file upon startup
		RAM : CPURAM port map (address => RAMAddress_internal(13 downto 0), byteena => RAMbyteEN_internal, clock => clk, data => writeRAMData_internal, wren => RAMwe_internal, q => RAMOutput_internal);
		
		--ROM module created by quartus ROM creation wizard. stores program data. PC is byte aligned. reads from the CPUMIF file upon startup
		ROM : CPUROM port map(address => PC_internal(15 downto 2), clock => clk, q => INPUT);
		
		--below outputs are set to be used in testbench
		PC <= PC_internal;
		IR <= IR_internal;
		reg1 <= reg1_internal;
		reg2 <= reg2_internal;
		writeData <= writeData_internal;
		ALU_input1 <= ALU_input1_internal;
		ALU_input2 <= ALU_input2_internal;
		ALU_output <= ALUOutput_internal;
		immediate <= immediate_internal;
		RAMin <= writeRAMData_internal;
		RAMout <= RAMOutput_internal;
		RAMAddressOut <= RAMAddress_internal;
		opcode <= opcode_internal;
		func7 <= func7_internal;
		func3 <= func3_internal;
		readReg1 <= rr1_internal;
		readReg2 <= rr2_internal;
		writeReg <= wr_internal;
		Q <= Q_internal;
		IR_LD <= IR_LD_internal;
		PC_LD <= PC_LD_internal;
		RegWE <= RegWE_internal;
		RAMwe <= RAMwe_internal;
		RAMen <= RAMen_internal;
		ALUZero <= ALUZero_internal;
		ALULT <= ALULT_internal;
		ALULTU <= ALULTU_internal;
		S <= S_internal;
		updateWritebackReg <= updateWritebackReg_internal;
		newWritebackData <= newWritebackData_internal;
		instructionType <= instructionType_internal;
		
end structure;