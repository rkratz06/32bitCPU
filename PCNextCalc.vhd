--PC_Next calculator depending on branch conditions, offset, and target address
--if JALRFlag is true, perform the JALR calculation (reg1 + immediate, set least significant bit to 0)
--if PCOffsetFlag is true, set PC_next to PC + immediate. used in JAL and branches
--otherwise, defaults to incrementing the PC by 4. ROM used is byte aligned, since each address contains 4 bytes increment by 4.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PCNextCalc is 
	port(
		PC : in std_logic_vector(31 downto 0);
		PCOffsetFlag : in std_logic; --if true, branch was taken, PC_next <- PC + immediate, otherwise PC_next <- PC + 4
		JALRFlag : in std_logic; --if flag = '1', JALR was executed
		Immediate : in std_logic_vector(31 downto 0); --byte aligned immediate
		reg1 : in std_logic_vector(31 downto 0); --used for JALR instruction
		PC_next : out std_logic_vector(31 downto 0));
end PCNextCalc;

architecture behavior of PCNextCalc is
signal PC_next_internal : std_logic_vector(31 downto 0);
begin
	process(PC, PCOffsetFlag, JALRFlag)
	begin
		if JALRFlag = '1' then
			PC_next <= std_logic_vector((unsigned(reg1) + unsigned(immediate)) and x"FFFFFFFE");
		elsif PCOffsetFlag = '1' then
			PC_next <= std_logic_vector(unsigned(PC) + unsigned(immediate));
		else
			PC_next <= (others => '0');
		end if;
	end process;
end behavior;