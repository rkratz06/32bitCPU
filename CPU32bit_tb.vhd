--testbench file

library ieee;
use ieee.std_logic_1164.all;

entity CPU32bit_tb is
end CPU32bit_tb;

architecture behavior of CPU32bit_tb is
signal clk_tb : std_logic := '0';
signal reset_tb : std_logic := '1';
begin

    dut: entity work.CPU32bit
        port map(
            clk => clk_tb,
            reset => reset_tb
        );
		  clk_tb <= not clk_tb after 1ns;
		  reset_tb <= '1', '0' after 5ns;
end architecture;