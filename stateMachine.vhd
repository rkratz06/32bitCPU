--Handles state machine for controller

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stateMachine is
	port(
		Q : in std_logic_vector(4 downto 0); --current state, starting off with max 12 states, can expand if not enough
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
		D : out std_logic_vector(4 downto 0); --next state
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
		RAMbyteEN : out std_logic_vector(3 downto 0);
		RAMen : out std_logic); --ram is only enabled as long as RAMen = '1' and RAMAddress[14] = 1
end stateMachine;

architecture behavior of stateMachine is
--states listed below
constant FETCH : std_logic_vector(4 downto 0) := "00000";
constant DECODE : std_logic_vector(4 downto 0) := "00001";
constant RAM_ADDR : std_logic_vector(4 downto 0) := "00011";
constant RAM_WRITE : std_logic_vector(4 downto 0) := "00100";
constant WRITEBACK : std_logic_vector(4 downto 0) := "00101";
constant RAM_WAIT : std_logic_vector(4 downto 0) := "00010";
constant EXECUTE : std_logic_vector(4 downto 0) := "01000";
constant FETCH_AFTER_PC : std_logic_vector(4 downto 0) := "00111";

begin
	process(Q, immediate, reg1, reg2, PC, ALU_output, opcode, func3, func7, RAMData, shamt, ALUZero, ALULT, ALULTU, reset)
	begin
		IR_LD <= '0';
		PCOffsetFlag <= '0';
		D <= FETCH;
		writeData <= (others => '0');
		RegWE <= '0';
		RAMwe <= '0';
		PC_LD <= '0';
		UpdateRAMAddress <= '0';
		S <= "0000";
		RAMen <= '0';
		ALU_input1 <= x"00000000";
		ALU_input2 <= x"00000000";
		shamt_out <= shamt;
		RAMbyteEN <= (others => '0');
		updateWritebackReg <= '0';
		if reset = '1' then --reset state, force PC to be 0
		else
			case Q is
			when FETCH => --instruction fetch
				PC_LD <= '1';
				D <= DECODE;
			when DECODE =>  --decode phase, instruction decoder runs in background, values are stable after clock cycle
				IR_LD <= '1';
				D <= EXECUTE;
			when EXECUTE =>
				case opcode is
					when "0110111" => --LUI
						ALU_input1 <= immediate;
						updateWritebackReg <= '1';
						writeData <= ALU_output;
						S <= "0000";
						D <= WRITEBACK;
					when "0010111" => --	AUIPC
						ALU_input1 <= immediate;
						ALU_input2 <= PC;
						updateWritebackReg <= '1';
						writeData <= ALU_output;
						S <= "0100";
						D <= WRITEBACK;
					when "1101111" => --JAL
						PCOffsetFlag <= '1';
						PC_LD <= '1';
						D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
					when "1100111" => --JALR
						--JALRFlag set in decoder
						writeData <= PC;
						updateWritebackReg <= '1';
						PC_LD <= '1';
						D <= WRITEBACK;
					when "1100011" => --branch instructions
					D <= FETCH;
						case func3 is
							when "000" =>
								if ALUZero = '1' then
									PCOffsetFlag <= '1';
									PC_LD <= '1';
									D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
							end if;
							when "001" =>
								if ALUZero = '0' then
									PCOffsetFlag <= '1';
									PC_LD <= '1';
									D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
								end if;
							when "100" =>
								if ALULT = '1' then
									PCOffsetFlag <= '1';
									PC_LD <= '1';
									D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
								end if;
							when "101" =>
								if ALULT = '0' then
									PCOffsetFlag <= '1';
									PC_LD <= '1';
									D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
								end if;
							when "110" =>
								if ALULTU = '1' then
									PCOffsetFlag <= '1';
									PC_LD <= '1';
									D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
								end if;
							when "111" =>
								if ALULTU = '0' then
									PCOffsetFlag <= '1';
									PC_LD <= '1';
									D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
								end if;
							when others =>
						end case;
					when "0000011" => --load instructions, calculate RAM address
						ALU_input1 <= reg1;
						ALU_input2 <= immediate;
						S <= "0100";
						updateRAMAddress <= '1';
						RAMen <= '1';
						D <= RAM_WAIT;
					when "0100011" => --store instructions, calculate RAM address
						ALU_input1 <= reg1;
						ALU_input2 <= immediate;
						S <= "0100";
						updateRAMAddress <= '1';
						RAMen <= '1';
						D <= RAM_WRITE;
					when "0010011" => --arithmetic with immediate
						updateWritebackReg <= '1'; --output of ALU will be registered to be used in writeback state
						ALU_input1 <= reg1;
						ALU_input2 <= immediate;
						D <= WRITEBACK;
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
								S <= "1001";
							when "101" => --right shift instructions
								case func7 is
									when "0000000" => --SRLI rd, rs11, shamt
										S <= "1010";
									when "0100000" => --SRAI rd, rs1, shamt
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
						D <= WRITEBACK;
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
			when RAM_WAIT => --waits a clock cycle for synchronous RAM access
				RAMen <= '1';
				updateWritebackReg <= '1';
				D <= WRITEBACK;
				case func3 is
					when "000" =>
						writeData <= std_logic_vector(resize(signed(RAMData(7 downto 0)), 32));
					when "001" =>
						writeData <= std_logic_vector(resize(signed(RAMData(15 downto 0)), 32));
					when "010" => 
						writeData <= RAMData;
					when "100" =>
						writeData <= std_logic_vector(resize(unsigned(RAMData(7 downto 0)), 32));
					when "101" =>
						writeData <= std_logic_vector(resize(unsigned(RAMData(15 downto 0)), 32));
					when others =>
				end case;
			when RAM_WRITE => --RAM Write state
				RAMen <= '1';
				D <= FETCH;
				RAMwe <= '1';
				writeRAMData <= reg2;
				case func3 is
					when "000" =>
						RAMbyteEN <= "0001";
					when "001" =>
						RAMbyteEN <= "0011";
					when "010" =>
						RAMbyteEN <= "1111";
					when others =>
				end case;
			when WRITEBACK => --writeback state
				RegWE <= '1';
				if JALRFlag = '1' then
					D <= FETCH_AFTER_PC; --fetch state without PC_LD, avoids PC immediately incrementing
				else
					D <= FETCH; --every instruction other than JALR can proceed back to fetch
				end if;
			when FETCH_AFTER_PC => --fetch state with no PC_LD
				D <= DECODE;
			when others =>
			end case;
		end if;
	end process;
end behavior;