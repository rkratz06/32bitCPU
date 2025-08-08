--instruction decoder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instructionDecoder is
	port(
		IR : in std_logic_vector(31 downto 0); --instruction, comes from instruction register
		writeReg : out std_logic_vector(4 downto 0);
		readReg1 : out std_logic_vector(4 downto 0);
		readReg2 : out std_logic_vector(4 downto 0);
		JALRFlag : out std_logic; --only 1 if instruction executed is JALR
		instructionType : out std_logic_vector(2 downto 0);
		--000 = R, 001 = I, 010 = S, 011 = SB, 100 = U, 101 = UJ
		opcode : out std_logic_vector(6 downto 0);
		func3 : out std_logic_vector(2 downto 0);
		func7 : out std_logic_vector(6 downto 0);
		shamt : out std_logic_vector(4 downto 0));
end instructionDecoder;

architecture behavior of instructionDecoder is
signal opcode_internal : std_logic_vector(6 downto 0);
signal func3_internal : std_logic_vector(2 downto 0);
signal func7_internal : std_logic_vector(6 downto 0);
begin
	--add pipelining later
	
	opcode_internal <= IR(6 downto 0);
	func3_internal <= IR(14 downto 12); --default position of func3
	func7_internal <= IR(31 downto 25); --default position of func7
	
	process(opcode_internal, IR, func3_internal, func7_internal)
	begin
		writeReg <=	IR(11 downto 7); --default potision of return register
		readReg1 <= IR(19 downto 15); --default position of rs1
		readReg2 <= IR(24 downto 20); --default position of rs2
		shamt <= (others => '0');
		JALRFlag <= '0'; --only true if JALR executed, default to false
		case opcode_internal is
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
				writeReg <= (others => '0');
			when "0000011" => --load instructions
				InstructionType <= "001";
				readReg2 <= (others => '0');
			when "0100011" => --store instructions
				InstructionType <= "010";
				writeReg <= (others => '0');
			when "0010011" => --arithmetic operations with immediates
				InstructionType <= "001";
				readReg2 <= (others => '0');
				case func3_internal is
					when "001" => --SLLI rd, rs1, shamt
						shamt <= IR(24 downto 20);
					when "101" => --right shift instructions
						shamt <= IR(24 downto 20);
					when others =>
				end case;
			when "0110011" => --arithmetic with 2 registers
				InstructionType <= "000";
			when "0001111" => --fence instructions
				case func3_internal is
					when "000" => --FENCE
					when "001" => --FENCE.I
					when others =>
				end case;
			when "1110011" => --other instructions, to add later
			when others =>
				writeReg <= (others => '0');
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
		end case;
	end process;
	opcode <= opcode_internal;
	func3 <= func3_internal;
	func7 <= func7_internal;
end behavior;