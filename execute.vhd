--execute module
--todo: add JAL, JALR, and branch handling
--add flag for writing to registers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity execute is
	port(
	shamt, rs1_index, rs2_index, rd_index : in std_logic_vector(4 downto 0);
	clk, reset : in std_logic;
	opcode, func7 : in std_logic_vector(6 downto 0);
	instructionType, func3 : in std_logic_vector(2 downto 0);
	immediate, rs1, rs2 : in std_logic_vector(31 downto 0);
	PC : in std_logic_vector(31 downto 0);
	writeData, newAddress, rs1_out, rs2_out : out std_logic_vector(31 downto 0);
	RAMen, RAMwe, REGwe, jump_or_branch_flag:  out std_logic;
	rd_index_out : out std_logic_vector(4 downto 0);
	func3_out : out std_logic_vector(2 downto 0)
	);
end execute;
--internal shamt signal, overwrite with reg value if reg instead of immediate
--register file -> used to READ rs1 and rs2

architecture behavior of execute is

component alu32bit
	port(
		reg1 : in std_logic_vector(31 downto 0);
		reg2 : in std_logic_vector(31 downto 0);
		S : in std_logic_vector (3 downto 0); --mux select lines, will be used to pick the operation that will be performed
		shamt : in std_logic_vector(4 downto 0); --shift amount, only used for shift instructions
		ALUZero, ALULT, ALULTU : out std_logic; --zero flag, less than flag, unsigned less than flag
		output : out std_logic_vector(31 downto 0));
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

component PCNextCalc
	port(
		PC : in std_logic_vector(31 downto 0);
		PCOffsetFlag : in std_logic; --if true, branch was taken, PC_next <- PC + immediate, otherwise PC_next <- PC + 4
		JALRFlag : in std_logic; --if flag = '1', JALR was executed
		Immediate : in std_logic_vector(31 downto 0); --byte aligned immediate
		reg1 : in std_logic_vector(31 downto 0); --used for JALR instruction
		PC_next : out std_logic_vector(31 downto 0)
	);
end component;

signal rs1_internal, rs2_internal, ALU_input1_internal, ALU_input2_internal, writeData_internal, writeData_reg, rs1_reg, rs2_reg, RAMAddress_internal, RAMAddress_reg, newAddress_internal, newAddress_reg : std_logic_vector(31 downto 0) := (others => '0');
signal RAMwe_internal, RAMwe_reg, RAMen_internal, RAMen_reg, ALUZero_internal, ALULT_internal, ALULTU_internal, REGwe_internal, REGwe_reg, jump_or_branch_flag_internal, jump_or_branch_flag_reg, PCOffsetFlag, JALRFlag : std_logic := '0';
signal S_internal : std_logic_vector(3 downto 0) := (others => '0');
signal shamt_internal, rd_index_internal, rd_index_reg : std_logic_vector(4 downto 0) := (others => '0');
signal func3_internal, func3_reg : std_logic_vector(2 downto 0) := (others => '0');

begin
	rd_index_internal <= rd_index;
	func3_internal <= func3;
	rs1_internal <= rs1;
	rs2_internal <= rs2;
	process(immediate, rs1_internal, rs2_internal, PC, opcode, func3, func7, shamt) --this initial process will produce the inputs to be fed into the ALU. ANother process is required to handle branching
	begin
		case opcode is
			when "0110111" => --LUI
				--immediate to ALU output to be registered in writeback register
				ALU_input1_internal <= immediate;
				S_internal <= "0000";
				REGwe_internal <= '1';
			when "0010111" => --	AUIPC
				--adds an immediate to the program counter to be stored in rd. output is registered in writeback register
				ALU_input1_internal <= immediate;
				ALU_input2_internal <= PC;
				S_internal <= "0100";
				REGwe_internal <= '1';
			when "1101111" => --JAL
				--NEED TO HANDLE IN PIPELINING
				--saves PC + 4 to rd by calculating using ALU and registering output
				ALU_input1_internal <= PC;
				ALU_input2_internal <= x"00000004";
				S_internal <= "0100";
				REGwe_internal <= '1';
			when "1100111" => --JALR
				--NEED TO HANDLE IN PIPELINING
				--saves PC + 4 to rd by calculating using ALU and registering output
				ALU_input1_internal <= PC;
				ALU_input2_internal <= x"00000004";
				S_internal <= "0100";
				REGwe_internal <= '1';
			when "1100011" => --branch instructions, use ALU flags to determine if branch is taken. ALU output not used, only flags
				--NEED TO HANDLE IN PIPELINING
				ALU_input1_internal <= rs1_internal;
				ALU_input2_internal <= rs2_internal;
			when "0000011" => --load instructions, calculate RAM address
				ALU_input1_internal <= rs1_internal;
				ALU_input2_internal <= immediate;
				S_internal <= "0100";
				RAMen_internal <= '1';
				REGwe_internal <= '1';
			when "0100011" => --store instructions, calculate RAM address
				ALU_input1_internal <= rs1_internal;
				ALU_input2_internal <= immediate;
				S_internal <= "0100";
				RAMen_internal <= '1';
			when "0010011" => --arithmetic with immediate
				ALU_input1_internal <= rs1_internal;
				ALU_input2_internal <= immediate;
				REGwe_internal <= '1';
				case func3 is 
					when "000" => --ADDI rd, rs1, imm
						S_internal <= "0100";
					when "010" => --SLTI rd, rs1, imm
						S_internal <= "1100";
					when "011" => -- SLTIU rd, rs1, imm
						S_internal <= "1101";
					when "100" => --XORI rd, rs1, imm
						S_internal <= "1000";
					when "110" => --ORI rd, rs1, imm
						S_internal <= "0011";
					when "111" => --ANDI rd, rs1, imm
						S_internal <= "0010";
					when "001" => --SLLI rd, rs1, shamt
						shamt_internal <= shamt;
						S_internal <= "1001";
					when "101" => --right shift instructions
						case func7 is
							when "0000000" => --SRLI rd, rs11, shamt
								shamt_internal <= shamt;
								S_internal <= "1010";
							when "0100000" => --SRAI rd, rs1, shamt
								shamt_internal <= shamt;
								S_internal <= "1011";
							when others => 
						end case;
					when others =>
				end case;
			when "0110011" => --arithmetic with 2 registers
				ALU_input1_internal <= rs1_internal;
				ALU_input2_internal <= rs2_internal;
				REGwe_internal <= '1';
				case func3 is
				when "000" => --ADD/SUB
					case func7 is
						when "0000000" => -- ADD rd, rs1, rs2
							S_internal <= "0100";
						when "0100000" => -- SUB rd, rs1, rs2
							S_internal <= "0101";
						when others =>
					end case;
				when "001" => --SLL rd rs1, rs2
					S_internal <= "1001";
					shamt_internal <= rs2_internal(4 downto 0);
				when "010" => --SLT rd, rs1, rs2
					S_internal <= "1100";
				when "011" => --SLTU rd, rs1, rs2
					S_internal <= "1101";
				when "100" => --XOR rd, rs1, rs2
					S_internal <= "1000";
				when "101" => --right shift instructions
					shamt_internal <= rs2_internal(4 downto 0);
					case func7 is
						when "0000000" => --SRL rd, rs1, rs2
							S_internal <= "1010";
						when "0100000" => --SRA rd, rs1, rs2
							S_internal <= "1011";
						when others =>
					end case;
				when "110" => --OR rd, rs1, rs2
					S_internal <= "0011";
				when "111" => --AND rd, rs1, rs2
					S_internal <= "0010";
				when others =>
				end case;
			when others =>
		end case;
	end process;
	ALU_inst : alu32bit port map(reg1 => ALU_input1_internal, reg2 => ALU_input2_internal, S => S_internal, shamt => shamt_internal, ALUZero => ALUZero_internal, ALULT => ALULT_internal, ALULTU => ALULTU_internal, output => writeData_internal);
	process(writeData_internal, ALUZero_internal, ALULT_internal, ALULTU_internal)
	begin
		jump_or_branch_flag_internal <= '0';
		PCOffsetFlag <= '0';
		JALRFlag <= '0';
		if opcode = "1101111" then
			jump_or_branch_flag_internal <= '1';
			PCOffsetFlag <= '1';
		elsif opcode = "1100111" then
			jump_or_branch_flag_internal <= '1';
			JALRFlag <= '1';
		elsif opcode = "1100011" then --branch instructions, use ALU flags to determine if branch is taken. ALU output not used, only flags
			case func3 is
					when "000" => --BEQ
						if ALUZero_internal = '1' then
							jump_or_branch_flag_internal <= '1'; 
							PCOffsetFlag <= '1';
					end if;
					when "001" => --BNE
						if ALUZero_internal = '0' then
							jump_or_branch_flag_internal <= '1';
							PCOffsetFlag <= '1';
						end if;
					when "100" => --BLT
						if ALULT_internal = '1' then
							jump_or_branch_flag_internal <= '1';
							PCOffsetFlag <= '1';
						end if;
					when "101" => --BGE
						if ALULT_internal = '0' then
							jump_or_branch_flag_internal <= '1';
							PCOffsetFlag <= '1';
						end if;
					when "110" => --BLTU
						if ALULTU_internal = '1' then
							jump_or_branch_flag_internal <= '1';
							PCOffsetFlag <= '1';
						end if;
					when "111" => --BGEU
						if ALULTU_internal = '0' then
							jump_or_branch_flag_internal <= '1';
							PCOffsetFlag <= '1';
						end if;
					when others =>
				end case;
			end if;
	end process;
	PCNextCalc_inst : PCNextCalc port map(PC => PC, PCOffsetFlag => PCOffsetFlag, JALRFlag => JALRFlag, Immediate => immediate, reg1 => rs1_internal, PC_next => newAddress_internal);
	process(clk, reset)
	begin
		if reset = '1' then
			writeData_reg <= (others => '0');
			rs1_reg <= (others => '0');
			rs2_reg <= (others => '0');
			RAMen_reg <= '0';
			RAMwe_reg <= '0';
			REGwe_reg <= '0';
			rd_index_reg <= (others => '0');
			func3_reg <= (others => '0');
			newAddress_reg <= (others => '0');
			jump_or_branch_flag_reg <= '0';
		elsif rising_edge(clk) then
			writeData_reg <= writeData_internal;
			rs1_reg <= rs1_internal;
			rs2_reg <= rs2_internal;
			RAMen_reg <= RAMen_internal;
			RAMwe_reg <= RAMwe_internal;
			REGwe_reg <= REGwe_internal;
			rd_index_reg <= rd_index_internal;
			func3_reg <= func3_internal;
			newAddress_reg <= newAddress_internal;
			jump_or_branch_flag_reg <= jump_or_branch_flag_internal;
		end if;
	end process;
	writeData <= writeData_reg;
	rs1_out <= rs1_reg;
	rs2_out <= rs2_reg;
	RAMen <= RAMen_reg;
	RAMwe <= RAMwe_reg;
	REGwe <= REGwe_reg;
	rd_index_out <= rd_index_reg;
	func3_out <= func3_reg;
	newAddress <= newAddress_reg;
	jump_or_branch_flag <= jump_or_branch_flag_reg;
end behavior;