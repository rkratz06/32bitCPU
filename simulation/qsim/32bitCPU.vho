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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "08/07/2025 23:34:35"

-- 
-- Device: Altera 5CSEBA6U23I7 Package UFBGA672
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CPU32bit IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	PC : BUFFER std_logic_vector(31 DOWNTO 0);
	IR : BUFFER std_logic_vector(31 DOWNTO 0);
	readData1 : BUFFER std_logic_vector(31 DOWNTO 0);
	readData2 : BUFFER std_logic_vector(31 DOWNTO 0);
	writeData : BUFFER std_logic_vector(31 DOWNTO 0);
	ALU_input1 : BUFFER std_logic_vector(31 DOWNTO 0);
	ALU_input2 : BUFFER std_logic_vector(31 DOWNTO 0);
	ALU_output : BUFFER std_logic_vector(31 DOWNTO 0);
	immediate : BUFFER std_logic_vector(31 DOWNTO 0);
	RAMin : BUFFER std_logic_vector(31 DOWNTO 0);
	RAMout : BUFFER std_logic_vector(31 DOWNTO 0);
	RAMAddressOut : BUFFER std_logic_vector(31 DOWNTO 0);
	opcode : BUFFER std_logic_vector(6 DOWNTO 0);
	func7 : BUFFER std_logic_vector(6 DOWNTO 0);
	func3 : BUFFER std_logic_vector(2 DOWNTO 0);
	readReg1 : BUFFER std_logic_vector(4 DOWNTO 0);
	readReg2 : BUFFER std_logic_vector(4 DOWNTO 0);
	writeReg : BUFFER std_logic_vector(4 DOWNTO 0);
	Q : BUFFER std_logic_vector(4 DOWNTO 0);
	IR_LD : BUFFER std_logic;
	PC_LD : BUFFER std_logic;
	RegWE : BUFFER std_logic;
	RAMwe : BUFFER std_logic;
	useRAM : BUFFER std_logic;
	ALUZero : BUFFER std_logic;
	ALULT : BUFFER std_logic;
	ALULTU : BUFFER std_logic
	);
END CPU32bit;

ARCHITECTURE structure OF CPU32bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_PC : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_IR : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_readData1 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_readData2 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_writeData : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_ALU_input1 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_ALU_input2 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_ALU_output : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_immediate : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_RAMin : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_RAMout : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_RAMAddressOut : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_func7 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_func3 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_readReg1 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_readReg2 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_writeReg : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Q : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_IR_LD : std_logic;
SIGNAL ww_PC_LD : std_logic;
SIGNAL ww_RegWE : std_logic;
SIGNAL ww_RAMwe : std_logic;
SIGNAL ww_useRAM : std_logic;
SIGNAL ww_ALUZero : std_logic;
SIGNAL ww_ALULT : std_logic;
SIGNAL ww_ALULTU : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTABYTEENAMASKS_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a48_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a48_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a49_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a49_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a50_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a50_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a51_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a51_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a52_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a52_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a53_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a53_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a54_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a54_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a55_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a55_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a56_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a56_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a57_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a57_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a58_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a58_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a59_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a59_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a60_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a60_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a61_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a61_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a62_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a62_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a63_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a63_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \PCnext|Add2~1_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a34~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w2_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a36~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w4_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a37~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w5_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \decoder|Mux27~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a35~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w3_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a38~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w6_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a33~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w1_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \decoder|Mux15~0_combout\ : std_logic;
SIGNAL \decoder|Mux29~0_combout\ : std_logic;
SIGNAL \decoder|Mux26~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a41~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w9_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a54~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a22~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w22_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux29~1_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a40~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w8_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a53~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a21~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w21_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux30~1_combout\ : std_logic;
SIGNAL \PCnext|Add0~2\ : std_logic;
SIGNAL \PCnext|Add0~5_sumout\ : std_logic;
SIGNAL \decoder|Mux15~1_combout\ : std_logic;
SIGNAL \PCnext|Add2~2\ : std_logic;
SIGNAL \PCnext|Add2~5_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a42~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w10_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a55~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a23~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w23_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux28~1_combout\ : std_logic;
SIGNAL \PCnext|Add0~6\ : std_logic;
SIGNAL \PCnext|Add0~9_sumout\ : std_logic;
SIGNAL \PCnext|Add2~6\ : std_logic;
SIGNAL \PCnext|Add2~9_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a43~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w11_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a56~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a24~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w24_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux27~1_combout\ : std_logic;
SIGNAL \PCnext|Add0~10\ : std_logic;
SIGNAL \PCnext|Add0~13_sumout\ : std_logic;
SIGNAL \PCnext|Add2~10\ : std_logic;
SIGNAL \PCnext|Add2~13_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a57~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a25~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w25_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~14\ : std_logic;
SIGNAL \PCnext|Add0~17_sumout\ : std_logic;
SIGNAL \PCnext|Add2~14\ : std_logic;
SIGNAL \PCnext|Add2~17_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a58~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a26~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w26_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~18\ : std_logic;
SIGNAL \PCnext|Add0~21_sumout\ : std_logic;
SIGNAL \PCnext|Add2~18\ : std_logic;
SIGNAL \PCnext|Add2~21_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a59~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a27~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w27_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~22\ : std_logic;
SIGNAL \PCnext|Add0~25_sumout\ : std_logic;
SIGNAL \PCnext|Add2~22\ : std_logic;
SIGNAL \PCnext|Add2~25_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a60~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a28~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w28_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~26\ : std_logic;
SIGNAL \PCnext|Add0~29_sumout\ : std_logic;
SIGNAL \PCnext|Add2~26\ : std_logic;
SIGNAL \PCnext|Add2~29_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a61~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a29~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w29_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~30\ : std_logic;
SIGNAL \PCnext|Add0~33_sumout\ : std_logic;
SIGNAL \PCnext|Add2~30\ : std_logic;
SIGNAL \PCnext|Add2~33_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a62~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a30~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w30_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~34\ : std_logic;
SIGNAL \PCnext|Add0~37_sumout\ : std_logic;
SIGNAL \PCnext|Add2~34\ : std_logic;
SIGNAL \PCnext|Add2~37_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a52~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a20~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w20_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux31~1_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a39~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w7_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a63~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a31~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w31_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux31~2_combout\ : std_logic;
SIGNAL \PCnext|Add0~38\ : std_logic;
SIGNAL \PCnext|Add0~41_sumout\ : std_logic;
SIGNAL \PCnext|Add2~38\ : std_logic;
SIGNAL \PCnext|Add2~41_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a44~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w12_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux19~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~42\ : std_logic;
SIGNAL \PCnext|Add0~45_sumout\ : std_logic;
SIGNAL \PCnext|Add2~42\ : std_logic;
SIGNAL \PCnext|Add2~45_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a45~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a13~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w13_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux18~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~46\ : std_logic;
SIGNAL \PCnext|Add0~49_sumout\ : std_logic;
SIGNAL \PCnext|Add2~46\ : std_logic;
SIGNAL \PCnext|Add2~49_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a46~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w14_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux17~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~50\ : std_logic;
SIGNAL \PCnext|Add0~53_sumout\ : std_logic;
SIGNAL \PCnext|Add2~50\ : std_logic;
SIGNAL \PCnext|Add2~53_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a47~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w15_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux16~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~54\ : std_logic;
SIGNAL \PCnext|Add0~57_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a32~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w0_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \decoder|Mux28~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~1_sumout\ : std_logic;
SIGNAL \ProgramCounter32|PC_internal[1]~0_combout\ : std_logic;
SIGNAL \PCnext|Add2~54\ : std_logic;
SIGNAL \PCnext|Add2~57_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a48~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a16~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w16_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux15~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~58\ : std_logic;
SIGNAL \PCnext|Add0~61_sumout\ : std_logic;
SIGNAL \PCnext|Add2~58\ : std_logic;
SIGNAL \PCnext|Add2~61_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a49~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a17~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w17_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux14~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~62\ : std_logic;
SIGNAL \PCnext|Add0~65_sumout\ : std_logic;
SIGNAL \PCnext|Add2~62\ : std_logic;
SIGNAL \PCnext|Add2~65_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a50~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a18~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w18_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux13~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~66\ : std_logic;
SIGNAL \PCnext|Add0~69_sumout\ : std_logic;
SIGNAL \PCnext|Add2~66\ : std_logic;
SIGNAL \PCnext|Add2~69_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a51~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ram_block1a19~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|mux2|l1_w19_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \immediates|Mux12~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~70\ : std_logic;
SIGNAL \PCnext|Add0~73_sumout\ : std_logic;
SIGNAL \PCnext|Add2~70\ : std_logic;
SIGNAL \PCnext|Add2~73_sumout\ : std_logic;
SIGNAL \immediates|Mux11~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~74\ : std_logic;
SIGNAL \PCnext|Add0~77_sumout\ : std_logic;
SIGNAL \PCnext|Add2~74\ : std_logic;
SIGNAL \PCnext|Add2~77_sumout\ : std_logic;
SIGNAL \immediates|Mux10~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~78\ : std_logic;
SIGNAL \PCnext|Add0~81_sumout\ : std_logic;
SIGNAL \PCnext|Add2~78\ : std_logic;
SIGNAL \PCnext|Add2~81_sumout\ : std_logic;
SIGNAL \immediates|Mux9~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~82\ : std_logic;
SIGNAL \PCnext|Add0~85_sumout\ : std_logic;
SIGNAL \PCnext|Add2~82\ : std_logic;
SIGNAL \PCnext|Add2~85_sumout\ : std_logic;
SIGNAL \immediates|Mux8~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~86\ : std_logic;
SIGNAL \PCnext|Add0~89_sumout\ : std_logic;
SIGNAL \PCnext|Add2~86\ : std_logic;
SIGNAL \PCnext|Add2~89_sumout\ : std_logic;
SIGNAL \immediates|Mux7~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~90\ : std_logic;
SIGNAL \PCnext|Add0~93_sumout\ : std_logic;
SIGNAL \PCnext|Add2~90\ : std_logic;
SIGNAL \PCnext|Add2~93_sumout\ : std_logic;
SIGNAL \immediates|Mux6~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~94\ : std_logic;
SIGNAL \PCnext|Add0~97_sumout\ : std_logic;
SIGNAL \PCnext|Add2~94\ : std_logic;
SIGNAL \PCnext|Add2~97_sumout\ : std_logic;
SIGNAL \immediates|Mux5~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~98\ : std_logic;
SIGNAL \PCnext|Add0~101_sumout\ : std_logic;
SIGNAL \PCnext|Add2~98\ : std_logic;
SIGNAL \PCnext|Add2~101_sumout\ : std_logic;
SIGNAL \immediates|Mux4~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~102\ : std_logic;
SIGNAL \PCnext|Add0~105_sumout\ : std_logic;
SIGNAL \PCnext|Add2~102\ : std_logic;
SIGNAL \PCnext|Add2~105_sumout\ : std_logic;
SIGNAL \immediates|Mux3~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~106\ : std_logic;
SIGNAL \PCnext|Add0~109_sumout\ : std_logic;
SIGNAL \PCnext|Add2~106\ : std_logic;
SIGNAL \PCnext|Add2~109_sumout\ : std_logic;
SIGNAL \immediates|Mux2~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~110\ : std_logic;
SIGNAL \PCnext|Add0~113_sumout\ : std_logic;
SIGNAL \PCnext|Add2~110\ : std_logic;
SIGNAL \PCnext|Add2~113_sumout\ : std_logic;
SIGNAL \immediates|Mux1~0_combout\ : std_logic;
SIGNAL \PCnext|Add0~114\ : std_logic;
SIGNAL \PCnext|Add0~117_sumout\ : std_logic;
SIGNAL \PCnext|Add2~114\ : std_logic;
SIGNAL \PCnext|Add2~117_sumout\ : std_logic;
SIGNAL \PCnext|Add0~118\ : std_logic;
SIGNAL \PCnext|Add0~121_sumout\ : std_logic;
SIGNAL \immediates|Mux31~0_combout\ : std_logic;
SIGNAL \immediates|Mux30~0_combout\ : std_logic;
SIGNAL \immediates|Mux29~0_combout\ : std_logic;
SIGNAL \immediates|Mux28~0_combout\ : std_logic;
SIGNAL \immediates|Mux27~0_combout\ : std_logic;
SIGNAL \immediates|Mux26~0_combout\ : std_logic;
SIGNAL \immediates|Mux25~0_combout\ : std_logic;
SIGNAL \immediates|Mux24~0_combout\ : std_logic;
SIGNAL \immediates|Mux23~0_combout\ : std_logic;
SIGNAL \immediates|Mux22~0_combout\ : std_logic;
SIGNAL \immediates|Mux21~0_combout\ : std_logic;
SIGNAL \immediates|Mux20~0_combout\ : std_logic;
SIGNAL \immediates|Mux0~0_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a13~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a16~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a17~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a18~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a19~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a20~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a21~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a22~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a23~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a24~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a25~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a26~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a27~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a28~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a29~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a30~portadataout\ : std_logic;
SIGNAL \RAM|altsyncram_component|auto_generated|ram_block1a31~portadataout\ : std_logic;
SIGNAL \decoder|Mux9~0_combout\ : std_logic;
SIGNAL \decoder|Mux9~1_combout\ : std_logic;
SIGNAL \decoder|Mux8~0_combout\ : std_logic;
SIGNAL \decoder|Mux7~0_combout\ : std_logic;
SIGNAL \decoder|Mux6~0_combout\ : std_logic;
SIGNAL \decoder|Mux5~0_combout\ : std_logic;
SIGNAL \decoder|Mux13~0_combout\ : std_logic;
SIGNAL \decoder|Mux13~1_combout\ : std_logic;
SIGNAL \decoder|Mux14~0_combout\ : std_logic;
SIGNAL \decoder|Mux13~2_combout\ : std_logic;
SIGNAL \decoder|Mux12~0_combout\ : std_logic;
SIGNAL \decoder|Mux11~0_combout\ : std_logic;
SIGNAL \decoder|Mux10~0_combout\ : std_logic;
SIGNAL \decoder|Mux17~0_combout\ : std_logic;
SIGNAL \decoder|Mux17~1_combout\ : std_logic;
SIGNAL \decoder|Mux20~0_combout\ : std_logic;
SIGNAL \decoder|Mux19~0_combout\ : std_logic;
SIGNAL \decoder|Mux18~0_combout\ : std_logic;
SIGNAL \decoder|Mux17~2_combout\ : std_logic;
SIGNAL \decoder|Mux16~0_combout\ : std_logic;
SIGNAL \decoder|instructionType\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \InstructionRegister32|IR_internal\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ProgramCounter32|PC_internal\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|address_reg_a\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ProgramCounter32|ALT_INV_PC_internal\ : std_logic_vector(31 DOWNTO 1);
SIGNAL \PCnext|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a32~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a0~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a10~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a12~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a19~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a3~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a5~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a49~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a8~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a53~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a35~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a9~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a50~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a54~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a55~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a25~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a58~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a30~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a63~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a14~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a31~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a6~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a39~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a7~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a45~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a21~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a29~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a17~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a33~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a36~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a23~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a34~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a40~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a13~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a59~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a52~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a27~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a22~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a48~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a1~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a37~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a2~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a41~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a43~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a26~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a15~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a18~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a60~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a46~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a20~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a44~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a56~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a24~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a28~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a57~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a11~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a62~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a61~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a42~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a4~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a47~portadataout\ : std_logic;
SIGNAL \InstructionRegister32|ALT_INV_IR_internal\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a38~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a16~portadataout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a51~portadataout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux17~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux13~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux12~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux16~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux19~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux14~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux10~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux11~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux18~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux15~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux15~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux17~1_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux29~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux26~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux13~1_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux27~0_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux30~1_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux29~1_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux28~1_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux13~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \decoder|ALT_INV_Mux28~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux17~0_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_Mux15~1_combout\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux27~1_combout\ : std_logic;
SIGNAL \immediates|ALT_INV_Mux31~2_combout\ : std_logic;
SIGNAL \decoder|ALT_INV_instructionType\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \immediates|ALT_INV_Mux31~1_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
PC <= ww_PC;
IR <= ww_IR;
readData1 <= ww_readData1;
readData2 <= ww_readData2;
writeData <= ww_writeData;
ALU_input1 <= ww_ALU_input1;
ALU_input2 <= ww_ALU_input2;
ALU_output <= ww_ALU_output;
immediate <= ww_immediate;
RAMin <= ww_RAMin;
RAMout <= ww_RAMout;
RAMAddressOut <= ww_RAMAddressOut;
opcode <= ww_opcode;
func7 <= ww_func7;
func3 <= ww_func3;
readReg1 <= ww_readReg1;
readReg2 <= ww_readReg2;
writeReg <= ww_writeReg;
Q <= ww_Q;
IR_LD <= ww_IR_LD;
PC_LD <= ww_PC_LD;
RegWE <= ww_RegWE;
RAMwe <= ww_RAMwe;
useRAM <= ww_useRAM;
ALUZero <= ww_ALUZero;
ALULT <= ww_ALULT;
ALULTU <= ww_ALULTU;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a0_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a0~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a1_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a1~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a2_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a2~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a3_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a3~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a4_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a4~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a5_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a5~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a6_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a6~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a7_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a7~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a8_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a8~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a9_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a9~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a10_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a10~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a11_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a11~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a12_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a12~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a13_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a13~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a14_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a14~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a15_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a15~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a16_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a16~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a17_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a17~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a18_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a18~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a19_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a19~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a20_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a20~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a21_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a21~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a22_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a22~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a23_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a23~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a24_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a24~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a25_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a25~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a26_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a26~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a27_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a27~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a28_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a28~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a29_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a29~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a30_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a30~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\(0);

\RAM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAIN_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a31_PORTABYTEENAMASKS_bus\(0) <= \~GND~combout\;

\RAM|altsyncram_component|auto_generated|ram_block1a31~portadataout\ <= \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a32~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a0~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a33~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a1~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a34~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a2~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a35~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a3~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a36~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a4~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a37~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a5~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a38~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a6~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a39~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a7~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a40~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a8~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a41~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a9~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a42~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a10~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a43~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a11~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a44~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a12~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a45~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a13~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a46~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a14~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a47~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a15~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a48_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a48~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a48_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a16~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a49_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a49~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a49_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a17~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a50_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a50~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a50_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a18~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a51_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a51~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a51_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a19~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a52_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a52~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a52_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a20~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a53_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a53~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a53_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a21~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a54_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a54~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a54_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a22~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a55_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a55~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a55_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a23~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a56_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a56~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a56_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a24~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a57_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a57~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a57_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a25~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a58_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a58~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a58_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a26~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a59_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a59~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a59_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a27~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a60_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a60~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a60_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a28~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a61_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a61~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a61_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a29~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a62_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a62~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a62_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a30~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a63_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a63~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a63_PORTADATAOUT_bus\(0);

\ROM|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\ <= (\ProgramCounter32|PC_internal\(14) & \ProgramCounter32|PC_internal\(13) & \ProgramCounter32|PC_internal\(12) & \ProgramCounter32|PC_internal\(11) & 
\ProgramCounter32|PC_internal\(10) & \ProgramCounter32|PC_internal\(9) & \ProgramCounter32|PC_internal\(8) & \ProgramCounter32|PC_internal\(7) & \ProgramCounter32|PC_internal\(6) & \ProgramCounter32|PC_internal\(5) & 
\ProgramCounter32|PC_internal\(4) & \ProgramCounter32|PC_internal\(3) & \ProgramCounter32|PC_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a31~portadataout\ <= \ROM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\(0);
\ProgramCounter32|ALT_INV_PC_internal\(21) <= NOT \ProgramCounter32|PC_internal\(21);
\ProgramCounter32|ALT_INV_PC_internal\(22) <= NOT \ProgramCounter32|PC_internal\(22);
\ProgramCounter32|ALT_INV_PC_internal\(17) <= NOT \ProgramCounter32|PC_internal\(17);
\ProgramCounter32|ALT_INV_PC_internal\(30) <= NOT \ProgramCounter32|PC_internal\(30);
\ProgramCounter32|ALT_INV_PC_internal\(10) <= NOT \ProgramCounter32|PC_internal\(10);
\ProgramCounter32|ALT_INV_PC_internal\(24) <= NOT \ProgramCounter32|PC_internal\(24);
\ProgramCounter32|ALT_INV_PC_internal\(20) <= NOT \ProgramCounter32|PC_internal\(20);
\ProgramCounter32|ALT_INV_PC_internal\(23) <= NOT \ProgramCounter32|PC_internal\(23);
\ProgramCounter32|ALT_INV_PC_internal\(6) <= NOT \ProgramCounter32|PC_internal\(6);
\ProgramCounter32|ALT_INV_PC_internal\(29) <= NOT \ProgramCounter32|PC_internal\(29);
\ProgramCounter32|ALT_INV_PC_internal\(27) <= NOT \ProgramCounter32|PC_internal\(27);
\ProgramCounter32|ALT_INV_PC_internal\(12) <= NOT \ProgramCounter32|PC_internal\(12);
\ProgramCounter32|ALT_INV_PC_internal\(25) <= NOT \ProgramCounter32|PC_internal\(25);
\ProgramCounter32|ALT_INV_PC_internal\(9) <= NOT \ProgramCounter32|PC_internal\(9);
\ProgramCounter32|ALT_INV_PC_internal\(18) <= NOT \ProgramCounter32|PC_internal\(18);
\ProgramCounter32|ALT_INV_PC_internal\(14) <= NOT \ProgramCounter32|PC_internal\(14);
\ProgramCounter32|ALT_INV_PC_internal\(26) <= NOT \ProgramCounter32|PC_internal\(26);
\ProgramCounter32|ALT_INV_PC_internal\(28) <= NOT \ProgramCounter32|PC_internal\(28);
\ProgramCounter32|ALT_INV_PC_internal\(15) <= NOT \ProgramCounter32|PC_internal\(15);
\ProgramCounter32|ALT_INV_PC_internal\(7) <= NOT \ProgramCounter32|PC_internal\(7);
\ProgramCounter32|ALT_INV_PC_internal\(31) <= NOT \ProgramCounter32|PC_internal\(31);
\ProgramCounter32|ALT_INV_PC_internal\(16) <= NOT \ProgramCounter32|PC_internal\(16);
\ProgramCounter32|ALT_INV_PC_internal\(13) <= NOT \ProgramCounter32|PC_internal\(13);
\ProgramCounter32|ALT_INV_PC_internal\(11) <= NOT \ProgramCounter32|PC_internal\(11);
\ProgramCounter32|ALT_INV_PC_internal\(2) <= NOT \ProgramCounter32|PC_internal\(2);
\ProgramCounter32|ALT_INV_PC_internal\(8) <= NOT \ProgramCounter32|PC_internal\(8);
\ProgramCounter32|ALT_INV_PC_internal\(4) <= NOT \ProgramCounter32|PC_internal\(4);
\ProgramCounter32|ALT_INV_PC_internal\(19) <= NOT \ProgramCounter32|PC_internal\(19);
\ProgramCounter32|ALT_INV_PC_internal\(3) <= NOT \ProgramCounter32|PC_internal\(3);
\ProgramCounter32|ALT_INV_PC_internal\(5) <= NOT \ProgramCounter32|PC_internal\(5);
\PCnext|ALT_INV_Add0~1_sumout\ <= NOT \PCnext|Add0~1_sumout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a32~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a32~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a0~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a0~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a10~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a10~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a12~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a12~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a19~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a19~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a3~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a3~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a5~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a5~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a49~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a49~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a8~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a8~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a53~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a53~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a35~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a35~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a9~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a9~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a50~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a50~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a54~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a54~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a55~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a55~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a25~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a25~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a58~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a58~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a30~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a30~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a63~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a63~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a14~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a14~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a31~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a31~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a6~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a6~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a39~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a39~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a7~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a7~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a45~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a45~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a21~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a21~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a29~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a29~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a17~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a17~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a33~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a33~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a36~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a36~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a23~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a23~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a34~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a34~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a40~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a40~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a13~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a13~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a59~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a59~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a52~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a52~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a27~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a27~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a22~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a22~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a48~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a48~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a1~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a1~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a37~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a37~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a2~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a2~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a41~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a41~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a43~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a43~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a26~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a26~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a15~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a15~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a18~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a18~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a60~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a60~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a46~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a46~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a20~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a20~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a44~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a44~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a56~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a56~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a24~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a24~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a28~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a28~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a57~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a57~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a11~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a11~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a62~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a62~portadataout\;
\ProgramCounter32|ALT_INV_PC_internal\(1) <= NOT \ProgramCounter32|PC_internal\(1);
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a61~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a61~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a42~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a42~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a4~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a4~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a47~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a47~portadataout\;
\InstructionRegister32|ALT_INV_IR_internal\(0) <= NOT \InstructionRegister32|IR_internal\(0);
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a38~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a38~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a16~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a16~portadataout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a51~portadataout\ <= NOT \ROM|altsyncram_component|auto_generated|ram_block1a51~portadataout\;
\InstructionRegister32|ALT_INV_IR_internal\(2) <= NOT \InstructionRegister32|IR_internal\(2);
\InstructionRegister32|ALT_INV_IR_internal\(10) <= NOT \InstructionRegister32|IR_internal\(10);
\InstructionRegister32|ALT_INV_IR_internal\(14) <= NOT \InstructionRegister32|IR_internal\(14);
\InstructionRegister32|ALT_INV_IR_internal\(9) <= NOT \InstructionRegister32|IR_internal\(9);
\InstructionRegister32|ALT_INV_IR_internal\(31) <= NOT \InstructionRegister32|IR_internal\(31);
\InstructionRegister32|ALT_INV_IR_internal\(7) <= NOT \InstructionRegister32|IR_internal\(7);
\immediates|ALT_INV_Mux8~0_combout\ <= NOT \immediates|Mux8~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(28) <= NOT \InstructionRegister32|IR_internal\(28);
\InstructionRegister32|ALT_INV_IR_internal\(25) <= NOT \InstructionRegister32|IR_internal\(25);
\InstructionRegister32|ALT_INV_IR_internal\(4) <= NOT \InstructionRegister32|IR_internal\(4);
\InstructionRegister32|ALT_INV_IR_internal\(29) <= NOT \InstructionRegister32|IR_internal\(29);
\immediates|ALT_INV_Mux6~0_combout\ <= NOT \immediates|Mux6~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(1) <= NOT \InstructionRegister32|IR_internal\(1);
\InstructionRegister32|ALT_INV_IR_internal\(11) <= NOT \InstructionRegister32|IR_internal\(11);
\InstructionRegister32|ALT_INV_IR_internal\(23) <= NOT \InstructionRegister32|IR_internal\(23);
\immediates|ALT_INV_Mux17~0_combout\ <= NOT \immediates|Mux17~0_combout\;
\immediates|ALT_INV_Mux13~0_combout\ <= NOT \immediates|Mux13~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(30) <= NOT \InstructionRegister32|IR_internal\(30);
\immediates|ALT_INV_Mux5~0_combout\ <= NOT \immediates|Mux5~0_combout\;
\immediates|ALT_INV_Mux4~0_combout\ <= NOT \immediates|Mux4~0_combout\;
\immediates|ALT_INV_Mux2~0_combout\ <= NOT \immediates|Mux2~0_combout\;
\immediates|ALT_INV_Mux12~0_combout\ <= NOT \immediates|Mux12~0_combout\;
\immediates|ALT_INV_Mux3~0_combout\ <= NOT \immediates|Mux3~0_combout\;
\immediates|ALT_INV_Mux1~0_combout\ <= NOT \immediates|Mux1~0_combout\;
\immediates|ALT_INV_Mux9~0_combout\ <= NOT \immediates|Mux9~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(22) <= NOT \InstructionRegister32|IR_internal\(22);
\InstructionRegister32|ALT_INV_IR_internal\(6) <= NOT \InstructionRegister32|IR_internal\(6);
\immediates|ALT_INV_Mux7~0_combout\ <= NOT \immediates|Mux7~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(15) <= NOT \InstructionRegister32|IR_internal\(15);
\InstructionRegister32|ALT_INV_IR_internal\(8) <= NOT \InstructionRegister32|IR_internal\(8);
\InstructionRegister32|ALT_INV_IR_internal\(16) <= NOT \InstructionRegister32|IR_internal\(16);
\InstructionRegister32|ALT_INV_IR_internal\(20) <= NOT \InstructionRegister32|IR_internal\(20);
\InstructionRegister32|ALT_INV_IR_internal\(24) <= NOT \InstructionRegister32|IR_internal\(24);
\InstructionRegister32|ALT_INV_IR_internal\(26) <= NOT \InstructionRegister32|IR_internal\(26);
\InstructionRegister32|ALT_INV_IR_internal\(3) <= NOT \InstructionRegister32|IR_internal\(3);
\InstructionRegister32|ALT_INV_IR_internal\(5) <= NOT \InstructionRegister32|IR_internal\(5);
\InstructionRegister32|ALT_INV_IR_internal\(21) <= NOT \InstructionRegister32|IR_internal\(21);
\immediates|ALT_INV_Mux16~0_combout\ <= NOT \immediates|Mux16~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(12) <= NOT \InstructionRegister32|IR_internal\(12);
\InstructionRegister32|ALT_INV_IR_internal\(13) <= NOT \InstructionRegister32|IR_internal\(13);
\immediates|ALT_INV_Mux19~0_combout\ <= NOT \immediates|Mux19~0_combout\;
\immediates|ALT_INV_Mux14~0_combout\ <= NOT \immediates|Mux14~0_combout\;
\immediates|ALT_INV_Mux10~0_combout\ <= NOT \immediates|Mux10~0_combout\;
\immediates|ALT_INV_Mux11~0_combout\ <= NOT \immediates|Mux11~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(18) <= NOT \InstructionRegister32|IR_internal\(18);
\InstructionRegister32|ALT_INV_IR_internal\(19) <= NOT \InstructionRegister32|IR_internal\(19);
\immediates|ALT_INV_Mux18~0_combout\ <= NOT \immediates|Mux18~0_combout\;
\immediates|ALT_INV_Mux15~0_combout\ <= NOT \immediates|Mux15~0_combout\;
\InstructionRegister32|ALT_INV_IR_internal\(27) <= NOT \InstructionRegister32|IR_internal\(27);
\InstructionRegister32|ALT_INV_IR_internal\(17) <= NOT \InstructionRegister32|IR_internal\(17);
\decoder|ALT_INV_Mux15~0_combout\ <= NOT \decoder|Mux15~0_combout\;
\decoder|ALT_INV_Mux17~1_combout\ <= NOT \decoder|Mux17~1_combout\;
\decoder|ALT_INV_Mux29~0_combout\ <= NOT \decoder|Mux29~0_combout\;
\decoder|ALT_INV_Mux26~0_combout\ <= NOT \decoder|Mux26~0_combout\;
\decoder|ALT_INV_Mux13~1_combout\ <= NOT \decoder|Mux13~1_combout\;
\decoder|ALT_INV_Mux27~0_combout\ <= NOT \decoder|Mux27~0_combout\;
\immediates|ALT_INV_Mux30~1_combout\ <= NOT \immediates|Mux30~1_combout\;
\immediates|ALT_INV_Mux29~1_combout\ <= NOT \immediates|Mux29~1_combout\;
\immediates|ALT_INV_Mux28~1_combout\ <= NOT \immediates|Mux28~1_combout\;
\decoder|ALT_INV_Mux13~0_combout\ <= NOT \decoder|Mux13~0_combout\;
\decoder|ALT_INV_Mux9~0_combout\ <= NOT \decoder|Mux9~0_combout\;
\ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0) <= NOT \ROM|altsyncram_component|auto_generated|address_reg_a\(0);
\decoder|ALT_INV_Mux28~0_combout\ <= NOT \decoder|Mux28~0_combout\;
\decoder|ALT_INV_Mux17~0_combout\ <= NOT \decoder|Mux17~0_combout\;
\decoder|ALT_INV_Mux15~1_combout\ <= NOT \decoder|Mux15~1_combout\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\immediates|ALT_INV_Mux27~1_combout\ <= NOT \immediates|Mux27~1_combout\;
\immediates|ALT_INV_Mux31~2_combout\ <= NOT \immediates|Mux31~2_combout\;
\decoder|ALT_INV_instructionType\(2) <= NOT \decoder|instructionType\(2);
\decoder|ALT_INV_instructionType\(1) <= NOT \decoder|instructionType\(1);
\immediates|ALT_INV_Mux31~1_combout\ <= NOT \immediates|Mux31~1_combout\;
\decoder|ALT_INV_instructionType\(0) <= NOT \decoder|instructionType\(0);

\PC[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_PC(0));

\PC[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(1),
	devoe => ww_devoe,
	o => ww_PC(1));

\PC[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(2),
	devoe => ww_devoe,
	o => ww_PC(2));

\PC[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(3),
	devoe => ww_devoe,
	o => ww_PC(3));

\PC[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(4),
	devoe => ww_devoe,
	o => ww_PC(4));

\PC[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(5),
	devoe => ww_devoe,
	o => ww_PC(5));

\PC[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(6),
	devoe => ww_devoe,
	o => ww_PC(6));

\PC[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(7),
	devoe => ww_devoe,
	o => ww_PC(7));

\PC[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(8),
	devoe => ww_devoe,
	o => ww_PC(8));

\PC[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(9),
	devoe => ww_devoe,
	o => ww_PC(9));

\PC[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(10),
	devoe => ww_devoe,
	o => ww_PC(10));

\PC[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(11),
	devoe => ww_devoe,
	o => ww_PC(11));

\PC[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(12),
	devoe => ww_devoe,
	o => ww_PC(12));

\PC[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(13),
	devoe => ww_devoe,
	o => ww_PC(13));

\PC[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(14),
	devoe => ww_devoe,
	o => ww_PC(14));

\PC[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(15),
	devoe => ww_devoe,
	o => ww_PC(15));

\PC[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(16),
	devoe => ww_devoe,
	o => ww_PC(16));

\PC[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(17),
	devoe => ww_devoe,
	o => ww_PC(17));

\PC[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(18),
	devoe => ww_devoe,
	o => ww_PC(18));

\PC[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(19),
	devoe => ww_devoe,
	o => ww_PC(19));

\PC[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(20),
	devoe => ww_devoe,
	o => ww_PC(20));

\PC[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(21),
	devoe => ww_devoe,
	o => ww_PC(21));

\PC[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(22),
	devoe => ww_devoe,
	o => ww_PC(22));

\PC[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(23),
	devoe => ww_devoe,
	o => ww_PC(23));

\PC[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(24),
	devoe => ww_devoe,
	o => ww_PC(24));

\PC[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(25),
	devoe => ww_devoe,
	o => ww_PC(25));

\PC[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(26),
	devoe => ww_devoe,
	o => ww_PC(26));

\PC[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(27),
	devoe => ww_devoe,
	o => ww_PC(27));

\PC[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(28),
	devoe => ww_devoe,
	o => ww_PC(28));

\PC[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(29),
	devoe => ww_devoe,
	o => ww_PC(29));

\PC[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(30),
	devoe => ww_devoe,
	o => ww_PC(30));

\PC[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ProgramCounter32|PC_internal\(31),
	devoe => ww_devoe,
	o => ww_PC(31));

\IR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(0),
	devoe => ww_devoe,
	o => ww_IR(0));

\IR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(1),
	devoe => ww_devoe,
	o => ww_IR(1));

\IR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(2),
	devoe => ww_devoe,
	o => ww_IR(2));

\IR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(3),
	devoe => ww_devoe,
	o => ww_IR(3));

\IR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(4),
	devoe => ww_devoe,
	o => ww_IR(4));

\IR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(5),
	devoe => ww_devoe,
	o => ww_IR(5));

\IR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(6),
	devoe => ww_devoe,
	o => ww_IR(6));

\IR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(7),
	devoe => ww_devoe,
	o => ww_IR(7));

\IR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(8),
	devoe => ww_devoe,
	o => ww_IR(8));

\IR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(9),
	devoe => ww_devoe,
	o => ww_IR(9));

\IR[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(10),
	devoe => ww_devoe,
	o => ww_IR(10));

\IR[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(11),
	devoe => ww_devoe,
	o => ww_IR(11));

\IR[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(12),
	devoe => ww_devoe,
	o => ww_IR(12));

\IR[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(13),
	devoe => ww_devoe,
	o => ww_IR(13));

\IR[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(14),
	devoe => ww_devoe,
	o => ww_IR(14));

\IR[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(15),
	devoe => ww_devoe,
	o => ww_IR(15));

\IR[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(16),
	devoe => ww_devoe,
	o => ww_IR(16));

\IR[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(17),
	devoe => ww_devoe,
	o => ww_IR(17));

\IR[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(18),
	devoe => ww_devoe,
	o => ww_IR(18));

\IR[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(19),
	devoe => ww_devoe,
	o => ww_IR(19));

\IR[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(20),
	devoe => ww_devoe,
	o => ww_IR(20));

\IR[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(21),
	devoe => ww_devoe,
	o => ww_IR(21));

\IR[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(22),
	devoe => ww_devoe,
	o => ww_IR(22));

\IR[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(23),
	devoe => ww_devoe,
	o => ww_IR(23));

\IR[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(24),
	devoe => ww_devoe,
	o => ww_IR(24));

\IR[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(25),
	devoe => ww_devoe,
	o => ww_IR(25));

\IR[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(26),
	devoe => ww_devoe,
	o => ww_IR(26));

\IR[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(27),
	devoe => ww_devoe,
	o => ww_IR(27));

\IR[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(28),
	devoe => ww_devoe,
	o => ww_IR(28));

\IR[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(29),
	devoe => ww_devoe,
	o => ww_IR(29));

\IR[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(30),
	devoe => ww_devoe,
	o => ww_IR(30));

\IR[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(31),
	devoe => ww_devoe,
	o => ww_IR(31));

\readData1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(0));

\readData1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(1));

\readData1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(2));

\readData1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(3));

\readData1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(4));

\readData1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(5));

\readData1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(6));

\readData1[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(7));

\readData1[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(8));

\readData1[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(9));

\readData1[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(10));

\readData1[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(11));

\readData1[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(12));

\readData1[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(13));

\readData1[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(14));

\readData1[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(15));

\readData1[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(16));

\readData1[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(17));

\readData1[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(18));

\readData1[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(19));

\readData1[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(20));

\readData1[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(21));

\readData1[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(22));

\readData1[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(23));

\readData1[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(24));

\readData1[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(25));

\readData1[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(26));

\readData1[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(27));

\readData1[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(28));

\readData1[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(29));

\readData1[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(30));

\readData1[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData1(31));

\readData2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(0));

\readData2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(1));

\readData2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(2));

\readData2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(3));

\readData2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(4));

\readData2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(5));

\readData2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(6));

\readData2[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(7));

\readData2[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(8));

\readData2[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(9));

\readData2[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(10));

\readData2[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(11));

\readData2[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(12));

\readData2[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(13));

\readData2[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(14));

\readData2[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(15));

\readData2[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(16));

\readData2[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(17));

\readData2[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(18));

\readData2[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(19));

\readData2[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(20));

\readData2[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(21));

\readData2[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(22));

\readData2[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(23));

\readData2[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(24));

\readData2[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(25));

\readData2[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(26));

\readData2[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(27));

\readData2[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(28));

\readData2[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(29));

\readData2[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(30));

\readData2[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_readData2(31));

\writeData[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(0));

\writeData[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(1));

\writeData[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(2));

\writeData[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(3));

\writeData[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(4));

\writeData[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(5));

\writeData[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(6));

\writeData[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(7));

\writeData[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(8));

\writeData[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(9));

\writeData[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(10));

\writeData[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(11));

\writeData[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(12));

\writeData[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(13));

\writeData[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(14));

\writeData[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(15));

\writeData[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(16));

\writeData[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(17));

\writeData[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(18));

\writeData[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(19));

\writeData[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(20));

\writeData[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(21));

\writeData[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(22));

\writeData[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(23));

\writeData[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(24));

\writeData[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(25));

\writeData[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(26));

\writeData[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(27));

\writeData[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(28));

\writeData[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(29));

\writeData[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(30));

\writeData[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_writeData(31));

\ALU_input1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(0));

\ALU_input1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(1));

\ALU_input1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(2));

\ALU_input1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(3));

\ALU_input1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(4));

\ALU_input1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(5));

\ALU_input1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(6));

\ALU_input1[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(7));

\ALU_input1[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(8));

\ALU_input1[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(9));

\ALU_input1[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(10));

\ALU_input1[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(11));

\ALU_input1[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(12));

\ALU_input1[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(13));

\ALU_input1[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(14));

\ALU_input1[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(15));

\ALU_input1[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(16));

\ALU_input1[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(17));

\ALU_input1[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(18));

\ALU_input1[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(19));

\ALU_input1[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(20));

\ALU_input1[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(21));

\ALU_input1[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(22));

\ALU_input1[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(23));

\ALU_input1[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(24));

\ALU_input1[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(25));

\ALU_input1[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(26));

\ALU_input1[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(27));

\ALU_input1[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(28));

\ALU_input1[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(29));

\ALU_input1[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(30));

\ALU_input1[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input1(31));

\ALU_input2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(0));

\ALU_input2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(1));

\ALU_input2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(2));

\ALU_input2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(3));

\ALU_input2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(4));

\ALU_input2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(5));

\ALU_input2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(6));

\ALU_input2[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(7));

\ALU_input2[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(8));

\ALU_input2[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(9));

\ALU_input2[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(10));

\ALU_input2[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(11));

\ALU_input2[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(12));

\ALU_input2[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(13));

\ALU_input2[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(14));

\ALU_input2[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(15));

\ALU_input2[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(16));

\ALU_input2[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(17));

\ALU_input2[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(18));

\ALU_input2[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(19));

\ALU_input2[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(20));

\ALU_input2[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(21));

\ALU_input2[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(22));

\ALU_input2[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(23));

\ALU_input2[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(24));

\ALU_input2[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(25));

\ALU_input2[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(26));

\ALU_input2[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(27));

\ALU_input2[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(28));

\ALU_input2[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(29));

\ALU_input2[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(30));

\ALU_input2[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_input2(31));

\ALU_output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(0));

\ALU_output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(1));

\ALU_output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(2));

\ALU_output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(3));

\ALU_output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(4));

\ALU_output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(5));

\ALU_output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(6));

\ALU_output[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(7));

\ALU_output[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(8));

\ALU_output[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(9));

\ALU_output[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(10));

\ALU_output[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(11));

\ALU_output[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(12));

\ALU_output[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(13));

\ALU_output[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(14));

\ALU_output[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(15));

\ALU_output[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(16));

\ALU_output[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(17));

\ALU_output[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(18));

\ALU_output[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(19));

\ALU_output[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(20));

\ALU_output[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(21));

\ALU_output[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(22));

\ALU_output[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(23));

\ALU_output[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(24));

\ALU_output[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(25));

\ALU_output[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(26));

\ALU_output[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(27));

\ALU_output[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(28));

\ALU_output[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(29));

\ALU_output[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(30));

\ALU_output[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALU_output(31));

\immediate[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux31~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(0));

\immediate[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux30~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(1));

\immediate[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux29~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(2));

\immediate[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux28~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(3));

\immediate[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux27~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(4));

\immediate[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux26~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(5));

\immediate[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux25~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(6));

\immediate[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux24~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(7));

\immediate[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux23~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(8));

\immediate[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux22~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(9));

\immediate[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux21~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(10));

\immediate[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux20~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(11));

\immediate[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux19~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(12));

\immediate[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux18~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(13));

\immediate[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux17~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(14));

\immediate[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux16~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(15));

\immediate[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux15~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(16));

\immediate[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux14~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(17));

\immediate[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux13~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(18));

\immediate[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux12~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(19));

\immediate[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux11~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(20));

\immediate[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(21));

\immediate[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux9~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(22));

\immediate[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(23));

\immediate[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(24));

\immediate[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(25));

\immediate[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(26));

\immediate[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(27));

\immediate[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(28));

\immediate[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(29));

\immediate[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(30));

\immediate[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \immediates|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_immediate(31));

\RAMin[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(0));

\RAMin[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(1));

\RAMin[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(2));

\RAMin[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(3));

\RAMin[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(4));

\RAMin[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(5));

\RAMin[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(6));

\RAMin[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(7));

\RAMin[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(8));

\RAMin[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(9));

\RAMin[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(10));

\RAMin[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(11));

\RAMin[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(12));

\RAMin[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(13));

\RAMin[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(14));

\RAMin[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(15));

\RAMin[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(16));

\RAMin[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(17));

\RAMin[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(18));

\RAMin[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(19));

\RAMin[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(20));

\RAMin[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(21));

\RAMin[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(22));

\RAMin[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(23));

\RAMin[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(24));

\RAMin[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(25));

\RAMin[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(26));

\RAMin[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(27));

\RAMin[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(28));

\RAMin[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(29));

\RAMin[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(30));

\RAMin[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMin(31));

\RAMout[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a0~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(0));

\RAMout[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a1~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(1));

\RAMout[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a2~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(2));

\RAMout[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a3~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(3));

\RAMout[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a4~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(4));

\RAMout[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a5~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(5));

\RAMout[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a6~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(6));

\RAMout[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a7~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(7));

\RAMout[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a8~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(8));

\RAMout[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a9~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(9));

\RAMout[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a10~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(10));

\RAMout[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a11~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(11));

\RAMout[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a12~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(12));

\RAMout[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a13~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(13));

\RAMout[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a14~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(14));

\RAMout[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a15~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(15));

\RAMout[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a16~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(16));

\RAMout[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a17~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(17));

\RAMout[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a18~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(18));

\RAMout[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a19~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(19));

\RAMout[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a20~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(20));

\RAMout[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a21~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(21));

\RAMout[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a22~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(22));

\RAMout[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a23~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(23));

\RAMout[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a24~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(24));

\RAMout[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a25~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(25));

\RAMout[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a26~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(26));

\RAMout[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a27~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(27));

\RAMout[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a28~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(28));

\RAMout[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a29~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(29));

\RAMout[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a30~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(30));

\RAMout[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \RAM|altsyncram_component|auto_generated|ram_block1a31~portadataout\,
	devoe => ww_devoe,
	o => ww_RAMout(31));

\RAMAddressOut[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(0));

\RAMAddressOut[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(1));

\RAMAddressOut[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(2));

\RAMAddressOut[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(3));

\RAMAddressOut[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(4));

\RAMAddressOut[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(5));

\RAMAddressOut[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(6));

\RAMAddressOut[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(7));

\RAMAddressOut[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(8));

\RAMAddressOut[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(9));

\RAMAddressOut[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(10));

\RAMAddressOut[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(11));

\RAMAddressOut[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(12));

\RAMAddressOut[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(13));

\RAMAddressOut[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(14));

\RAMAddressOut[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(15));

\RAMAddressOut[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(16));

\RAMAddressOut[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(17));

\RAMAddressOut[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(18));

\RAMAddressOut[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(19));

\RAMAddressOut[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(20));

\RAMAddressOut[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(21));

\RAMAddressOut[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(22));

\RAMAddressOut[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(23));

\RAMAddressOut[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(24));

\RAMAddressOut[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(25));

\RAMAddressOut[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(26));

\RAMAddressOut[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(27));

\RAMAddressOut[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(28));

\RAMAddressOut[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(29));

\RAMAddressOut[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(30));

\RAMAddressOut[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMAddressOut(31));

\opcode[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(0),
	devoe => ww_devoe,
	o => ww_opcode(0));

\opcode[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(1),
	devoe => ww_devoe,
	o => ww_opcode(1));

\opcode[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(2),
	devoe => ww_devoe,
	o => ww_opcode(2));

\opcode[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(3),
	devoe => ww_devoe,
	o => ww_opcode(3));

\opcode[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(4),
	devoe => ww_devoe,
	o => ww_opcode(4));

\opcode[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(5),
	devoe => ww_devoe,
	o => ww_opcode(5));

\opcode[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(6),
	devoe => ww_devoe,
	o => ww_opcode(6));

\func7[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(25),
	devoe => ww_devoe,
	o => ww_func7(0));

\func7[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(26),
	devoe => ww_devoe,
	o => ww_func7(1));

\func7[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(27),
	devoe => ww_devoe,
	o => ww_func7(2));

\func7[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(28),
	devoe => ww_devoe,
	o => ww_func7(3));

\func7[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(29),
	devoe => ww_devoe,
	o => ww_func7(4));

\func7[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(30),
	devoe => ww_devoe,
	o => ww_func7(5));

\func7[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(31),
	devoe => ww_devoe,
	o => ww_func7(6));

\func3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(12),
	devoe => ww_devoe,
	o => ww_func3(0));

\func3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(13),
	devoe => ww_devoe,
	o => ww_func3(1));

\func3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \InstructionRegister32|IR_internal\(14),
	devoe => ww_devoe,
	o => ww_func3(2));

\readReg1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux9~1_combout\,
	devoe => ww_devoe,
	o => ww_readReg1(0));

\readReg1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg1(1));

\readReg1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg1(2));

\readReg1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg1(3));

\readReg1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg1(4));

\readReg2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux14~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg2(0));

\readReg2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux13~2_combout\,
	devoe => ww_devoe,
	o => ww_readReg2(1));

\readReg2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux12~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg2(2));

\readReg2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux11~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg2(3));

\readReg2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_readReg2(4));

\writeReg[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux20~0_combout\,
	devoe => ww_devoe,
	o => ww_writeReg(0));

\writeReg[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux19~0_combout\,
	devoe => ww_devoe,
	o => ww_writeReg(1));

\writeReg[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux18~0_combout\,
	devoe => ww_devoe,
	o => ww_writeReg(2));

\writeReg[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux17~2_combout\,
	devoe => ww_devoe,
	o => ww_writeReg(3));

\writeReg[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|Mux16~0_combout\,
	devoe => ww_devoe,
	o => ww_writeReg(4));

\Q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Q(0));

\Q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Q(1));

\Q[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Q(2));

\Q[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Q(3));

\Q[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Q(4));

\IR_LD~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_IR_LD);

\PC_LD~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_PC_LD);

\RegWE~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RegWE);

\RAMwe~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RAMwe);

\useRAM~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_useRAM);

\ALUZero~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_ALUZero);

\ALULT~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALULT);

\ALULTU~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ALULTU);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\PCnext|Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~1_sumout\ = SUM(( \ProgramCounter32|PC_internal\(2) ) + ( VCC ) + ( !VCC ))
-- \PCnext|Add2~2\ = CARRY(( \ProgramCounter32|PC_internal\(2) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(2),
	cin => GND,
	sumout => \PCnext|Add2~1_sumout\,
	cout => \PCnext|Add2~2\);

\ROM|altsyncram_component|auto_generated|address_reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ProgramCounter32|PC_internal\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ROM|altsyncram_component|auto_generated|address_reg_a\(0));

\ROM|altsyncram_component|auto_generated|ram_block1a34\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 2,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w2_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w2_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a2~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a34~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a34~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a2~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w2_n0_mux_dataout~0_combout\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\InstructionRegister32|IR_internal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w2_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(2));

\ROM|altsyncram_component|auto_generated|ram_block1a36\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 4,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w4_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w4_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a4~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a36~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a36~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a4~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w4_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w4_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(4));

\ROM|altsyncram_component|auto_generated|ram_block1a37\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 5,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000059",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w5_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w5_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a5~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a37~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a37~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a5~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w5_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w5_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(5));

\decoder|Mux27~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux27~0_combout\ = (\InstructionRegister32|IR_internal\(0) & (!\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(4) & \InstructionRegister32|IR_internal\(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(0),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(5),
	combout => \decoder|Mux27~0_combout\);

\ROM|altsyncram_component|auto_generated|ram_block1a35\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 3,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w3_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w3_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a3~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a35~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a35~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a3~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w3_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w3_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(3));

\ROM|altsyncram_component|auto_generated|ram_block1a38\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 6,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w6_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w6_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a6~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a38~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a38~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a6~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w6_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w6_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(6));

\ROM|altsyncram_component|auto_generated|ram_block1a33\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 1,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007F",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w1_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w1_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a1~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a33~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a33~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a1~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w1_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w1_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(1));

\decoder|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux15~0_combout\ = (\InstructionRegister32|IR_internal\(0) & \InstructionRegister32|IR_internal\(1))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(0),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(1),
	combout => \decoder|Mux15~0_combout\);

\decoder|Mux29~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux29~0_combout\ = ( \InstructionRegister32|IR_internal\(6) & ( \decoder|Mux15~0_combout\ & ( (!\InstructionRegister32|IR_internal\(4) & (\InstructionRegister32|IR_internal\(5) & ((!\InstructionRegister32|IR_internal\(3)) # 
-- (\InstructionRegister32|IR_internal\(2))))) ) ) ) # ( !\InstructionRegister32|IR_internal\(6) & ( \decoder|Mux15~0_combout\ & ( (!\InstructionRegister32|IR_internal\(3) & ((!\InstructionRegister32|IR_internal\(2)) # 
-- (\InstructionRegister32|IR_internal\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010001100100011000000000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(5),
	datae => \InstructionRegister32|ALT_INV_IR_internal\(6),
	dataf => \decoder|ALT_INV_Mux15~0_combout\,
	combout => \decoder|Mux29~0_combout\);

\decoder|instructionType[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|instructionType\(1) = ( \decoder|instructionType\(1) & ( \decoder|Mux29~0_combout\ & ( \decoder|Mux27~0_combout\ ) ) ) # ( !\decoder|instructionType\(1) & ( \decoder|Mux29~0_combout\ & ( \decoder|Mux27~0_combout\ ) ) ) # ( 
-- \decoder|instructionType\(1) & ( !\decoder|Mux29~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \decoder|ALT_INV_Mux27~0_combout\,
	datae => \decoder|ALT_INV_instructionType\(1),
	dataf => \decoder|ALT_INV_Mux29~0_combout\,
	combout => \decoder|instructionType\(1));

\decoder|Mux26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux26~0_combout\ = (\InstructionRegister32|IR_internal\(0) & ((!\InstructionRegister32|IR_internal\(5) & (!\InstructionRegister32|IR_internal\(2) & !\InstructionRegister32|IR_internal\(6))) # (\InstructionRegister32|IR_internal\(5) & 
-- ((\InstructionRegister32|IR_internal\(6))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000101010000000000010101000000000001010100000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(0),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(5),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(6),
	combout => \decoder|Mux26~0_combout\);

\decoder|instructionType[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|instructionType\(0) = ( \decoder|instructionType\(0) & ( \decoder|Mux29~0_combout\ & ( \decoder|Mux26~0_combout\ ) ) ) # ( !\decoder|instructionType\(0) & ( \decoder|Mux29~0_combout\ & ( \decoder|Mux26~0_combout\ ) ) ) # ( 
-- \decoder|instructionType\(0) & ( !\decoder|Mux29~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \decoder|ALT_INV_Mux26~0_combout\,
	datae => \decoder|ALT_INV_instructionType\(0),
	dataf => \decoder|ALT_INV_Mux29~0_combout\,
	combout => \decoder|instructionType\(0));

\ROM|altsyncram_component|auto_generated|ram_block1a41\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 9,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a9\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w9_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w9_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a9~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a41~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a41~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a9~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w9_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w9_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(9));

\ROM|altsyncram_component|auto_generated|ram_block1a54\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 22,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a54_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a54_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a22\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000052",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 22,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w22_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w22_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a22~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a54~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a54~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a22~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w22_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w22_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(22));

\immediates|Mux29~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux29~1_combout\ = (!\decoder|instructionType\(1) & ((\InstructionRegister32|IR_internal\(22)))) # (\decoder|instructionType\(1) & (\InstructionRegister32|IR_internal\(9)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010100110101001101010011010100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(9),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(22),
	datac => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux29~1_combout\);

\ROM|altsyncram_component|auto_generated|ram_block1a40\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 8,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a8\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w8_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w8_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a8~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a40~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a40~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a8~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w8_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w8_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(8));

\ROM|altsyncram_component|auto_generated|ram_block1a53\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 21,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a53_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a53_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a21\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 21,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w21_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w21_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a21~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a53~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a53~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a21~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w21_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w21_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(21));

\immediates|Mux30~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux30~1_combout\ = (!\decoder|instructionType\(1) & ((\InstructionRegister32|IR_internal\(21)))) # (\decoder|instructionType\(1) & (\InstructionRegister32|IR_internal\(8)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010100110101001101010011010100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(8),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(21),
	datac => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux30~1_combout\);

\PCnext|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~1_sumout\ = SUM(( GND ) + ( (\immediates|Mux30~1_combout\ & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2))))) ) + ( !VCC ))
-- \PCnext|Add0~2\ = CARRY(( GND ) + ( (\immediates|Mux30~1_combout\ & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2))))) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111101000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(2),
	datab => \decoder|ALT_INV_instructionType\(1),
	datac => \decoder|ALT_INV_instructionType\(0),
	dataf => \immediates|ALT_INV_Mux30~1_combout\,
	cin => GND,
	sumout => \PCnext|Add0~1_sumout\,
	cout => \PCnext|Add0~2\);

\PCnext|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~5_sumout\ = SUM(( GND ) + ( (\immediates|Mux29~1_combout\ & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~2\ ))
-- \PCnext|Add0~6\ = CARRY(( GND ) + ( (\immediates|Mux29~1_combout\ & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \immediates|ALT_INV_Mux29~1_combout\,
	cin => \PCnext|Add0~2\,
	sumout => \PCnext|Add0~5_sumout\,
	cout => \PCnext|Add0~6\);

\decoder|Mux15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux15~1_combout\ = ( \InstructionRegister32|IR_internal\(6) & ( \decoder|Mux15~0_combout\ & ( (\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3) & (!\InstructionRegister32|IR_internal\(4) & 
-- \InstructionRegister32|IR_internal\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(5),
	datae => \InstructionRegister32|ALT_INV_IR_internal\(6),
	dataf => \decoder|ALT_INV_Mux15~0_combout\,
	combout => \decoder|Mux15~1_combout\);

\ProgramCounter32|PC_internal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~1_sumout\,
	asdata => \PCnext|Add0~5_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(2));

\PCnext|Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~5_sumout\ = SUM(( \ProgramCounter32|PC_internal\(3) ) + ( GND ) + ( \PCnext|Add2~2\ ))
-- \PCnext|Add2~6\ = CARRY(( \ProgramCounter32|PC_internal\(3) ) + ( GND ) + ( \PCnext|Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(3),
	cin => \PCnext|Add2~2\,
	sumout => \PCnext|Add2~5_sumout\,
	cout => \PCnext|Add2~6\);

\ROM|altsyncram_component|auto_generated|ram_block1a42\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 10,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a10\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w10_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w10_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a10~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a42~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a42~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a10~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w10_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w10_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(10));

\ROM|altsyncram_component|auto_generated|ram_block1a55\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 23,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a55_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a55_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a23\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 23,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w23_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w23_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a23~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a55~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a55~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a23~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w23_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w23_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(23));

\immediates|Mux28~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux28~1_combout\ = (!\decoder|instructionType\(1) & ((\InstructionRegister32|IR_internal\(23)))) # (\decoder|instructionType\(1) & (\InstructionRegister32|IR_internal\(10)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010100110101001101010011010100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(10),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(23),
	datac => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux28~1_combout\);

\PCnext|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~9_sumout\ = SUM(( GND ) + ( (\immediates|Mux28~1_combout\ & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~6\ ))
-- \PCnext|Add0~10\ = CARRY(( GND ) + ( (\immediates|Mux28~1_combout\ & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \immediates|ALT_INV_Mux28~1_combout\,
	cin => \PCnext|Add0~6\,
	sumout => \PCnext|Add0~9_sumout\,
	cout => \PCnext|Add0~10\);

\ProgramCounter32|PC_internal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~5_sumout\,
	asdata => \PCnext|Add0~9_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(3));

\PCnext|Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~9_sumout\ = SUM(( \ProgramCounter32|PC_internal\(4) ) + ( GND ) + ( \PCnext|Add2~6\ ))
-- \PCnext|Add2~10\ = CARRY(( \ProgramCounter32|PC_internal\(4) ) + ( GND ) + ( \PCnext|Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(4),
	cin => \PCnext|Add2~6\,
	sumout => \PCnext|Add2~9_sumout\,
	cout => \PCnext|Add2~10\);

\ROM|altsyncram_component|auto_generated|ram_block1a43\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 11,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a11\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w11_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w11_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a11~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a43~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a43~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a11~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w11_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w11_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(11));

\ROM|altsyncram_component|auto_generated|ram_block1a56\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 24,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a56_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a56_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a24\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 24,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w24_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w24_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a24~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a56~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a56~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a24~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w24_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w24_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(24));

\immediates|Mux27~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux27~1_combout\ = (!\decoder|instructionType\(1) & ((\InstructionRegister32|IR_internal\(24)))) # (\decoder|instructionType\(1) & (\InstructionRegister32|IR_internal\(11)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010100110101001101010011010100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(11),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(24),
	datac => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux27~1_combout\);

\PCnext|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~13_sumout\ = SUM(( GND ) + ( (\immediates|Mux27~1_combout\ & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~10\ ))
-- \PCnext|Add0~14\ = CARRY(( GND ) + ( (\immediates|Mux27~1_combout\ & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \immediates|ALT_INV_Mux27~1_combout\,
	cin => \PCnext|Add0~10\,
	sumout => \PCnext|Add0~13_sumout\,
	cout => \PCnext|Add0~14\);

\ProgramCounter32|PC_internal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~9_sumout\,
	asdata => \PCnext|Add0~13_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(4));

\PCnext|Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~13_sumout\ = SUM(( \ProgramCounter32|PC_internal\(5) ) + ( GND ) + ( \PCnext|Add2~10\ ))
-- \PCnext|Add2~14\ = CARRY(( \ProgramCounter32|PC_internal\(5) ) + ( GND ) + ( \PCnext|Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(5),
	cin => \PCnext|Add2~10\,
	sumout => \PCnext|Add2~13_sumout\,
	cout => \PCnext|Add2~14\);

\ROM|altsyncram_component|auto_generated|ram_block1a57\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 25,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a57_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a57_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a25\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 25,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w25_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w25_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a25~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a57~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a57~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a25~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w25_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w25_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(25));

\PCnext|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~17_sumout\ = SUM(( GND ) + ( (\InstructionRegister32|IR_internal\(25) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~14\ ))
-- \PCnext|Add0~18\ = CARRY(( GND ) + ( (\InstructionRegister32|IR_internal\(25) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \InstructionRegister32|ALT_INV_IR_internal\(25),
	cin => \PCnext|Add0~14\,
	sumout => \PCnext|Add0~17_sumout\,
	cout => \PCnext|Add0~18\);

\ProgramCounter32|PC_internal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~13_sumout\,
	asdata => \PCnext|Add0~17_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(5));

\PCnext|Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~17_sumout\ = SUM(( \ProgramCounter32|PC_internal\(6) ) + ( GND ) + ( \PCnext|Add2~14\ ))
-- \PCnext|Add2~18\ = CARRY(( \ProgramCounter32|PC_internal\(6) ) + ( GND ) + ( \PCnext|Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(6),
	cin => \PCnext|Add2~14\,
	sumout => \PCnext|Add2~17_sumout\,
	cout => \PCnext|Add2~18\);

\ROM|altsyncram_component|auto_generated|ram_block1a58\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 26,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a58_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a58_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a26\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 26,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w26_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w26_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a26~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a58~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a58~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a26~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w26_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w26_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(26));

\PCnext|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~21_sumout\ = SUM(( GND ) + ( (\InstructionRegister32|IR_internal\(26) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~18\ ))
-- \PCnext|Add0~22\ = CARRY(( GND ) + ( (\InstructionRegister32|IR_internal\(26) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \InstructionRegister32|ALT_INV_IR_internal\(26),
	cin => \PCnext|Add0~18\,
	sumout => \PCnext|Add0~21_sumout\,
	cout => \PCnext|Add0~22\);

\ProgramCounter32|PC_internal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~17_sumout\,
	asdata => \PCnext|Add0~21_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(6));

\PCnext|Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~21_sumout\ = SUM(( \ProgramCounter32|PC_internal\(7) ) + ( GND ) + ( \PCnext|Add2~18\ ))
-- \PCnext|Add2~22\ = CARRY(( \ProgramCounter32|PC_internal\(7) ) + ( GND ) + ( \PCnext|Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(7),
	cin => \PCnext|Add2~18\,
	sumout => \PCnext|Add2~21_sumout\,
	cout => \PCnext|Add2~22\);

\ROM|altsyncram_component|auto_generated|ram_block1a59\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 27,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a59_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a59_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a27\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 27,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w27_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w27_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a27~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a59~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a59~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a27~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w27_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w27_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(27));

\PCnext|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~25_sumout\ = SUM(( GND ) + ( (\InstructionRegister32|IR_internal\(27) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~22\ ))
-- \PCnext|Add0~26\ = CARRY(( GND ) + ( (\InstructionRegister32|IR_internal\(27) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \InstructionRegister32|ALT_INV_IR_internal\(27),
	cin => \PCnext|Add0~22\,
	sumout => \PCnext|Add0~25_sumout\,
	cout => \PCnext|Add0~26\);

\ProgramCounter32|PC_internal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~21_sumout\,
	asdata => \PCnext|Add0~25_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(7));

\PCnext|Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~25_sumout\ = SUM(( \ProgramCounter32|PC_internal\(8) ) + ( GND ) + ( \PCnext|Add2~22\ ))
-- \PCnext|Add2~26\ = CARRY(( \ProgramCounter32|PC_internal\(8) ) + ( GND ) + ( \PCnext|Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(8),
	cin => \PCnext|Add2~22\,
	sumout => \PCnext|Add2~25_sumout\,
	cout => \PCnext|Add2~26\);

\ROM|altsyncram_component|auto_generated|ram_block1a60\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 28,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a60_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a60_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a28\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 28,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w28_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w28_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a28~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a60~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a60~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a28~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w28_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w28_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(28));

\PCnext|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~29_sumout\ = SUM(( GND ) + ( (\InstructionRegister32|IR_internal\(28) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~26\ ))
-- \PCnext|Add0~30\ = CARRY(( GND ) + ( (\InstructionRegister32|IR_internal\(28) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \InstructionRegister32|ALT_INV_IR_internal\(28),
	cin => \PCnext|Add0~26\,
	sumout => \PCnext|Add0~29_sumout\,
	cout => \PCnext|Add0~30\);

\ProgramCounter32|PC_internal[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~25_sumout\,
	asdata => \PCnext|Add0~29_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(8));

\PCnext|Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~29_sumout\ = SUM(( \ProgramCounter32|PC_internal\(9) ) + ( GND ) + ( \PCnext|Add2~26\ ))
-- \PCnext|Add2~30\ = CARRY(( \ProgramCounter32|PC_internal\(9) ) + ( GND ) + ( \PCnext|Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(9),
	cin => \PCnext|Add2~26\,
	sumout => \PCnext|Add2~29_sumout\,
	cout => \PCnext|Add2~30\);

\ROM|altsyncram_component|auto_generated|ram_block1a61\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 29,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a61_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a61_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a29\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 29,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w29_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w29_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a29~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a61~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a61~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a29~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w29_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w29_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(29));

\PCnext|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~33_sumout\ = SUM(( GND ) + ( (\InstructionRegister32|IR_internal\(29) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~30\ ))
-- \PCnext|Add0~34\ = CARRY(( GND ) + ( (\InstructionRegister32|IR_internal\(29) & ((!\decoder|instructionType\(1) & (\decoder|instructionType\(0))) # (\decoder|instructionType\(1) & ((!\decoder|instructionType\(2)))))) ) + ( \PCnext|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111000110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(0),
	datac => \decoder|ALT_INV_instructionType\(2),
	dataf => \InstructionRegister32|ALT_INV_IR_internal\(29),
	cin => \PCnext|Add0~30\,
	sumout => \PCnext|Add0~33_sumout\,
	cout => \PCnext|Add0~34\);

\ProgramCounter32|PC_internal[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~29_sumout\,
	asdata => \PCnext|Add0~33_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(9));

\PCnext|Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~33_sumout\ = SUM(( \ProgramCounter32|PC_internal\(10) ) + ( GND ) + ( \PCnext|Add2~30\ ))
-- \PCnext|Add2~34\ = CARRY(( \ProgramCounter32|PC_internal\(10) ) + ( GND ) + ( \PCnext|Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(10),
	cin => \PCnext|Add2~30\,
	sumout => \PCnext|Add2~33_sumout\,
	cout => \PCnext|Add2~34\);

\ROM|altsyncram_component|auto_generated|ram_block1a62\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 30,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a62_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a62_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a30\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 30,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w30_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w30_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a30~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a62~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a62~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a30~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w30_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w30_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(30));

\PCnext|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~37_sumout\ = SUM(( GND ) + ( (\InstructionRegister32|IR_internal\(30) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2))))) ) + ( \PCnext|Add0~34\ ))
-- \PCnext|Add0~38\ = CARRY(( GND ) + ( (\InstructionRegister32|IR_internal\(30) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2))))) ) + ( \PCnext|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111101000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(2),
	datab => \decoder|ALT_INV_instructionType\(1),
	datac => \decoder|ALT_INV_instructionType\(0),
	dataf => \InstructionRegister32|ALT_INV_IR_internal\(30),
	cin => \PCnext|Add0~34\,
	sumout => \PCnext|Add0~37_sumout\,
	cout => \PCnext|Add0~38\);

\ProgramCounter32|PC_internal[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~33_sumout\,
	asdata => \PCnext|Add0~37_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(10));

\PCnext|Add2~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~37_sumout\ = SUM(( \ProgramCounter32|PC_internal\(11) ) + ( GND ) + ( \PCnext|Add2~34\ ))
-- \PCnext|Add2~38\ = CARRY(( \ProgramCounter32|PC_internal\(11) ) + ( GND ) + ( \PCnext|Add2~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(11),
	cin => \PCnext|Add2~34\,
	sumout => \PCnext|Add2~37_sumout\,
	cout => \PCnext|Add2~38\);

\ROM|altsyncram_component|auto_generated|ram_block1a52\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 20,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a52_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a52_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a20\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004A",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 20,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w20_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w20_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a20~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a52~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a52~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a20~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w20_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w20_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(20));

\immediates|Mux31~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux31~1_combout\ = (\InstructionRegister32|IR_internal\(20) & \decoder|instructionType\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(20),
	datab => \decoder|ALT_INV_instructionType\(0),
	combout => \immediates|Mux31~1_combout\);

\ROM|altsyncram_component|auto_generated|ram_block1a39\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 7,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002D",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w7_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w7_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a7~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a39~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a39~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a7~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w7_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w7_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(7));

\ROM|altsyncram_component|auto_generated|ram_block1a63\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 31,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a63_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a63_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a31\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 31,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w31_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w31_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a31~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a63~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a63~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a31~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w31_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w31_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(31));

\immediates|Mux31~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux31~2_combout\ = (!\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(1))))) # (\decoder|instructionType\(0) & ((!\decoder|instructionType\(1) & ((\InstructionRegister32|IR_internal\(31)))) 
-- # (\decoder|instructionType\(1) & (\InstructionRegister32|IR_internal\(7)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100110101000000110011010100000011001101010000001100110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(7),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux31~2_combout\);

\PCnext|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~41_sumout\ = SUM(( GND ) + ( (!\decoder|instructionType\(2) & (((\immediates|Mux31~2_combout\)))) # (\decoder|instructionType\(2) & (!\decoder|instructionType\(1) & (\immediates|Mux31~1_combout\))) ) + ( \PCnext|Add0~38\ ))
-- \PCnext|Add0~42\ = CARRY(( GND ) + ( (!\decoder|instructionType\(2) & (((\immediates|Mux31~2_combout\)))) # (\decoder|instructionType\(2) & (!\decoder|instructionType\(1) & (\immediates|Mux31~1_combout\))) ) + ( \PCnext|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110110101000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(2),
	datab => \decoder|ALT_INV_instructionType\(1),
	datac => \immediates|ALT_INV_Mux31~1_combout\,
	dataf => \immediates|ALT_INV_Mux31~2_combout\,
	cin => \PCnext|Add0~38\,
	sumout => \PCnext|Add0~41_sumout\,
	cout => \PCnext|Add0~42\);

\ProgramCounter32|PC_internal[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~37_sumout\,
	asdata => \PCnext|Add0~41_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(11));

\PCnext|Add2~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~41_sumout\ = SUM(( \ProgramCounter32|PC_internal\(12) ) + ( GND ) + ( \PCnext|Add2~38\ ))
-- \PCnext|Add2~42\ = CARRY(( \ProgramCounter32|PC_internal\(12) ) + ( GND ) + ( \PCnext|Add2~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(12),
	cin => \PCnext|Add2~38\,
	sumout => \PCnext|Add2~41_sumout\,
	cout => \PCnext|Add2~42\);

\ROM|altsyncram_component|auto_generated|ram_block1a44\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 12,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a12\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w12_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w12_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a12~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a44~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a44~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a12~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w12_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w12_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(12));

\immediates|Mux19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux19~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(12))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(12),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux19~0_combout\);

\PCnext|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~45_sumout\ = SUM(( \immediates|Mux19~0_combout\ ) + ( GND ) + ( \PCnext|Add0~42\ ))
-- \PCnext|Add0~46\ = CARRY(( \immediates|Mux19~0_combout\ ) + ( GND ) + ( \PCnext|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux19~0_combout\,
	cin => \PCnext|Add0~42\,
	sumout => \PCnext|Add0~45_sumout\,
	cout => \PCnext|Add0~46\);

\ProgramCounter32|PC_internal[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~41_sumout\,
	asdata => \PCnext|Add0~45_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(12));

\PCnext|Add2~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~45_sumout\ = SUM(( \ProgramCounter32|PC_internal\(13) ) + ( GND ) + ( \PCnext|Add2~42\ ))
-- \PCnext|Add2~46\ = CARRY(( \ProgramCounter32|PC_internal\(13) ) + ( GND ) + ( \PCnext|Add2~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(13),
	cin => \PCnext|Add2~42\,
	sumout => \PCnext|Add2~45_sumout\,
	cout => \PCnext|Add2~46\);

\ROM|altsyncram_component|auto_generated|ram_block1a45\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 13,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a13\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w13_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w13_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a13~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a45~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a45~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a13~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w13_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w13_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(13));

\immediates|Mux18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux18~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(13))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(13),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux18~0_combout\);

\PCnext|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~49_sumout\ = SUM(( \immediates|Mux18~0_combout\ ) + ( GND ) + ( \PCnext|Add0~46\ ))
-- \PCnext|Add0~50\ = CARRY(( \immediates|Mux18~0_combout\ ) + ( GND ) + ( \PCnext|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux18~0_combout\,
	cin => \PCnext|Add0~46\,
	sumout => \PCnext|Add0~49_sumout\,
	cout => \PCnext|Add0~50\);

\ProgramCounter32|PC_internal[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~45_sumout\,
	asdata => \PCnext|Add0~49_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(13));

\PCnext|Add2~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~49_sumout\ = SUM(( \ProgramCounter32|PC_internal\(14) ) + ( GND ) + ( \PCnext|Add2~46\ ))
-- \PCnext|Add2~50\ = CARRY(( \ProgramCounter32|PC_internal\(14) ) + ( GND ) + ( \PCnext|Add2~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(14),
	cin => \PCnext|Add2~46\,
	sumout => \PCnext|Add2~49_sumout\,
	cout => \PCnext|Add2~50\);

\ROM|altsyncram_component|auto_generated|ram_block1a46\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 14,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a14\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w14_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w14_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a14~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a46~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a46~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a14~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w14_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w14_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(14));

\immediates|Mux17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux17~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(14))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(14),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux17~0_combout\);

\PCnext|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~53_sumout\ = SUM(( \immediates|Mux17~0_combout\ ) + ( GND ) + ( \PCnext|Add0~50\ ))
-- \PCnext|Add0~54\ = CARRY(( \immediates|Mux17~0_combout\ ) + ( GND ) + ( \PCnext|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux17~0_combout\,
	cin => \PCnext|Add0~50\,
	sumout => \PCnext|Add0~53_sumout\,
	cout => \PCnext|Add0~54\);

\ProgramCounter32|PC_internal[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~49_sumout\,
	asdata => \PCnext|Add0~53_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(14));

\PCnext|Add2~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~53_sumout\ = SUM(( \ProgramCounter32|PC_internal\(15) ) + ( GND ) + ( \PCnext|Add2~50\ ))
-- \PCnext|Add2~54\ = CARRY(( \ProgramCounter32|PC_internal\(15) ) + ( GND ) + ( \PCnext|Add2~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(15),
	cin => \PCnext|Add2~50\,
	sumout => \PCnext|Add2~53_sumout\,
	cout => \PCnext|Add2~54\);

\ROM|altsyncram_component|auto_generated|ram_block1a47\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 15,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a15\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w15_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w15_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a15~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a47~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a47~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a15~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w15_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w15_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(15));

\immediates|Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux16~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(15))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(15),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux16~0_combout\);

\PCnext|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~57_sumout\ = SUM(( \immediates|Mux16~0_combout\ ) + ( GND ) + ( \PCnext|Add0~54\ ))
-- \PCnext|Add0~58\ = CARRY(( \immediates|Mux16~0_combout\ ) + ( GND ) + ( \PCnext|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux16~0_combout\,
	cin => \PCnext|Add0~54\,
	sumout => \PCnext|Add0~57_sumout\,
	cout => \PCnext|Add0~58\);

\ProgramCounter32|PC_internal[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~53_sumout\,
	asdata => \PCnext|Add0~57_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(15));

\ROM|altsyncram_component|auto_generated|ram_block1a32\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 0,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007F",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w0_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w0_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a0~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a32~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a32~portadataout\,
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a0~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w0_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w0_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(0));

\decoder|Mux28~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux28~0_combout\ = (\InstructionRegister32|IR_internal\(0) & (\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3) $ (!\InstructionRegister32|IR_internal\(4)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010000000000010001000000000001000100000000000100010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(0),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(4),
	combout => \decoder|Mux28~0_combout\);

\decoder|instructionType[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|instructionType\(2) = ( \decoder|instructionType\(2) & ( \decoder|Mux29~0_combout\ & ( \decoder|Mux28~0_combout\ ) ) ) # ( !\decoder|instructionType\(2) & ( \decoder|Mux29~0_combout\ & ( \decoder|Mux28~0_combout\ ) ) ) # ( 
-- \decoder|instructionType\(2) & ( !\decoder|Mux29~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \decoder|ALT_INV_Mux28~0_combout\,
	datae => \decoder|ALT_INV_instructionType\(2),
	dataf => \decoder|ALT_INV_Mux29~0_combout\,
	combout => \decoder|instructionType\(2));

\ProgramCounter32|PC_internal[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ProgramCounter32|PC_internal[1]~0_combout\ = (!\decoder|Mux15~1_combout\ & (\ProgramCounter32|PC_internal\(1))) # (\decoder|Mux15~1_combout\ & ((\PCnext|Add0~1_sumout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001101010011010100110101001101010011010100110101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ProgramCounter32|ALT_INV_PC_internal\(1),
	datab => \PCnext|ALT_INV_Add0~1_sumout\,
	datac => \decoder|ALT_INV_Mux15~1_combout\,
	combout => \ProgramCounter32|PC_internal[1]~0_combout\);

\ProgramCounter32|PC_internal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ProgramCounter32|PC_internal[1]~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(1));

\PCnext|Add2~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~57_sumout\ = SUM(( \ProgramCounter32|PC_internal\(16) ) + ( GND ) + ( \PCnext|Add2~54\ ))
-- \PCnext|Add2~58\ = CARRY(( \ProgramCounter32|PC_internal\(16) ) + ( GND ) + ( \PCnext|Add2~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(16),
	cin => \PCnext|Add2~54\,
	sumout => \PCnext|Add2~57_sumout\,
	cout => \PCnext|Add2~58\);

\ROM|altsyncram_component|auto_generated|ram_block1a48\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 16,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a48_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a48_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a16\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000078",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 16,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w16_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w16_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a16~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a48~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a48~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a16~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w16_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w16_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(16));

\immediates|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux15~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(16))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(16),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux15~0_combout\);

\PCnext|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~61_sumout\ = SUM(( \immediates|Mux15~0_combout\ ) + ( GND ) + ( \PCnext|Add0~58\ ))
-- \PCnext|Add0~62\ = CARRY(( \immediates|Mux15~0_combout\ ) + ( GND ) + ( \PCnext|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux15~0_combout\,
	cin => \PCnext|Add0~58\,
	sumout => \PCnext|Add0~61_sumout\,
	cout => \PCnext|Add0~62\);

\ProgramCounter32|PC_internal[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~57_sumout\,
	asdata => \PCnext|Add0~61_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(16));

\PCnext|Add2~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~61_sumout\ = SUM(( \ProgramCounter32|PC_internal\(17) ) + ( GND ) + ( \PCnext|Add2~58\ ))
-- \PCnext|Add2~62\ = CARRY(( \ProgramCounter32|PC_internal\(17) ) + ( GND ) + ( \PCnext|Add2~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(17),
	cin => \PCnext|Add2~58\,
	sumout => \PCnext|Add2~61_sumout\,
	cout => \PCnext|Add2~62\);

\ROM|altsyncram_component|auto_generated|ram_block1a49\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 17,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a49_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a49_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a17\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 17,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w17_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w17_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a17~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a49~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a49~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a17~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w17_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w17_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(17));

\immediates|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux14~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(17))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(17),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux14~0_combout\);

\PCnext|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~65_sumout\ = SUM(( \immediates|Mux14~0_combout\ ) + ( GND ) + ( \PCnext|Add0~62\ ))
-- \PCnext|Add0~66\ = CARRY(( \immediates|Mux14~0_combout\ ) + ( GND ) + ( \PCnext|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux14~0_combout\,
	cin => \PCnext|Add0~62\,
	sumout => \PCnext|Add0~65_sumout\,
	cout => \PCnext|Add0~66\);

\ProgramCounter32|PC_internal[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~61_sumout\,
	asdata => \PCnext|Add0~65_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(17));

\PCnext|Add2~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~65_sumout\ = SUM(( \ProgramCounter32|PC_internal\(18) ) + ( GND ) + ( \PCnext|Add2~62\ ))
-- \PCnext|Add2~66\ = CARRY(( \ProgramCounter32|PC_internal\(18) ) + ( GND ) + ( \PCnext|Add2~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(18),
	cin => \PCnext|Add2~62\,
	sumout => \PCnext|Add2~65_sumout\,
	cout => \PCnext|Add2~66\);

\ROM|altsyncram_component|auto_generated|ram_block1a50\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 18,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a50_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a50_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a18\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 18,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w18_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w18_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a18~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a50~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a50~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a18~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w18_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w18_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(18));

\immediates|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux13~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(18))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(18),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux13~0_combout\);

\PCnext|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~69_sumout\ = SUM(( \immediates|Mux13~0_combout\ ) + ( GND ) + ( \PCnext|Add0~66\ ))
-- \PCnext|Add0~70\ = CARRY(( \immediates|Mux13~0_combout\ ) + ( GND ) + ( \PCnext|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux13~0_combout\,
	cin => \PCnext|Add0~66\,
	sumout => \PCnext|Add0~69_sumout\,
	cout => \PCnext|Add0~70\);

\ProgramCounter32|PC_internal[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~65_sumout\,
	asdata => \PCnext|Add0~69_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(18));

\PCnext|Add2~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~69_sumout\ = SUM(( \ProgramCounter32|PC_internal\(19) ) + ( GND ) + ( \PCnext|Add2~66\ ))
-- \PCnext|Add2~70\ = CARRY(( \ProgramCounter32|PC_internal\(19) ) + ( GND ) + ( \PCnext|Add2~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(19),
	cin => \PCnext|Add2~66\,
	sumout => \PCnext|Add2~69_sumout\,
	cout => \PCnext|Add2~70\);

\ROM|altsyncram_component|auto_generated|ram_block1a51\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 8192,
	port_a_first_bit_number => 19,
	port_a_last_address => 16383,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a51_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a51_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|ram_block1a19\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPUMIF.mif",
	init_file_layout => "port_a",
	logical_ram_name => "CPUROM:ROM|altsyncram:altsyncram_component|altsyncram_v924:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 19,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => \ProgramCounter32|ALT_INV_PC_internal\(15),
	portaaddr => \ROM|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ROM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\);

\ROM|altsyncram_component|auto_generated|mux2|l1_w19_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM|altsyncram_component|auto_generated|mux2|l1_w19_n0_mux_dataout~0_combout\ = (!\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & ((\ROM|altsyncram_component|auto_generated|ram_block1a19~portadataout\))) # 
-- (\ROM|altsyncram_component|auto_generated|address_reg_a\(0) & (\ROM|altsyncram_component|auto_generated|ram_block1a51~portadataout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM|altsyncram_component|auto_generated|ALT_INV_address_reg_a\(0),
	datab => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a51~portadataout\,
	datac => \ROM|altsyncram_component|auto_generated|ALT_INV_ram_block1a19~portadataout\,
	combout => \ROM|altsyncram_component|auto_generated|mux2|l1_w19_n0_mux_dataout~0_combout\);

\InstructionRegister32|IR_internal[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ROM|altsyncram_component|auto_generated|mux2|l1_w19_n0_mux_dataout~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \InstructionRegister32|IR_internal\(19));

\immediates|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux12~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & 
-- (((\InstructionRegister32|IR_internal\(31) & \decoder|instructionType\(0))))) # (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(19))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110101001100000011000000000101001101010011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(19),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux12~0_combout\);

\PCnext|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~73_sumout\ = SUM(( \immediates|Mux12~0_combout\ ) + ( GND ) + ( \PCnext|Add0~70\ ))
-- \PCnext|Add0~74\ = CARRY(( \immediates|Mux12~0_combout\ ) + ( GND ) + ( \PCnext|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux12~0_combout\,
	cin => \PCnext|Add0~70\,
	sumout => \PCnext|Add0~73_sumout\,
	cout => \PCnext|Add0~74\);

\ProgramCounter32|PC_internal[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~69_sumout\,
	asdata => \PCnext|Add0~73_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(19));

\PCnext|Add2~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~73_sumout\ = SUM(( \ProgramCounter32|PC_internal\(20) ) + ( GND ) + ( \PCnext|Add2~70\ ))
-- \PCnext|Add2~74\ = CARRY(( \ProgramCounter32|PC_internal\(20) ) + ( GND ) + ( \PCnext|Add2~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(20),
	cin => \PCnext|Add2~70\,
	sumout => \PCnext|Add2~73_sumout\,
	cout => \PCnext|Add2~74\);

\immediates|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux11~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(20) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(20),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux11~0_combout\);

\PCnext|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~77_sumout\ = SUM(( \immediates|Mux11~0_combout\ ) + ( GND ) + ( \PCnext|Add0~74\ ))
-- \PCnext|Add0~78\ = CARRY(( \immediates|Mux11~0_combout\ ) + ( GND ) + ( \PCnext|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux11~0_combout\,
	cin => \PCnext|Add0~74\,
	sumout => \PCnext|Add0~77_sumout\,
	cout => \PCnext|Add0~78\);

\ProgramCounter32|PC_internal[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~73_sumout\,
	asdata => \PCnext|Add0~77_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(20));

\PCnext|Add2~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~77_sumout\ = SUM(( \ProgramCounter32|PC_internal\(21) ) + ( GND ) + ( \PCnext|Add2~74\ ))
-- \PCnext|Add2~78\ = CARRY(( \ProgramCounter32|PC_internal\(21) ) + ( GND ) + ( \PCnext|Add2~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(21),
	cin => \PCnext|Add2~74\,
	sumout => \PCnext|Add2~77_sumout\,
	cout => \PCnext|Add2~78\);

\immediates|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux10~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(21) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(21),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux10~0_combout\);

\PCnext|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~81_sumout\ = SUM(( \immediates|Mux10~0_combout\ ) + ( GND ) + ( \PCnext|Add0~78\ ))
-- \PCnext|Add0~82\ = CARRY(( \immediates|Mux10~0_combout\ ) + ( GND ) + ( \PCnext|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux10~0_combout\,
	cin => \PCnext|Add0~78\,
	sumout => \PCnext|Add0~81_sumout\,
	cout => \PCnext|Add0~82\);

\ProgramCounter32|PC_internal[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~77_sumout\,
	asdata => \PCnext|Add0~81_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(21));

\PCnext|Add2~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~81_sumout\ = SUM(( \ProgramCounter32|PC_internal\(22) ) + ( GND ) + ( \PCnext|Add2~78\ ))
-- \PCnext|Add2~82\ = CARRY(( \ProgramCounter32|PC_internal\(22) ) + ( GND ) + ( \PCnext|Add2~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(22),
	cin => \PCnext|Add2~78\,
	sumout => \PCnext|Add2~81_sumout\,
	cout => \PCnext|Add2~82\);

\immediates|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux9~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(22) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(22),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux9~0_combout\);

\PCnext|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~85_sumout\ = SUM(( \immediates|Mux9~0_combout\ ) + ( GND ) + ( \PCnext|Add0~82\ ))
-- \PCnext|Add0~86\ = CARRY(( \immediates|Mux9~0_combout\ ) + ( GND ) + ( \PCnext|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux9~0_combout\,
	cin => \PCnext|Add0~82\,
	sumout => \PCnext|Add0~85_sumout\,
	cout => \PCnext|Add0~86\);

\ProgramCounter32|PC_internal[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~81_sumout\,
	asdata => \PCnext|Add0~85_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(22));

\PCnext|Add2~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~85_sumout\ = SUM(( \ProgramCounter32|PC_internal\(23) ) + ( GND ) + ( \PCnext|Add2~82\ ))
-- \PCnext|Add2~86\ = CARRY(( \ProgramCounter32|PC_internal\(23) ) + ( GND ) + ( \PCnext|Add2~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(23),
	cin => \PCnext|Add2~82\,
	sumout => \PCnext|Add2~85_sumout\,
	cout => \PCnext|Add2~86\);

\immediates|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux8~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(23) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(23),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux8~0_combout\);

\PCnext|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~89_sumout\ = SUM(( \immediates|Mux8~0_combout\ ) + ( GND ) + ( \PCnext|Add0~86\ ))
-- \PCnext|Add0~90\ = CARRY(( \immediates|Mux8~0_combout\ ) + ( GND ) + ( \PCnext|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux8~0_combout\,
	cin => \PCnext|Add0~86\,
	sumout => \PCnext|Add0~89_sumout\,
	cout => \PCnext|Add0~90\);

\ProgramCounter32|PC_internal[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~85_sumout\,
	asdata => \PCnext|Add0~89_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(23));

\PCnext|Add2~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~89_sumout\ = SUM(( \ProgramCounter32|PC_internal\(24) ) + ( GND ) + ( \PCnext|Add2~86\ ))
-- \PCnext|Add2~90\ = CARRY(( \ProgramCounter32|PC_internal\(24) ) + ( GND ) + ( \PCnext|Add2~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(24),
	cin => \PCnext|Add2~86\,
	sumout => \PCnext|Add2~89_sumout\,
	cout => \PCnext|Add2~90\);

\immediates|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux7~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(24) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(24),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux7~0_combout\);

\PCnext|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~93_sumout\ = SUM(( \immediates|Mux7~0_combout\ ) + ( GND ) + ( \PCnext|Add0~90\ ))
-- \PCnext|Add0~94\ = CARRY(( \immediates|Mux7~0_combout\ ) + ( GND ) + ( \PCnext|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux7~0_combout\,
	cin => \PCnext|Add0~90\,
	sumout => \PCnext|Add0~93_sumout\,
	cout => \PCnext|Add0~94\);

\ProgramCounter32|PC_internal[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~89_sumout\,
	asdata => \PCnext|Add0~93_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(24));

\PCnext|Add2~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~93_sumout\ = SUM(( \ProgramCounter32|PC_internal\(25) ) + ( GND ) + ( \PCnext|Add2~90\ ))
-- \PCnext|Add2~94\ = CARRY(( \ProgramCounter32|PC_internal\(25) ) + ( GND ) + ( \PCnext|Add2~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(25),
	cin => \PCnext|Add2~90\,
	sumout => \PCnext|Add2~93_sumout\,
	cout => \PCnext|Add2~94\);

\immediates|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux6~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(25) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(25),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux6~0_combout\);

\PCnext|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~97_sumout\ = SUM(( \immediates|Mux6~0_combout\ ) + ( GND ) + ( \PCnext|Add0~94\ ))
-- \PCnext|Add0~98\ = CARRY(( \immediates|Mux6~0_combout\ ) + ( GND ) + ( \PCnext|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux6~0_combout\,
	cin => \PCnext|Add0~94\,
	sumout => \PCnext|Add0~97_sumout\,
	cout => \PCnext|Add0~98\);

\ProgramCounter32|PC_internal[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~93_sumout\,
	asdata => \PCnext|Add0~97_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(25));

\PCnext|Add2~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~97_sumout\ = SUM(( \ProgramCounter32|PC_internal\(26) ) + ( GND ) + ( \PCnext|Add2~94\ ))
-- \PCnext|Add2~98\ = CARRY(( \ProgramCounter32|PC_internal\(26) ) + ( GND ) + ( \PCnext|Add2~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(26),
	cin => \PCnext|Add2~94\,
	sumout => \PCnext|Add2~97_sumout\,
	cout => \PCnext|Add2~98\);

\immediates|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux5~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(26) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(26),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux5~0_combout\);

\PCnext|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~101_sumout\ = SUM(( \immediates|Mux5~0_combout\ ) + ( GND ) + ( \PCnext|Add0~98\ ))
-- \PCnext|Add0~102\ = CARRY(( \immediates|Mux5~0_combout\ ) + ( GND ) + ( \PCnext|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux5~0_combout\,
	cin => \PCnext|Add0~98\,
	sumout => \PCnext|Add0~101_sumout\,
	cout => \PCnext|Add0~102\);

\ProgramCounter32|PC_internal[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~97_sumout\,
	asdata => \PCnext|Add0~101_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(26));

\PCnext|Add2~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~101_sumout\ = SUM(( \ProgramCounter32|PC_internal\(27) ) + ( GND ) + ( \PCnext|Add2~98\ ))
-- \PCnext|Add2~102\ = CARRY(( \ProgramCounter32|PC_internal\(27) ) + ( GND ) + ( \PCnext|Add2~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(27),
	cin => \PCnext|Add2~98\,
	sumout => \PCnext|Add2~101_sumout\,
	cout => \PCnext|Add2~102\);

\immediates|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux4~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(27) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(27),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux4~0_combout\);

\PCnext|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~105_sumout\ = SUM(( \immediates|Mux4~0_combout\ ) + ( GND ) + ( \PCnext|Add0~102\ ))
-- \PCnext|Add0~106\ = CARRY(( \immediates|Mux4~0_combout\ ) + ( GND ) + ( \PCnext|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux4~0_combout\,
	cin => \PCnext|Add0~102\,
	sumout => \PCnext|Add0~105_sumout\,
	cout => \PCnext|Add0~106\);

\ProgramCounter32|PC_internal[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~101_sumout\,
	asdata => \PCnext|Add0~105_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(27));

\PCnext|Add2~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~105_sumout\ = SUM(( \ProgramCounter32|PC_internal\(28) ) + ( GND ) + ( \PCnext|Add2~102\ ))
-- \PCnext|Add2~106\ = CARRY(( \ProgramCounter32|PC_internal\(28) ) + ( GND ) + ( \PCnext|Add2~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(28),
	cin => \PCnext|Add2~102\,
	sumout => \PCnext|Add2~105_sumout\,
	cout => \PCnext|Add2~106\);

\immediates|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux3~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(28) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(28),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux3~0_combout\);

\PCnext|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~109_sumout\ = SUM(( \immediates|Mux3~0_combout\ ) + ( GND ) + ( \PCnext|Add0~106\ ))
-- \PCnext|Add0~110\ = CARRY(( \immediates|Mux3~0_combout\ ) + ( GND ) + ( \PCnext|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux3~0_combout\,
	cin => \PCnext|Add0~106\,
	sumout => \PCnext|Add0~109_sumout\,
	cout => \PCnext|Add0~110\);

\ProgramCounter32|PC_internal[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~105_sumout\,
	asdata => \PCnext|Add0~109_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(28));

\PCnext|Add2~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~109_sumout\ = SUM(( \ProgramCounter32|PC_internal\(29) ) + ( GND ) + ( \PCnext|Add2~106\ ))
-- \PCnext|Add2~110\ = CARRY(( \ProgramCounter32|PC_internal\(29) ) + ( GND ) + ( \PCnext|Add2~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(29),
	cin => \PCnext|Add2~106\,
	sumout => \PCnext|Add2~109_sumout\,
	cout => \PCnext|Add2~110\);

\immediates|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux2~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(29) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(29),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux2~0_combout\);

\PCnext|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~113_sumout\ = SUM(( \immediates|Mux2~0_combout\ ) + ( GND ) + ( \PCnext|Add0~110\ ))
-- \PCnext|Add0~114\ = CARRY(( \immediates|Mux2~0_combout\ ) + ( GND ) + ( \PCnext|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux2~0_combout\,
	cin => \PCnext|Add0~110\,
	sumout => \PCnext|Add0~113_sumout\,
	cout => \PCnext|Add0~114\);

\ProgramCounter32|PC_internal[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~109_sumout\,
	asdata => \PCnext|Add0~113_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(29));

\PCnext|Add2~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~113_sumout\ = SUM(( \ProgramCounter32|PC_internal\(30) ) + ( GND ) + ( \PCnext|Add2~110\ ))
-- \PCnext|Add2~114\ = CARRY(( \ProgramCounter32|PC_internal\(30) ) + ( GND ) + ( \PCnext|Add2~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(30),
	cin => \PCnext|Add2~110\,
	sumout => \PCnext|Add2~113_sumout\,
	cout => \PCnext|Add2~114\);

\immediates|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux1~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(0) & (\InstructionRegister32|IR_internal\(30) 
-- & ((\decoder|instructionType\(2))))) # (\decoder|instructionType\(0) & (((\InstructionRegister32|IR_internal\(31))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110011001100000011000000000101001100110011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(30),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux1~0_combout\);

\PCnext|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~117_sumout\ = SUM(( \immediates|Mux1~0_combout\ ) + ( GND ) + ( \PCnext|Add0~114\ ))
-- \PCnext|Add0~118\ = CARRY(( \immediates|Mux1~0_combout\ ) + ( GND ) + ( \PCnext|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \immediates|ALT_INV_Mux1~0_combout\,
	cin => \PCnext|Add0~114\,
	sumout => \PCnext|Add0~117_sumout\,
	cout => \PCnext|Add0~118\);

\ProgramCounter32|PC_internal[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~113_sumout\,
	asdata => \PCnext|Add0~117_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(30));

\PCnext|Add2~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add2~117_sumout\ = SUM(( \ProgramCounter32|PC_internal\(31) ) + ( GND ) + ( \PCnext|Add2~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ProgramCounter32|ALT_INV_PC_internal\(31),
	cin => \PCnext|Add2~114\,
	sumout => \PCnext|Add2~117_sumout\);

\PCnext|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \PCnext|Add0~121_sumout\ = SUM(( GND ) + ( (\InstructionRegister32|IR_internal\(31) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)) # (\decoder|instructionType\(2)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2))))) 
-- ) + ( \PCnext|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111001000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|ALT_INV_instructionType\(1),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	dataf => \InstructionRegister32|ALT_INV_IR_internal\(31),
	cin => \PCnext|Add0~118\,
	sumout => \PCnext|Add0~121_sumout\);

\ProgramCounter32|PC_internal[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PCnext|Add2~117_sumout\,
	asdata => \PCnext|Add0~121_sumout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => \decoder|Mux15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ProgramCounter32|PC_internal\(31));

\immediates|Mux31~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux31~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(7) & (!\decoder|instructionType\(2) & !\decoder|instructionType\(0))) ) ) # ( !\decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(20) 
-- & (!\decoder|instructionType\(2) & \decoder|instructionType\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110000010100000000000000000000001100000101000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(7),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(20),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux31~0_combout\);

\immediates|Mux30~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux30~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(8) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(21) & \decoder|instructionType\(0)) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011010100000101000000000000001100110101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(8),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(21),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux30~0_combout\);

\immediates|Mux29~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux29~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(9) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(22) & \decoder|instructionType\(0)) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011010100000101000000000000001100110101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(9),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(22),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux29~0_combout\);

\immediates|Mux28~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux28~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(10) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(23) & \decoder|instructionType\(0)) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011010100000101000000000000001100110101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(10),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(23),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux28~0_combout\);

\immediates|Mux27~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux27~0_combout\ = ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(11) & !\decoder|instructionType\(2)) ) ) # ( !\decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(24) & \decoder|instructionType\(0)) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011010100000101000000000000001100110101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(11),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(24),
	datac => \decoder|ALT_INV_instructionType\(2),
	datad => \decoder|ALT_INV_instructionType\(0),
	datae => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux27~0_combout\);

\immediates|Mux26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux26~0_combout\ = (\InstructionRegister32|IR_internal\(25) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101000100000001010100010000000101010001000000010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(25),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux26~0_combout\);

\immediates|Mux25~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux25~0_combout\ = (\InstructionRegister32|IR_internal\(26) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101000100000001010100010000000101010001000000010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(26),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux25~0_combout\);

\immediates|Mux24~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux24~0_combout\ = (\InstructionRegister32|IR_internal\(27) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101000100000001010100010000000101010001000000010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(27),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux24~0_combout\);

\immediates|Mux23~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux23~0_combout\ = (\InstructionRegister32|IR_internal\(28) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101000100000001010100010000000101010001000000010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(28),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux23~0_combout\);

\immediates|Mux22~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux22~0_combout\ = (\InstructionRegister32|IR_internal\(29) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101000100000001010100010000000101010001000000010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(29),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux22~0_combout\);

\immediates|Mux21~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux21~0_combout\ = (\InstructionRegister32|IR_internal\(30) & ((!\decoder|instructionType\(1) & ((\decoder|instructionType\(0)))) # (\decoder|instructionType\(1) & (!\decoder|instructionType\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101000100000001010100010000000101010001000000010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(30),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux21~0_combout\);

\immediates|Mux20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux20~0_combout\ = ( \decoder|instructionType\(0) & ( \decoder|instructionType\(1) & ( (\InstructionRegister32|IR_internal\(7) & !\decoder|instructionType\(2)) ) ) ) # ( !\decoder|instructionType\(0) & ( \decoder|instructionType\(1) & ( 
-- (\InstructionRegister32|IR_internal\(31) & !\decoder|instructionType\(2)) ) ) ) # ( \decoder|instructionType\(0) & ( !\decoder|instructionType\(1) & ( (!\decoder|instructionType\(2) & ((\InstructionRegister32|IR_internal\(31)))) # 
-- (\decoder|instructionType\(2) & (\InstructionRegister32|IR_internal\(20))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110011001100001111000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(7),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(20),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datad => \decoder|ALT_INV_instructionType\(2),
	datae => \decoder|ALT_INV_instructionType\(0),
	dataf => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux20~0_combout\);

\immediates|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \immediates|Mux0~0_combout\ = (\InstructionRegister32|IR_internal\(31) & ((!\decoder|instructionType\(2) & ((\decoder|instructionType\(1)) # (\decoder|instructionType\(0)))) # (\decoder|instructionType\(2) & ((!\decoder|instructionType\(1))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010101000100000101010100010000010101010001000001010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(31),
	datab => \decoder|ALT_INV_instructionType\(2),
	datac => \decoder|ALT_INV_instructionType\(0),
	datad => \decoder|ALT_INV_instructionType\(1),
	combout => \immediates|Mux0~0_combout\);

\~GND\ : cyclonev_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

\RAM|altsyncram_component|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a8\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a9\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a10\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a11\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a12\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a13\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a14\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a15\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a16\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 16,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a17\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 17,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a18\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 18,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a19\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 19,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a20\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 20,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a21\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 21,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a22\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 22,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a23\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 23,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a24\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 24,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a25\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 25,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a26\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 26,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a27\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 27,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a28\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 28,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a29\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 29,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a30\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 30,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\);

\RAM|altsyncram_component|auto_generated|ram_block1a31\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "CPURAM:RAM|altsyncram:altsyncram_component|altsyncram_u914:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 1,
	port_a_byte_enable_mask_width => 1,
	port_a_byte_size => 1,
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 31,
	port_a_last_address => 1,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 1,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~input_o\,
	ena0 => VCC,
	portadatain => \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAIN_bus\,
	portaaddr => \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\,
	portabyteenamasks => \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTABYTEENAMASKS_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \RAM|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\);

\decoder|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux9~0_combout\ = ( \InstructionRegister32|IR_internal\(6) & ( (!\InstructionRegister32|IR_internal\(3) & (\InstructionRegister32|IR_internal\(5) & ((!\InstructionRegister32|IR_internal\(2)) # (!\InstructionRegister32|IR_internal\(4))))) ) ) # ( 
-- !\InstructionRegister32|IR_internal\(6) & ( (!\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3))) # (\InstructionRegister32|IR_internal\(2) & (\InstructionRegister32|IR_internal\(3) & 
-- (!\InstructionRegister32|IR_internal\(4) & !\InstructionRegister32|IR_internal\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100010001000000000001100100010011000100010000000000011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(5),
	datae => \InstructionRegister32|ALT_INV_IR_internal\(6),
	combout => \decoder|Mux9~0_combout\);

\decoder|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux9~1_combout\ = (\InstructionRegister32|IR_internal\(15) & (\decoder|Mux9~0_combout\ & \decoder|Mux15~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(15),
	datab => \decoder|ALT_INV_Mux9~0_combout\,
	datac => \decoder|ALT_INV_Mux15~0_combout\,
	combout => \decoder|Mux9~1_combout\);

\decoder|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux8~0_combout\ = (\InstructionRegister32|IR_internal\(16) & (\decoder|Mux9~0_combout\ & \decoder|Mux15~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(16),
	datab => \decoder|ALT_INV_Mux9~0_combout\,
	datac => \decoder|ALT_INV_Mux15~0_combout\,
	combout => \decoder|Mux8~0_combout\);

\decoder|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux7~0_combout\ = (\InstructionRegister32|IR_internal\(17) & (\decoder|Mux9~0_combout\ & \decoder|Mux15~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(17),
	datab => \decoder|ALT_INV_Mux9~0_combout\,
	datac => \decoder|ALT_INV_Mux15~0_combout\,
	combout => \decoder|Mux7~0_combout\);

\decoder|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux6~0_combout\ = (\InstructionRegister32|IR_internal\(18) & (\decoder|Mux9~0_combout\ & \decoder|Mux15~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(18),
	datab => \decoder|ALT_INV_Mux9~0_combout\,
	datac => \decoder|ALT_INV_Mux15~0_combout\,
	combout => \decoder|Mux6~0_combout\);

\decoder|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux5~0_combout\ = (\InstructionRegister32|IR_internal\(19) & (\decoder|Mux9~0_combout\ & \decoder|Mux15~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(19),
	datab => \decoder|ALT_INV_Mux9~0_combout\,
	datac => \decoder|ALT_INV_Mux15~0_combout\,
	combout => \decoder|Mux5~0_combout\);

\decoder|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux13~0_combout\ = (\InstructionRegister32|IR_internal\(2) & (\InstructionRegister32|IR_internal\(3) & (!\InstructionRegister32|IR_internal\(5) & !\InstructionRegister32|IR_internal\(6))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000100000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(5),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(6),
	combout => \decoder|Mux13~0_combout\);

\decoder|Mux13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux13~1_combout\ = ( \InstructionRegister32|IR_internal\(5) & ( (\InstructionRegister32|IR_internal\(0) & (\InstructionRegister32|IR_internal\(1) & (!\InstructionRegister32|IR_internal\(2) & !\InstructionRegister32|IR_internal\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100000000000000000000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(0),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(1),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datae => \InstructionRegister32|ALT_INV_IR_internal\(5),
	combout => \decoder|Mux13~1_combout\);

\decoder|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux14~0_combout\ = ( \decoder|Mux13~1_combout\ & ( \InstructionRegister32|IR_internal\(20) ) ) # ( !\decoder|Mux13~1_combout\ & ( (!\InstructionRegister32|IR_internal\(4) & (\InstructionRegister32|IR_internal\(20) & (\decoder|Mux13~0_combout\ & 
-- \decoder|Mux15~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010001100110011001100000000000000100011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(20),
	datac => \decoder|ALT_INV_Mux13~0_combout\,
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux13~1_combout\,
	combout => \decoder|Mux14~0_combout\);

\decoder|Mux13~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux13~2_combout\ = ( \decoder|Mux13~1_combout\ & ( \InstructionRegister32|IR_internal\(21) ) ) # ( !\decoder|Mux13~1_combout\ & ( (!\InstructionRegister32|IR_internal\(4) & (\InstructionRegister32|IR_internal\(21) & (\decoder|Mux13~0_combout\ & 
-- \decoder|Mux15~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010001100110011001100000000000000100011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(21),
	datac => \decoder|ALT_INV_Mux13~0_combout\,
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux13~1_combout\,
	combout => \decoder|Mux13~2_combout\);

\decoder|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux12~0_combout\ = ( \decoder|Mux13~1_combout\ & ( \InstructionRegister32|IR_internal\(22) ) ) # ( !\decoder|Mux13~1_combout\ & ( (!\InstructionRegister32|IR_internal\(4) & (\InstructionRegister32|IR_internal\(22) & (\decoder|Mux13~0_combout\ & 
-- \decoder|Mux15~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010001100110011001100000000000000100011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(22),
	datac => \decoder|ALT_INV_Mux13~0_combout\,
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux13~1_combout\,
	combout => \decoder|Mux12~0_combout\);

\decoder|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux11~0_combout\ = ( \decoder|Mux13~1_combout\ & ( \InstructionRegister32|IR_internal\(23) ) ) # ( !\decoder|Mux13~1_combout\ & ( (!\InstructionRegister32|IR_internal\(4) & (\InstructionRegister32|IR_internal\(23) & (\decoder|Mux13~0_combout\ & 
-- \decoder|Mux15~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010001100110011001100000000000000100011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(23),
	datac => \decoder|ALT_INV_Mux13~0_combout\,
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux13~1_combout\,
	combout => \decoder|Mux11~0_combout\);

\decoder|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux10~0_combout\ = ( \decoder|Mux13~1_combout\ & ( \InstructionRegister32|IR_internal\(24) ) ) # ( !\decoder|Mux13~1_combout\ & ( (!\InstructionRegister32|IR_internal\(4) & (\InstructionRegister32|IR_internal\(24) & (\decoder|Mux13~0_combout\ & 
-- \decoder|Mux15~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010001100110011001100000000000000100011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(24),
	datac => \decoder|ALT_INV_Mux13~0_combout\,
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux13~1_combout\,
	combout => \decoder|Mux10~0_combout\);

\decoder|Mux17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux17~0_combout\ = ( \InstructionRegister32|IR_internal\(6) & ( (\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(4) & \InstructionRegister32|IR_internal\(5))) ) ) # ( !\InstructionRegister32|IR_internal\(6) & ( 
-- (!\InstructionRegister32|IR_internal\(4) & (!\InstructionRegister32|IR_internal\(5) & (!\InstructionRegister32|IR_internal\(2) $ (\InstructionRegister32|IR_internal\(3))))) # (\InstructionRegister32|IR_internal\(4) & 
-- (((!\InstructionRegister32|IR_internal\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001110000001100000000000101000010011100000011000000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datad => \InstructionRegister32|ALT_INV_IR_internal\(5),
	datae => \InstructionRegister32|ALT_INV_IR_internal\(6),
	combout => \decoder|Mux17~0_combout\);

\decoder|Mux17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux17~1_combout\ = (\InstructionRegister32|IR_internal\(4) & (\InstructionRegister32|IR_internal\(5) & \InstructionRegister32|IR_internal\(6)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(4),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(5),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(6),
	combout => \decoder|Mux17~1_combout\);

\decoder|Mux20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux20~0_combout\ = ( \decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( (\InstructionRegister32|IR_internal\(7) & \decoder|Mux15~0_combout\) ) ) ) # ( !\decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( 
-- (!\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3) & (\InstructionRegister32|IR_internal\(7) & \decoder|Mux15~0_combout\))) ) ) ) # ( \decoder|Mux17~0_combout\ & ( !\decoder|Mux17~1_combout\ & ( 
-- (\InstructionRegister32|IR_internal\(7) & \decoder|Mux15~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000010000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(7),
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux17~0_combout\,
	dataf => \decoder|ALT_INV_Mux17~1_combout\,
	combout => \decoder|Mux20~0_combout\);

\decoder|Mux19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux19~0_combout\ = ( \decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( (\InstructionRegister32|IR_internal\(8) & \decoder|Mux15~0_combout\) ) ) ) # ( !\decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( 
-- (!\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3) & (\InstructionRegister32|IR_internal\(8) & \decoder|Mux15~0_combout\))) ) ) ) # ( \decoder|Mux17~0_combout\ & ( !\decoder|Mux17~1_combout\ & ( 
-- (\InstructionRegister32|IR_internal\(8) & \decoder|Mux15~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000010000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(8),
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux17~0_combout\,
	dataf => \decoder|ALT_INV_Mux17~1_combout\,
	combout => \decoder|Mux19~0_combout\);

\decoder|Mux18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux18~0_combout\ = ( \decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( (\InstructionRegister32|IR_internal\(9) & \decoder|Mux15~0_combout\) ) ) ) # ( !\decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( 
-- (!\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3) & (\InstructionRegister32|IR_internal\(9) & \decoder|Mux15~0_combout\))) ) ) ) # ( \decoder|Mux17~0_combout\ & ( !\decoder|Mux17~1_combout\ & ( 
-- (\InstructionRegister32|IR_internal\(9) & \decoder|Mux15~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000010000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(9),
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux17~0_combout\,
	dataf => \decoder|ALT_INV_Mux17~1_combout\,
	combout => \decoder|Mux18~0_combout\);

\decoder|Mux17~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux17~2_combout\ = ( \decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( (\InstructionRegister32|IR_internal\(10) & \decoder|Mux15~0_combout\) ) ) ) # ( !\decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( 
-- (!\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3) & (\InstructionRegister32|IR_internal\(10) & \decoder|Mux15~0_combout\))) ) ) ) # ( \decoder|Mux17~0_combout\ & ( !\decoder|Mux17~1_combout\ & ( 
-- (\InstructionRegister32|IR_internal\(10) & \decoder|Mux15~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000010000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(10),
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux17~0_combout\,
	dataf => \decoder|ALT_INV_Mux17~1_combout\,
	combout => \decoder|Mux17~2_combout\);

\decoder|Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decoder|Mux16~0_combout\ = ( \decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( (\InstructionRegister32|IR_internal\(11) & \decoder|Mux15~0_combout\) ) ) ) # ( !\decoder|Mux17~0_combout\ & ( \decoder|Mux17~1_combout\ & ( 
-- (!\InstructionRegister32|IR_internal\(2) & (!\InstructionRegister32|IR_internal\(3) & (\InstructionRegister32|IR_internal\(11) & \decoder|Mux15~0_combout\))) ) ) ) # ( \decoder|Mux17~0_combout\ & ( !\decoder|Mux17~1_combout\ & ( 
-- (\InstructionRegister32|IR_internal\(11) & \decoder|Mux15~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000010000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \InstructionRegister32|ALT_INV_IR_internal\(2),
	datab => \InstructionRegister32|ALT_INV_IR_internal\(3),
	datac => \InstructionRegister32|ALT_INV_IR_internal\(11),
	datad => \decoder|ALT_INV_Mux15~0_combout\,
	datae => \decoder|ALT_INV_Mux17~0_combout\,
	dataf => \decoder|ALT_INV_Mux17~1_combout\,
	combout => \decoder|Mux16~0_combout\);
END structure;


