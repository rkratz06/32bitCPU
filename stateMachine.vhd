--Handles state machine for controller

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stateMachine is
	port(
		isBranch <= in std_logic;
		Q <= in std_logic_vector(4 downto 0); --current state, starting off with max 12 states, can expand if not enough
		immediate <= in std_logic_vector(31 downto 0);
		PC <= in std_logic_vector(31 downto 0); --used in JAL instruction to store PC
		ALU_output <= in std_logic_vector(31 downto 0);
		PCOffsetFlag <= out std_logic;
		D <= out std_logic_vector(4 downto 0); --next state
		writeData <= out std_logic_vector(31 downto 0));
end stateMachine;