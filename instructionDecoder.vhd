--instruction decoder
--returns the opcode, func3, and func7 of each instruction (not all instructions use func3 or func7, so may contain garbage data. 
--however, state machine will not examine func3 or func7 in instructions that do not contain it)
--instruction type is determined by the opcode and gives information such as the location of the bits of an immediate in the instruction

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instructionDecoder is
	port(
		IR : in std_logic_vector(31 downto 0); --instruction, comes from instruction register
		JALRFlag : out std_logic; --only 1 if instruction executed is JALR
		instructionType : out std_logic_vector(2 downto 0);
		--000 = R, 001 = I, 010 = S, 011 = SB, 100 = U, 101 = UJ
		opcode : out std_logic_vector(6 downto 0);
		func3 : out std_logic_vector(2 downto 0);
		func7 : out std_logic_vector(6 downto 0);
		shamt : out std_logic_vector(4 downto 0)
		rs1_index, rs2_index, rd_index : out std_logic_vector(4 downto 0));
end instructionDecoder;

architecture behavior of instructionDecoder is
begin
	process(IR)
	begin
		JALRFlag <= '0'; --only true if JALR executed, default to false
		case IR(6 downto 0) is
			when "0110111" => --LUI rd, imm
				instructionType <= "100";
				--state machine module will load write register with immediate from immediateCalc module
			when "0010111" => --AUIPC rd, imm
				instructionType <= "100";
				--PCNextCalc will get new PC, state machine will set PC to PC next and set PCOffsetFlag to true
			when "1101111" => --JAL rd, imm
				instructionType <= "101";
				--PCNextCalc will get new PC, state machine sets PC to PC next and sets return register to PC (NOT PC_next) + 4 and set PCOffsetFlag to true
			when "1100111" => --JALR rd, rs1, imm
				instructionType <= "001";
				JALRFlag <= '1';
			when "1100011" => --branch instructions
				instructionType <= "011";
			when "0000011" => --load instructions
				instructionType <= "001";
			when "0100011" => --store instructions
				instructionType <= "010";
			when "0010011" => --arithmetic operations with immediates
				instructionType <= "001";
			when "0110011" => --arithmetic with 2 registers 
				instructionType <= "000";
			when "1110011" => --other instructions, to add later
			when others =>
		end case;
	end process;
	opcode <= IR(6 downto 0);
	func3 <= IR(14 downto 12);
	func7 <= IR(24 downto 20);
	shamt <= IR(24 downto 20);
	rs1_index <= IR(19 downto 15);
	rs2_index <= IR(24 downto 20);
	rd_index <= IR(11 downto 7);
end behavior;