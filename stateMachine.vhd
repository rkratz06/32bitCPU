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
		ALUZero, ALULT, ALULTU : in std_logic;
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
		useRAM : out std_logic); --ram is only enabled as long as useRAM = '1' and RAMAddress[14] = 1
end stateMachine;

architecture behavior of stateMachine is
begin
	process(Q, immediate, reg1, reg2, PC, ALU_output, opcode, func3, func7, RAMData, shamt)
	begin
		IR_LD <= '0';
		PCOffsetFlag <= '0';
		D <= "00000";
		writeData <= (others => '0');
		RegWE <= '0';
		RAMwe <= '0';
		PC_LD <= '0';
		UpdateRAMAddress <= '0';
		S <= "0000";
		useRAM <= '0';
		ALU_input1 <= x"00000000";
		ALU_input2 <= x"00000000";
		shamt_out <= shamt;
		RAMbyteEN <= (others => '0');
		case Q is
		when "00000" => --instruction fetch
			IR_LD <= '1';
			PC_LD <= '1';
		when "00001" =>  --decode/execute phase
			case opcode is
				when "1100111" =>
					 D <= "00010";
				when "0110111" => 
					 D <= "00010";
				when "0010111" =>
					 D <= "00010";
				when "1101111" =>
					 D <= "00010";
				when "1100011" => --branch instructions
					case func3 is
						when "000" =>
							if ALUZero = '1' then
								PCOffsetFlag <= '1';
						end if;
						when "001" =>
							if ALUZero = '0' then
								PCOffsetFlag <= '1';
							end if;
						when "100" =>
							if ALULT = '1' then
								PCOffsetFlag <= '1';
							end if;
						when "101" =>
							if ALULT = '0' then
								PCOffsetFlag <= '1';
							end if;
						when "110" =>
							if ALULTU = '1' then
								PCOffsetFlag <= '1';
							end if;
						when "111" =>
							if ALULTU = '0' then
								PCOffsetFlag <= '1';
							end if;
						when others =>
					end case;
					D <= "00010"; --update PC next state;
				when "0000011" => --load instructions
					ALU_input1 <= reg1;
					ALU_input2 <= immediate;
					S <= "0100";
					UpdateRAMAddress <= '1';
					D <= "00011"; --go to memory access state
				when "0100011" => --store instructions
					ALU_input1 <= reg1;
					ALU_input2 <= immediate;
					S <= "0100";
					UpdateRAMAddress <= '1';
					D <= "00100"; --RAM write state
				when "0010011" => --arithmetic with immediate
					ALU_input1 <= reg1;
					ALU_input2 <= immediate;
					D <= "00101";
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
				when "0110011" =>
					ALU_input1 <= reg1;
					ALU_input2 <= reg2;
					D <= "00101";
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
				when others =>
			end case;
		when "00010" => --PC Update
			PC_LD <= '1';
		when "00011" => --RAM read state
			useRAM <= '1';
			D <= "00101"; --to writeback state
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
		when "00100" => --RAM Write state
			useRAM <= '1';
			D <= "00000";
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
		when "00101" => --writeback state
			RegWE <= '1';
			D <= "00000";
			if opcode = "0000011" then
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
			else
				writeData <= ALU_output;
			end if;
		when others =>
		end case;
	end process;
end behavior;