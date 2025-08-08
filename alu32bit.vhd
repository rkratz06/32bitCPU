--32 bit alu

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu32bit is
	port(
		reg1 : in std_logic_vector(31 downto 0);
		reg2 : in std_logic_vector(31 downto 0);
		cin : in std_logic; --carry in for addition
		s : in std_logic_vector (3 downto 0); --mux select lines, will be used to pick the operation that will be performed
		shamt : in std_logic_vector(4 downto 0); --shift amount, only used for shift instructions
		ALUZero, ALULT, ALULTU : out std_logic;
		output : out std_logic_vector(31 downto 0));
end alu32bit;

architecture behavior of alu32bit is

signal Cin32Bit : std_logic_vector(31 downto 0);
signal output_internal : std_logic_vector(31 downto 0);

begin
	Cin32Bit <= (31 downto 1 => '0') & cin;
	
	process(s, reg1, reg2, Cin32Bit, shamt)
	begin
		if (unsigned(reg1) < unsigned(reg2)) then
			ALULTU <= '1';
		else
			ALULTU <= '0';
		end if;
		if (signed(reg1) < signed(reg2)) then
			ALULT <= '1';
		else
			ALULT <= '0';
		end if;
		ALUZero <= '0';
		ALULT <= '0';
		ALULTU <= '0';
		case s is 
			when "0000" => output_internal <= reg1; --reg1 to output
			when "0001" => output_internal <= reg2; --reg2 to output
			when "0010" => output_internal <= reg1 and reg2; --reg1 and reg2
			when "0011" => output_internal <= reg1 or reg2; --reg1 or reg2
			when "0100" => output_internal <= std_logic_vector(signed(reg1) + signed(reg2) + signed(Cin32Bit)); --signed addition
			when "0101" => output_internal <= std_logic_vector(signed(reg1) - signed(reg2)); --signed subtraction
			when "0110" => output_internal <= not reg1; --not reg1
			when "0111" => output_internal <= not reg2; --not reg2
			when "1000" => output_internal <= reg1 xor reg2; --reg1 xor reg2
			when "1001" => output_internal <= std_logic_vector(shift_left(unsigned(reg1), to_integer(unsigned(shamt)))); --left shift shamt times
			when "1010" => output_internal <= std_logic_vector(shift_right(unsigned(reg1), to_integer(unsigned(shamt)))); --logical right shift shamt times
			when "1011" => output_internal <= std_logic_vector(shift_right(signed(reg1), to_integer(unsigned(shamt))));
			when "1100" =>  --less than operation signed
				if (signed(reg1) < signed(reg2)) then
					output_internal <= "00000000000000000000000000000001";
				else
					output_internal <= "00000000000000000000000000000000";
				end if;
			when "1101" => --less than operation unsigned
				if (unsigned(reg1) < unsigned(reg2)) then
					output_internal <= "00000000000000000000000000000001";
				else
					output_internal <= "00000000000000000000000000000000";
				end if;	--arithmetic right shift shamt time
			when others => output_internal <= (others => '0');
		end case;
		if output_internal = x"00000000" then
			ALUZero <= '1';
		end if;
	end process;
	output <= output_internal;
end;