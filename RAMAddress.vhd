--RAM address register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAMAddress is
	port(
		clk : in std_logic;
		reset : in std_logic;
		updateAddress : in std_logic; --only update address if load or store has been executed
		newAddress : in std_logic_vector(31 downto 0); --new address will come from ALU, and will only change Address if updateAddress is true
		Address : out std_logic_vector(31 downto 0));
end RAMAddress;

architecture behavior of RAMAddress is
signal Address_internal : std_logic_vector(31 downto 0) := (others => '0');
begin
	process(clk, reset)
	begin
		if reset = '1'then
			Address_internal <= (others => '0');
		elsif rising_edge(clk) then
			if updateAddress = '1' then
				Address_internal <= (31 downto 15 => '0') & newAddress(14 downto 0);
			end if;
		end if;
	end process;
	Address <= Address_internal;
end behavior;