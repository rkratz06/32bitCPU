--alu controller

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aluController is
	port(
		IR : in std_logic_vector(31 downto 0); --instruction, comes from instruction register
		Q : in std_logic_vector (2 downto 0); --state bits, increase size later
		writeReg : out std_logic_vector(4 downto 0);
		readReg1 : out std_logic_vector(4 downto 0);
		readReg2 : out std_logic_vector(4 downto 0);
		IR_LD : out std_logic;
		PC_INC : out std_logic;
		PC_LD : out std_logic;
		S : out std_logic_vector(2 downto 0); --mux select lines for ALU
		immediate : out std_logic_vector(31 downto 0); --used to output immediate values
		we : out std_logic); --write enable, if return register is altered will be true
end aluController;

architecture behavior of aluController is
signal opcode : std_logic_vector(6 downto 0);
signal func3: std_logic_vector(2 downto 0);
signal func7: std_logic_vector(6 downto 0);
begin
	--add pipelining later
	
	opcode <= IR(6 downto 0);
	
	process(opcode, Q, IR)
	begin
		writeReg <=	IR(11 downto 7); --default potision of return register
		readReg1 <= IR(19 downto 15); --default position of rs1
		readReg2 <= IR(24 downto 20); --default position of rs2
		func3 <= IR(14 downto 12); --default position of func3
		func7 <= IR(31 downto 25);
		IR_LD <= '0'; --do not load on default
		PC_INC <= '1'; --increment PC on default
		PC_LD <= '0'; --do not load pc on default
		S <= "000"; --default reg1 to output on ALU
		we <= '1';
		case opcode is
			when "0110111" => --LUI rd, imm
				immediate <= IR(31 downto 12) & "000000000000";
				PC_INC <= '1';
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
			when "0010111" => --AUIPC rd, imm
				PC_LD <= '1';
				immediate <= IR(31 downto 12) & "000000000000";
				PC_INC <= '0';
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
			when others =>
				writeReg <= (others => '0');
				readReg1 <= (others => '0');
				readReg2 <= (others => '0');
				PC_INC <= '0';
				immediate <= (others => '0');
		end case;
	end process;
end behavior;