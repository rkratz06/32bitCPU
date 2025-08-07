--Immediate value calculator
--takes an instruction, instruction type, and returns a byte-aligned immidiate

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity immediateCalc is 
	port(
		instructionType : in std_logic_vector(2 downto 0); --6 main instruction types
		--000 = R, 001 = I, 010 = S, 011 = SB, 100 = U, 101 = UJ
		IR : in std_logic_vector(31 downto 0);
		immediate : out std_logic_vector(31 downto 0)); --byte aligned immediate
end immediateCalc;

architecture behavior of immediateCalc is
signal immediate_internal : std_logic_vector(31 downto 0);
begin
	process(instructionType, IR)
	begin
		case instructionType is
			when "000" => --R type, no immediate
				immediate_internal <= (others => '0');
			when "001" => --I type
				immediate_internal <= std_logic_vector(resize(signed(IR(31 downto 20)), 32));
			when "010" => --S type
				immediate_internal <= std_logic_vector(resize(signed(IR(31 downto 25) & IR(11 downto 7)), 32));
			when "011" => --SB type
				immediate_internal <= std_logic_vector(resize(signed(IR(31) & IR(7) & IR(30 downto 25) & IR(11 downto 8) & '0'), 32));
			when "100" => --U type
				immediate_internal <= IR(31 downto 12) & (11 downto 0 => '0');
			when "101" => --UJ type
				immediate_internal <= std_logic_vector(resize(signed(IR(31) & IR(19 downto 12) & IR(20) & IR(30 downto 21) & '0'), 32));
			when others =>
				immediate_internal <= (others => '0');
		end case;
	end process;
	immediate <= immediate_internal;
end behavior;