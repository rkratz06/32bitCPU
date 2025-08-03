--32 bit alu
--currently has add, sub, and, or, and not
--some ideas to add: shift reg1 and reg2 left and right, xor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu32bit is
	port(
		reg1 : in std_logic_vector(31 downto 0);
		reg2 : in std_logic_vector(31 downto 0);
		cin : in std_logic; --carry in for addition
		s : in std_logic_vector (2 downto 0); --mux select lines, will be used to pick the operation that will be performed
		output : out std_logic_vector(31 downto 0));
end alu32bit;

architecture behavior of alu32bit is
signal resultSum : std_logic_vector(31 downto 0);
signal resultAnd : std_logic_vector(31 downto 0);
signal resultOr : std_logic_vector(31 downto 0);
signal resultSub : std_logic_vector(31 downto 0);
signal resultNot1 : std_logic_vector(31 downto 0);
signal resultNot2 : std_logic_vector(31 downto 0);

signal unsignedReg1 : unsigned(31 downto 0);
signal unsignedReg2 : unsigned(31 downto 0);
signal unsignedCin : unsigned(31 downto 0); --sign extended cin

begin
	unsignedReg1 <= unsigned(reg1);
	unsignedReg2 <= unsigned(reg2);
	unsignedCin <= (31 downto 1 => '0') & cin;
	
	resultSum <= std_logic_vector(unsignedReg1 + unsignedReg2 + unsignedCin);
	resultAnd <= reg1 and reg2;
	resultOr <= reg1 or reg2;
	resultSub <= std_logic_vector(unsignedReg1 - unsignedReg2);
	resultNot1 <= not reg1;
	resultNot2 <= not reg2;
	
	process(s, resultSum, resultAnd, resultOr, resultSub, resultNot1, resultNot2)
	begin
		case s is 
			when "000" => output <= reg1;
			when "001" => output <= reg2;
			when "010" => output <= resultAnd;
			when "011" => output <= resultOr;
			when "100" => output <= resultSum;
			when "101" => output <= resultSub;
			when "110" => output <= resultNot1;
			when "111" => output <= resultNot2;
		end case;
	end process;
end;