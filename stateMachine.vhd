--Handles state machine for controller

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stateMachine is
	port(
		Q : in std_logic_vector(2 downto 0); --current state, starting off with max 12 states, can expand if not enough
		immediate : in std_logic_vector(31 downto 0);
		reg1 : in std_logic_vector(31 downto 0);
		reg2 : in std_logic_vector(31 downto 0);
		PC : in std_logic_vector(31 downto 0); --used in JAL instruction to store PC
		ALU_output : in std_logic_vector(31 downto 0);
		opcode : in std_logic_vector(6 downto 0);
		func3 : in std_logic_vector(2 downto 0);
		func7 : in std_logic_vector(6 downto 0);
		RAMData : in std_logic_vector(31 downto 0); --data output from RAM
		shamt : in std_logic_vector(4 downto 0);
		ALUZero, ALULT, ALULTU, reset, JALRFlag : in std_logic;
		updateWritebackReg : out std_logic;
		IR_LD : out std_logic;
		PCOffsetFlag : out std_logic;
		D : out std_logic_vector(2 downto 0); --next state
		writeData : out std_logic_vector(31 downto 0); --data to write to register
		writeRAMData : out std_logic_vector(31 downto 0);
		RegWE : out std_logic;
		RAMwe : out std_logic; --ram write enable, '1' if RAM written, '0' if RAM read
		PC_LD : out std_logic;
		UpdateRAMAddress : out std_logic;
		S : out std_logic_vector(3 downto 0);
		ALU_input1 : out std_logic_vector(31 downto 0);
		ALU_input2 : out std_logic_vector(31 downto 0);
		shamt_out : out std_logic_vector(4 downto 0);
		RAMbyteEN : out std_logic_vector(3 downto 0));
end stateMachine;

architecture behavior of stateMachine is
--states listed below
constant FETCH : std_logic_vector(2 downto 0) := "000";
constant DECODE : std_logic_vector(2 downto 0) := "001";
constant EXECUTE : std_logic_vector(2 downto 0) := "010";
constant MEM : std_logic_vector(2 downto 0) := "011";
constant WRITEBACK : std_logic_vector(2 downto 0) := "100";

begin
	process(Q, immediate, reg1, reg2, PC, ALU_output, opcode, func3, func7, RAMData, shamt, ALUZero, ALULT, ALULTU, reset)
	begin
		--default values are set to 0, overrwritten in states where necessary
		IR_LD <= '0';
		PCOffsetFlag <= '0';
		D <= FETCH;
		writeData <= (others => '0');
		RegWE <= '0';
		RAMwe <= '0';
		PC_LD <= '0';
		UpdateRAMAddress <= '0';
		S <= "0000";
		ALU_input1 <= x"00000000";
		ALU_input2 <= x"00000000";
		writeRAMData <= x"00000000";
		shamt_out <= "00000";
		RAMbyteEN <= (others => '0');
		updateWritebackReg <= '0';
		if reset = '1' then --reset state, force PC to be 0
		else
			case Q is
			when FETCH => --instruction fetch
				IR_LD <= '1';
				D <= DECODE;
			when DECODE =>  --decode phase, add decoder as a component to be used in this state when pipelining added, for now decoder runs in background
				D <= EXECUTE;
			when EXECUTE => --execute stage
				PC_LD <= '1'; --program counter is updated in execute stage as necessary flags will be calculated in execute stage
				D <= MEM;
				case opcode is
					when "0110111" => --LUI
						--immediate to ALU output to be registered in writeback register
						ALU_input1 <= immediate;
						updateWritebackReg <= '1';
						writeData <= ALU_output;
						S <= "0000";
					when "0010111" => --	AUIPC
						--adds an immediate to the program counter to be stored in rd. output is registered in writeback register
						ALU_input1 <= immediate;
						ALU_input2 <= PC;
						updateWritebackReg <= '1';
						writeData <= ALU_output;
						S <= "0100";
					when "1101111" => --JAL
						--program counter updated with PC + immediate
						--saves PC + 4 to rd by calculating using ALU and registering output
						PCOffsetFlag <= '1';
						ALU_input1 <= PC;
						ALU_input2 <= x"00000004";
						S <= "0100";
						writeData <= ALU_output;
						updateWritebackReg <= '1';
					when "1100111" => --JALR
						--JALRFlag set in decoder, used to calculate new PC
						--saves PC + 4 to rd by calculating using ALU and registering output
						ALU_input1 <= PC;
						ALU_input2 <= x"00000004";
						S <= "0100";
						writeData <= ALU_output;
						updateWritebackReg <= '1';
					when "1100011" => --branch instructions, use ALU flags to determine if branch is taken. ALU output not used, only flags
						ALU_input1 <= reg1;
						ALU_input2 <= reg2;
						case func3 is
							when "000" => --BEQ
								if ALUZero = '1' then
									PCOffsetFlag <= '1'; 
							end if;
							when "001" => --BNE
								if ALUZero = '0' then
									PCOffsetFlag <= '1';
								end if;
							when "100" => --BLT
								if ALULT = '1' then
									PCOffsetFlag <= '1';
								end if;
							when "101" => --BGE
								if ALULT = '0' then
									PCOffsetFlag <= '1';
								end if;
							when "110" => --BLTU
								if ALULTU = '1' then
									PCOffsetFlag <= '1';
								end if;
							when "111" => --BGEU
								if ALULTU = '0' then
									PCOffsetFlag <= '1';
								end if;
							when others =>
						end case;
					when "0000011" => --load instructions, calculate RAM address
						ALU_input1 <= reg1;
						ALU_input2 <= immediate;
						S <= "0100";
						updateRAMAddress <= '1';
					when "0100011" => --store instructions, calculate RAM address
						ALU_input1 <= reg1;
						ALU_input2 <= immediate;
						S <= "0100";
						updateRAMAddress <= '1';
					when "0010011" => --arithmetic with immediate
						updateWritebackReg <= '1'; --output of ALU will be registered to be used in writeback state
						ALU_input1 <= reg1;
						ALU_input2 <= immediate;
						case func3 is 
							when "000" => --ADDI rd, rs1, imm
								S <= "0100";
							when "010" => --SLTI rd, rs1, imm
								S <= "1100";
							when "011" => -- SLTIU rd, rs1, imm
								S <= "1101";
							when "100" => --XORI rd, rs1, imm
								S <= "1000";
							when "110" => --ORI rd, rs1, imm
								S <= "0011";
							when "111" => --ANDI rd, rs1, imm
								S <= "0010";
							when "001" => --SLLI rd, rs1, shamt
								shamt_out <= shamt;
								S <= "1001";
							when "101" => --right shift instructions
								case func7 is
									when "0000000" => --SRLI rd, rs11, shamt
										shamt_out <= shamt;
										S <= "1010";
									when "0100000" => --SRAI rd, rs1, shamt
										shamt_out <= shamt;
										S <= "1011";
									when others => 
								end case;
							when others =>
						end case;
						writeData <= ALU_output;
					when "0110011" => --arithmetic with 2 registers
						updateWritebackReg <= '1'; --output of ALU will be registered to be used in writeback state
						ALU_input1 <= reg1;
						ALU_input2 <= reg2;
						case func3 is
						when "000" => --ADD/SUB
							case func7 is
								when "0000000" => -- ADD rd, rs1, rs2
									S <= "0100";
								when "0100000" => -- SUB rd, rs1, rs2
									S <= "0101";
								when others =>
							end case;
						when "001" => --SLL rd rs1, rs2
							S <= "1001";
							shamt_out <= reg2(4 downto 0);
						when "010" => --SLT rd, rs1, rs2
							S <= "1100";
						when "011" => --SLTU rd, rs1, rs2
							S <= "1101";
						when "100" => --XOR rd, rs1, rs2
							S <= "1000";
						when "101" => --right shift instructions
							shamt_out <= reg2(4 downto 0);
							case func7 is
								when "0000000" => --SRL rd, rs1, rs2
									S <= "1010";
								when "0100000" => --SRA rd, rs1, rs2
									S <= "1011";
								when others =>
							end case;
						when "110" => --OR rd, rs1, rs2
							S <= "0011";
						when "111" => --AND rd, rs1, rs2
							S <= "0010";
						when others =>
						end case;
						writeData <= ALU_output;
					when others =>
				end case;
			when MEM =>
				D <= WRITEBACK;
				if opcode = "0000011" then --load instruction
					updateWritebackReg <= '1';
					RAMbyteEN <= "1111";
					case func3 is
						when "000" => --load byte
							writeData <= std_logic_vector(resize(signed(RAMData(7 downto 0)), 32));
						when "001" => --load half word
							writeData <= std_logic_vector(resize(signed(RAMData(15 downto 0)), 32));
						when "010" => --load word
							writeData <= RAMData;
						when "100" => --load byte unsigned
							writeData <= std_logic_vector(resize(unsigned(RAMData(7 downto 0)), 32));
						when "101" => --load half word unsigned
							writeData <= std_logic_vector(resize(unsigned(RAMData(15 downto 0)), 32));
						when others =>
					end case;
				elsif opcode = "0100011" then --store instruction
					RAMwe <= '1';
					writeRAMData <= reg2;
					case func3 is
						when "000" => --store byte
							RAMbyteEN <= "0001";
						when "001" => --store half word
							RAMbyteEN <= "0011";
						when "010" => --store word
							RAMbyteEN <= "1111";
						when others =>
					end case;
				end if;
			when WRITEBACK => --writeback state
				if opcode = "0110111" or 
				opcode = "0010111" or 
				opcode = "1101111" or 
				opcode = "1100111" or 
				opcode = "0000011" or 
				opcode = "0010011" or 
				opcode = "0110011" then --if instruction writes to a register, set RegWE to true
					RegWE <= '1';
				end if;
				D <= FETCH;
			when others =>
			end case;
		end if;
	end process;
end behavior;