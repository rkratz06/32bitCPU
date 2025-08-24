--PC_Next calculator depending on branch conditions, offset, and target address

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PCNextCalc is 
	port(
		PC : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		updatePCNext : in std_logic;
		reset : in std_logic; --when reset is true, set PC to 0
		PCOffsetFlag : in std_logic; --if true, branch was taken, PC_next <- PC + immediate, otherwise PC_next <- PC + 4
		JALRFlag : in std_logic; --if flag = '1', JALR was executed
		Immediate : in std_logic_vector(31 downto 0); --byte aligned immediate
		reg1 : in std_logic_vector(31 downto 0); --used for JALR instruction
		PC_next : out std_logic_vector(31 downto 0));
end PCNextCalc;

architecture behavior of PCNextCalc is
signal PC_next_internal : std_logic_vector(31 downto 0);
begin
	process(clk, reset)
	begin
		if reset = '1' then
			PC_next_internal <= (others => '0');
		elsif rising_edge(clk) then
			if updatePCNext = '1' then
				if JALRFlag = '1' then
						PC_next_internal <= std_logic_vector((unsigned(reg1) + unsigned(immediate)) and x"FFFFFFFE");
				elsif PCOffsetFlag = '1' then
					PC_next_internal <= std_logic_vector(unsigned(PC) + unsigned(immediate));
				else
					PC_next_internal <= std_logic_vector(unsigned(PC) + 4);
				end if;
			end if;
		end if;
	end process;
	PC_next <= PC_next_internal;
end behavior;