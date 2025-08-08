-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "08/07/2025 23:34:34"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          CPU32bit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CPU32bit_vhd_vec_tst IS
END CPU32bit_vhd_vec_tst;
ARCHITECTURE CPU32bit_arch OF CPU32bit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALU_input1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ALU_input2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ALU_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ALULT : STD_LOGIC;
SIGNAL ALULTU : STD_LOGIC;
SIGNAL ALUZero : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL func3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL func7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL immediate : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL IR : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL IR_LD : STD_LOGIC;
SIGNAL opcode : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL PC : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL PC_LD : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL RAMAddressOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RAMin : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RAMout : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RAMwe : STD_LOGIC;
SIGNAL readData1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL readData2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL readReg1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL readReg2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL RegWE : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL useRAM : STD_LOGIC;
SIGNAL writeData : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL writeReg : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT CPU32bit
	PORT (
	ALU_input1 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	ALU_input2 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	ALU_output : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	ALULT : BUFFER STD_LOGIC;
	ALULTU : BUFFER STD_LOGIC;
	ALUZero : BUFFER STD_LOGIC;
	clk : IN STD_LOGIC;
	func3 : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	func7 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	immediate : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	IR : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	IR_LD : BUFFER STD_LOGIC;
	opcode : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	PC : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	PC_LD : BUFFER STD_LOGIC;
	Q : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
	RAMAddressOut : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	RAMin : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	RAMout : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	RAMwe : BUFFER STD_LOGIC;
	readData1 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	readData2 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	readReg1 : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
	readReg2 : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
	RegWE : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC;
	useRAM : BUFFER STD_LOGIC;
	writeData : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	writeReg : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : CPU32bit
	PORT MAP (
-- list connections between master ports and signals
	ALU_input1 => ALU_input1,
	ALU_input2 => ALU_input2,
	ALU_output => ALU_output,
	ALULT => ALULT,
	ALULTU => ALULTU,
	ALUZero => ALUZero,
	clk => clk,
	func3 => func3,
	func7 => func7,
	immediate => immediate,
	IR => IR,
	IR_LD => IR_LD,
	opcode => opcode,
	PC => PC,
	PC_LD => PC_LD,
	Q => Q,
	RAMAddressOut => RAMAddressOut,
	RAMin => RAMin,
	RAMout => RAMout,
	RAMwe => RAMwe,
	readData1 => readData1,
	readData2 => readData2,
	readReg1 => readReg1,
	readReg2 => readReg2,
	RegWE => RegWE,
	reset => reset,
	useRAM => useRAM,
	writeData => writeData,
	writeReg => writeReg
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END CPU32bit_arch;
