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
-- Generated on "08/03/2025 03:22:28"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          alu32bit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alu32bit_vhd_vec_tst IS
END alu32bit_vhd_vec_tst;
ARCHITECTURE alu32bit_arch OF alu32bit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cin : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL reg1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL reg2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL s : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT alu32bit
	PORT (
	cin : IN STD_LOGIC;
	output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	reg1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	reg2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	s : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : alu32bit
	PORT MAP (
-- list connections between master ports and signals
	cin => cin,
	output => output,
	reg1 => reg1,
	reg2 => reg2,
	s => s
	);
-- reg1[31]
t_prcs_reg1_31: PROCESS
BEGIN
	reg1(31) <= '1';
WAIT;
END PROCESS t_prcs_reg1_31;
-- reg1[30]
t_prcs_reg1_30: PROCESS
BEGIN
	reg1(30) <= '1';
WAIT;
END PROCESS t_prcs_reg1_30;
-- reg1[29]
t_prcs_reg1_29: PROCESS
BEGIN
	reg1(29) <= '1';
WAIT;
END PROCESS t_prcs_reg1_29;
-- reg1[28]
t_prcs_reg1_28: PROCESS
BEGIN
	reg1(28) <= '1';
WAIT;
END PROCESS t_prcs_reg1_28;
-- reg1[27]
t_prcs_reg1_27: PROCESS
BEGIN
	reg1(27) <= '1';
WAIT;
END PROCESS t_prcs_reg1_27;
-- reg1[26]
t_prcs_reg1_26: PROCESS
BEGIN
	reg1(26) <= '1';
WAIT;
END PROCESS t_prcs_reg1_26;
-- reg1[25]
t_prcs_reg1_25: PROCESS
BEGIN
	reg1(25) <= '1';
WAIT;
END PROCESS t_prcs_reg1_25;
-- reg1[24]
t_prcs_reg1_24: PROCESS
BEGIN
	reg1(24) <= '1';
WAIT;
END PROCESS t_prcs_reg1_24;
-- reg1[23]
t_prcs_reg1_23: PROCESS
BEGIN
	reg1(23) <= '1';
WAIT;
END PROCESS t_prcs_reg1_23;
-- reg1[22]
t_prcs_reg1_22: PROCESS
BEGIN
	reg1(22) <= '1';
WAIT;
END PROCESS t_prcs_reg1_22;
-- reg1[21]
t_prcs_reg1_21: PROCESS
BEGIN
	reg1(21) <= '1';
WAIT;
END PROCESS t_prcs_reg1_21;
-- reg1[20]
t_prcs_reg1_20: PROCESS
BEGIN
	reg1(20) <= '1';
WAIT;
END PROCESS t_prcs_reg1_20;
-- reg1[19]
t_prcs_reg1_19: PROCESS
BEGIN
	reg1(19) <= '1';
WAIT;
END PROCESS t_prcs_reg1_19;
-- reg1[18]
t_prcs_reg1_18: PROCESS
BEGIN
	reg1(18) <= '1';
WAIT;
END PROCESS t_prcs_reg1_18;
-- reg1[17]
t_prcs_reg1_17: PROCESS
BEGIN
	reg1(17) <= '1';
WAIT;
END PROCESS t_prcs_reg1_17;
-- reg1[16]
t_prcs_reg1_16: PROCESS
BEGIN
	reg1(16) <= '1';
WAIT;
END PROCESS t_prcs_reg1_16;
-- reg1[15]
t_prcs_reg1_15: PROCESS
BEGIN
	reg1(15) <= '1';
WAIT;
END PROCESS t_prcs_reg1_15;
-- reg1[14]
t_prcs_reg1_14: PROCESS
BEGIN
	reg1(14) <= '1';
WAIT;
END PROCESS t_prcs_reg1_14;
-- reg1[13]
t_prcs_reg1_13: PROCESS
BEGIN
	reg1(13) <= '1';
WAIT;
END PROCESS t_prcs_reg1_13;
-- reg1[12]
t_prcs_reg1_12: PROCESS
BEGIN
	reg1(12) <= '1';
WAIT;
END PROCESS t_prcs_reg1_12;
-- reg1[11]
t_prcs_reg1_11: PROCESS
BEGIN
	reg1(11) <= '1';
WAIT;
END PROCESS t_prcs_reg1_11;
-- reg1[10]
t_prcs_reg1_10: PROCESS
BEGIN
	reg1(10) <= '1';
WAIT;
END PROCESS t_prcs_reg1_10;
-- reg1[9]
t_prcs_reg1_9: PROCESS
BEGIN
	reg1(9) <= '1';
WAIT;
END PROCESS t_prcs_reg1_9;
-- reg1[8]
t_prcs_reg1_8: PROCESS
BEGIN
	reg1(8) <= '1';
WAIT;
END PROCESS t_prcs_reg1_8;
-- reg1[7]
t_prcs_reg1_7: PROCESS
BEGIN
	reg1(7) <= '1';
WAIT;
END PROCESS t_prcs_reg1_7;
-- reg1[6]
t_prcs_reg1_6: PROCESS
BEGIN
	reg1(6) <= '1';
WAIT;
END PROCESS t_prcs_reg1_6;
-- reg1[5]
t_prcs_reg1_5: PROCESS
BEGIN
	reg1(5) <= '1';
WAIT;
END PROCESS t_prcs_reg1_5;
-- reg1[4]
t_prcs_reg1_4: PROCESS
BEGIN
	reg1(4) <= '1';
WAIT;
END PROCESS t_prcs_reg1_4;
-- reg1[3]
t_prcs_reg1_3: PROCESS
BEGIN
	reg1(3) <= '1';
WAIT;
END PROCESS t_prcs_reg1_3;
-- reg1[2]
t_prcs_reg1_2: PROCESS
BEGIN
	reg1(2) <= '1';
WAIT;
END PROCESS t_prcs_reg1_2;
-- reg1[1]
t_prcs_reg1_1: PROCESS
BEGIN
	reg1(1) <= '1';
WAIT;
END PROCESS t_prcs_reg1_1;
-- reg1[0]
t_prcs_reg1_0: PROCESS
BEGIN
	reg1(0) <= '1';
WAIT;
END PROCESS t_prcs_reg1_0;
-- reg2[31]
t_prcs_reg2_31: PROCESS
BEGIN
	reg2(31) <= '0';
WAIT;
END PROCESS t_prcs_reg2_31;
-- reg2[30]
t_prcs_reg2_30: PROCESS
BEGIN
	reg2(30) <= '0';
WAIT;
END PROCESS t_prcs_reg2_30;
-- reg2[29]
t_prcs_reg2_29: PROCESS
BEGIN
	reg2(29) <= '0';
WAIT;
END PROCESS t_prcs_reg2_29;
-- reg2[28]
t_prcs_reg2_28: PROCESS
BEGIN
	reg2(28) <= '0';
WAIT;
END PROCESS t_prcs_reg2_28;
-- reg2[27]
t_prcs_reg2_27: PROCESS
BEGIN
	reg2(27) <= '0';
WAIT;
END PROCESS t_prcs_reg2_27;
-- reg2[26]
t_prcs_reg2_26: PROCESS
BEGIN
	reg2(26) <= '0';
WAIT;
END PROCESS t_prcs_reg2_26;
-- reg2[25]
t_prcs_reg2_25: PROCESS
BEGIN
	reg2(25) <= '0';
WAIT;
END PROCESS t_prcs_reg2_25;
-- reg2[24]
t_prcs_reg2_24: PROCESS
BEGIN
	reg2(24) <= '0';
WAIT;
END PROCESS t_prcs_reg2_24;
-- reg2[23]
t_prcs_reg2_23: PROCESS
BEGIN
	reg2(23) <= '0';
WAIT;
END PROCESS t_prcs_reg2_23;
-- reg2[22]
t_prcs_reg2_22: PROCESS
BEGIN
	reg2(22) <= '0';
WAIT;
END PROCESS t_prcs_reg2_22;
-- reg2[21]
t_prcs_reg2_21: PROCESS
BEGIN
	reg2(21) <= '0';
WAIT;
END PROCESS t_prcs_reg2_21;
-- reg2[20]
t_prcs_reg2_20: PROCESS
BEGIN
	reg2(20) <= '0';
WAIT;
END PROCESS t_prcs_reg2_20;
-- reg2[19]
t_prcs_reg2_19: PROCESS
BEGIN
	reg2(19) <= '0';
WAIT;
END PROCESS t_prcs_reg2_19;
-- reg2[18]
t_prcs_reg2_18: PROCESS
BEGIN
	reg2(18) <= '0';
WAIT;
END PROCESS t_prcs_reg2_18;
-- reg2[17]
t_prcs_reg2_17: PROCESS
BEGIN
	reg2(17) <= '0';
WAIT;
END PROCESS t_prcs_reg2_17;
-- reg2[16]
t_prcs_reg2_16: PROCESS
BEGIN
	reg2(16) <= '0';
WAIT;
END PROCESS t_prcs_reg2_16;
-- reg2[15]
t_prcs_reg2_15: PROCESS
BEGIN
	reg2(15) <= '0';
WAIT;
END PROCESS t_prcs_reg2_15;
-- reg2[14]
t_prcs_reg2_14: PROCESS
BEGIN
	reg2(14) <= '0';
WAIT;
END PROCESS t_prcs_reg2_14;
-- reg2[13]
t_prcs_reg2_13: PROCESS
BEGIN
	reg2(13) <= '0';
WAIT;
END PROCESS t_prcs_reg2_13;
-- reg2[12]
t_prcs_reg2_12: PROCESS
BEGIN
	reg2(12) <= '0';
WAIT;
END PROCESS t_prcs_reg2_12;
-- reg2[11]
t_prcs_reg2_11: PROCESS
BEGIN
	reg2(11) <= '0';
WAIT;
END PROCESS t_prcs_reg2_11;
-- reg2[10]
t_prcs_reg2_10: PROCESS
BEGIN
	reg2(10) <= '0';
WAIT;
END PROCESS t_prcs_reg2_10;
-- reg2[9]
t_prcs_reg2_9: PROCESS
BEGIN
	reg2(9) <= '0';
WAIT;
END PROCESS t_prcs_reg2_9;
-- reg2[8]
t_prcs_reg2_8: PROCESS
BEGIN
	reg2(8) <= '0';
WAIT;
END PROCESS t_prcs_reg2_8;
-- reg2[7]
t_prcs_reg2_7: PROCESS
BEGIN
	reg2(7) <= '0';
WAIT;
END PROCESS t_prcs_reg2_7;
-- reg2[6]
t_prcs_reg2_6: PROCESS
BEGIN
	reg2(6) <= '0';
WAIT;
END PROCESS t_prcs_reg2_6;
-- reg2[5]
t_prcs_reg2_5: PROCESS
BEGIN
	reg2(5) <= '0';
WAIT;
END PROCESS t_prcs_reg2_5;
-- reg2[4]
t_prcs_reg2_4: PROCESS
BEGIN
	reg2(4) <= '0';
WAIT;
END PROCESS t_prcs_reg2_4;
-- reg2[3]
t_prcs_reg2_3: PROCESS
BEGIN
	reg2(3) <= '0';
WAIT;
END PROCESS t_prcs_reg2_3;
-- reg2[2]
t_prcs_reg2_2: PROCESS
BEGIN
	reg2(2) <= '0';
WAIT;
END PROCESS t_prcs_reg2_2;
-- reg2[1]
t_prcs_reg2_1: PROCESS
BEGIN
	reg2(1) <= '0';
WAIT;
END PROCESS t_prcs_reg2_1;
-- reg2[0]
t_prcs_reg2_0: PROCESS
BEGIN
	reg2(0) <= '0';
WAIT;
END PROCESS t_prcs_reg2_0;

-- cin
t_prcs_cin: PROCESS
BEGIN
	cin <= '0';
WAIT;
END PROCESS t_prcs_cin;
-- s[2]
t_prcs_s_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		s(2) <= '0';
		WAIT FOR 40000 ps;
		s(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	s(2) <= '0';
WAIT;
END PROCESS t_prcs_s_2;
-- s[1]
t_prcs_s_1: PROCESS
BEGIN
LOOP
	s(1) <= '0';
	WAIT FOR 20000 ps;
	s(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_s_1;
-- s[0]
t_prcs_s_0: PROCESS
BEGIN
LOOP
	s(0) <= '0';
	WAIT FOR 10000 ps;
	s(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_s_0;
END alu32bit_arch;
