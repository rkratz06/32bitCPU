--PC_Next calculator depending on branch conditions, offset, and target address

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

begin
	process(PC, PCOffsetFlag, JALRFlag, immediate, reg1)
	begin
		if JALRFlag = '1' then
				PC_next <= std_logic_vector((unsigned(reg1) + unsigned(immediate)) and x"FFFFFFFE");
		elsif PCOffsetFlag = '1' then
			PC_next <= std_logic_vector(unsigned(PC) + unsigned(immediate));
		else
			PC_next <= std_logic_vector(unsigned(PC) + 4);
		end if;
	end process;
end behavior;