--alu controller

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aluController is
	port(
		IR : in std_logic_vector(31 downto 0); --instruction, comes from instruction register
		Q : in std_logic_vector (2 downto 0); --state bits, increase size later
		writeReg : out integer;
		readReg1 : out integer;
		readReg2 : out integer;
		IR_LD : out std_logic;
		PC_INC : out std_logic;
		PC_LD : out std_logic;
		S : out std_logic_vector(2 downto 0); --mux select lines for ALU
		output : out std_logic_vector(31 downto 0); --used to output immediate values
end aluController;

architecture behavior of aluController is
signal opcode : std_logic_vector(6 downto 0);
begin
	--add pipelining later
	
	opcode <= IR(6 downto 0);
	
	process(opcode, Q, IR)
	begin
		case opcode is
			when "0110111" => --LUI rd, imm
				writeReg <= integer(unsigned(IR(11 downto 7)));
				output <= IR(31 downto 12) & "000000000000";
				IR_LD <= '0';
				PC_INC <= '1';
				PC_LD <= '0';
				S <= "000";
				readReg1 <= 0;
				readReg2 <= 0;
			when "0010111" => --AUIPC rd, imm
				PC_LD <= '1';
				output <= IR(31 downto 12) & "000000000000";
				IR_LD <= '0';
				PC_INC <= '0';
				S <= "000";
				readReg1 <= 0;
				readReg2 <= 0;
				writeReg <= integer(unsigned(IR(11 downto 7)));
			when others =>
				writeReg <= 0;
				readReg1 <= 0;
				readReg2 <= 0;
				PC_LD <= '0';
				PC_INC <= '0';
				S <= "000";
				IR_LD <= '0';
				output <= (others => '0');
		end case;
	end process;
end behavior;