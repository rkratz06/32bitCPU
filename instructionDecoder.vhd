--alu controller

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instructionDecoder is
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
		instructionType : out std_logic_vector(2 downto 0);
		--000 = R, 001 = I, 010 = S, 011 = SB, 100 = U, 101 = UJ
		shamt : out std_logic_vector(4 downto 0);
		UpdateRAMAddress : out std_logic);
end instructionDecoder;

architecture behavior of instructionDecoder is
signal opcode : std_logic_vector(6 downto 0);
signal func3: std_logic_vector(2 downto 0);
signal func7: std_logic_vector(6 downto 0);
begin
	--add pipelining later
	
	opcode <= IR(6 downto 0);
	func3 <= IR(14 downto 12); --default position of func3
	func7 <= IR(31 downto 25); --default position of func7
	
	process(opcode, IR, func3, func7)
	begin
		writeReg <=	IR(11 downto 7); --default potision of return register
		readReg1 <= IR(19 downto 15); --default position of rs1
		readReg2 <= IR(24 downto 20); --default position of rs2
		shamt <= (others => '0');
		PC_LD <= '1'; --load new PC value by default, only do not load after pipelining added for stalls
		S <= "0000"; --default reg1 to output on ALU
		we <= '1';
		JALRFlag <= '0'; --only true if JALR executed, default to false
		isBranch <= '0'; --only true if is branch instruction
		UpdateRAMAddress <= '0'; --only true if load or store instruction is selected
		case opcode is
			when "0110111" => --LUI rd, imm
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
				instructionType <= "100";
				--state machine module will load write register with immediate from immediateCalc module
			when "0010111" => --AUIPC rd, imm
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
				instructionType <= "100";
				--PCNextCalc will get new PC, state machine will set PC to PC next and set PCOffsetFlag to true
			when "1101111" => --JAL rd, imm
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
				instructionType <= "101";
				--PCNextCalc will get new PC, state machine sets PC to PC next and sets return register to PC (NOT PC_next) + 4 and set PCOffsetFlag to true
			when "1100111" => --JALR rd, rs1, imm
				instructionType <= "001";
				readReg2 <= (others => '0');
				JALRFlag <= '1';
			when "1100011" => --branch instructions
				instructionType <= "011";
				isBranch <= '1';
				writeReg <= (others => '0');
				case func3 is
					when "000" => --BEQ rs1, rs2, imm
						S <= "1000"; --if rs1 xor rs2 = 0, they are equal. check if output is 0 in state machine to determine if branch
					when "001" => --BNE rs1, rs2, imm
						S <= "1000"; --if rs1 xor rs2 /= 0, they are not equal. check if output is not 0 in state machine to determine if branch
					when "100" => --BLT rs1, rs2, imm
						S <= "1100";
					when "101" => --BGE rs1, rs2, imm
						--rs1 > rs2 is the same as rs2 < rs1
						readReg1 <= IR(24 downto 20);
						readReg2 <= IR(19 downto 15);
						S <= "1100";
					when "110" => --BLTU rs1, rs2, imm
						S <= "1101";
					when "111" => --BGEU rs1, rs2, imm
						--rs1 > rs2 is the same as rs2 < rs1
						readReg1 <= IR(24 downto 20);
						readReg2 <= IR(19 downto 15);
						S <= "1101";
					when others =>
				end case;
			when "0000011" => --load instructions
				case func3 is
					when "000" => --LB rd, rs1, imm
					when "001" => --LH rd, rs1, imm
					when "010" => --LW rd, rs1, imm
					when "100" => --LBU rd, rs1, imm
					when "101" => --LHU rd, rs1, imm
					when others =>
				end case;
			when "0100011" => --store instructions
				case func3 is
					when "000" => --SB rs1, rs2, imm
					when "001" => --Sh rs1, rs2, imm
					when "010" => --SW rs1, rs2, imm
					when others =>
				end case;
			when "0010011" => --arithmetic operations with immediates
				case func3 is 
					when "000" => --ADDI rd, rs1, imm
					when "010" => --SLTI rd, rs1, imm
					when "011" => -- SLTIU rd, rs1, imm
					when "100" => --XORI rd, rs1, imm
					when "110" => --ORI rd, rs1, imm
					when "111" => --ANDI rd, rs1, imm
					when "001" => --SLLI rd, rs1, shamt
						shamt <= IR(24 downto 20);
					when "101" => --right shift instructions
						shamt <= IR(24 downto 20);
						case func7 is
							when "0000000" => --SRLI rd, rs11, shamt
							when "0100000" => --SRAI rd, rs1, shamt
							when others => 
						end case;
					when others =>
				end case;
			when "0110011" => --arithmetic with 2 registers
				case func3 is
					when "000" => --ADD/SUB
						case func7 is
							when "0000000" => -- ADD rd, rs1, rs2
							when "0100000" => -- SUB rd, rs1, rs2
							when others =>
						end case;
					when "001" => --SLL rd rs1, rs2
					when "010" => --SLT rd, rs1, rs2
					when "011" => --SLTU rd, rs1, rs2
					when "100" => --XOR rd, rs1, rs2
					when "101" => --right shift instructions
						case func7 is
							when "0000000" => --SRL rd, rs1, rs2
							when "0100000" => --SRA rd, rs1, rs2
							when others =>
						end case;
					when "110" => --OR rd, rs1, rs2
					when "111" => --AND rd, rs1, rs2
				end case;
			when "0001111" => --fence instructions
				case func3 is
					when "000" => --FENCE
					when "001" => --FENCE.I
					when others =>
				end case;
			when "1110011" => --other instructions, to add later
			when others =>
				writeReg <= (others => '0');
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
				we <= '0';
		end case;
	end process;
end behavior;