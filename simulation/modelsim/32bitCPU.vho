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

-- DATE "08/03/2025 03:20:41"

-- 
-- Device: Altera 5CSEBA6U23I7 Package UFBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	alu32bit IS
    PORT (
	reg1 : IN std_logic_vector(31 DOWNTO 0);
	reg2 : IN std_logic_vector(31 DOWNTO 0);
	cin : IN std_logic;
	s : IN std_logic_vector(2 DOWNTO 0);
	output : OUT std_logic_vector(31 DOWNTO 0)
	);
END alu32bit;

-- Design Ports Information
-- output[0]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_AG20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[8]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[9]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[10]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[11]	=>  Location: PIN_AE20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[12]	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[13]	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[14]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[15]	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[16]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[17]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[18]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[19]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[20]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[21]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[22]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[23]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[24]	=>  Location: PIN_AG9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[25]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[26]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[27]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[28]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[29]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[30]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[31]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[2]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[0]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[0]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[0]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[1]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[1]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[2]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[2]	=>  Location: PIN_AG14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[3]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[3]	=>  Location: PIN_AH16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[4]	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[4]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[5]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[5]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[6]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[6]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[7]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[7]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[8]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[8]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[9]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[9]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[10]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[10]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[11]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[11]	=>  Location: PIN_U14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[12]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[12]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[13]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[13]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[14]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[14]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[15]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[15]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[16]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[16]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[17]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[17]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[18]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[18]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[19]	=>  Location: PIN_AH11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[19]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[20]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[20]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[21]	=>  Location: PIN_AG13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[21]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[22]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[22]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[23]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[23]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[24]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[24]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[25]	=>  Location: PIN_AH2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[25]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[26]	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[26]	=>  Location: PIN_AG5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[27]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[27]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[28]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[28]	=>  Location: PIN_AD23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[29]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[29]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[30]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[30]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[31]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[31]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF alu32bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reg1 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_reg2 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_s : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(31 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \s[0]~input_o\ : std_logic;
SIGNAL \reg2[0]~input_o\ : std_logic;
SIGNAL \s[2]~input_o\ : std_logic;
SIGNAL \s[1]~input_o\ : std_logic;
SIGNAL \reg1[0]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \Add0~130_cout\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Mux31~0_combout\ : std_logic;
SIGNAL \reg2[1]~input_o\ : std_logic;
SIGNAL \reg1[1]~input_o\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Mux30~0_combout\ : std_logic;
SIGNAL \reg2[2]~input_o\ : std_logic;
SIGNAL \reg1[2]~input_o\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Mux29~0_combout\ : std_logic;
SIGNAL \reg1[3]~input_o\ : std_logic;
SIGNAL \reg2[3]~input_o\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Mux28~0_combout\ : std_logic;
SIGNAL \reg2[4]~input_o\ : std_logic;
SIGNAL \reg1[4]~input_o\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Mux27~0_combout\ : std_logic;
SIGNAL \reg1[5]~input_o\ : std_logic;
SIGNAL \reg2[5]~input_o\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Mux26~0_combout\ : std_logic;
SIGNAL \reg2[6]~input_o\ : std_logic;
SIGNAL \reg1[6]~input_o\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Mux25~0_combout\ : std_logic;
SIGNAL \reg2[7]~input_o\ : std_logic;
SIGNAL \reg1[7]~input_o\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \reg2[8]~input_o\ : std_logic;
SIGNAL \reg1[8]~input_o\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Mux23~0_combout\ : std_logic;
SIGNAL \reg1[9]~input_o\ : std_logic;
SIGNAL \reg2[9]~input_o\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Mux22~0_combout\ : std_logic;
SIGNAL \reg1[10]~input_o\ : std_logic;
SIGNAL \reg2[10]~input_o\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Mux21~0_combout\ : std_logic;
SIGNAL \reg1[11]~input_o\ : std_logic;
SIGNAL \reg2[11]~input_o\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \Mux20~0_combout\ : std_logic;
SIGNAL \reg2[12]~input_o\ : std_logic;
SIGNAL \reg1[12]~input_o\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \reg2[13]~input_o\ : std_logic;
SIGNAL \reg1[13]~input_o\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \reg1[14]~input_o\ : std_logic;
SIGNAL \reg2[14]~input_o\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \reg1[15]~input_o\ : std_logic;
SIGNAL \reg2[15]~input_o\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \reg2[16]~input_o\ : std_logic;
SIGNAL \reg1[16]~input_o\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \reg1[17]~input_o\ : std_logic;
SIGNAL \reg2[17]~input_o\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \reg1[18]~input_o\ : std_logic;
SIGNAL \reg2[18]~input_o\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \reg2[19]~input_o\ : std_logic;
SIGNAL \reg1[19]~input_o\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \reg2[20]~input_o\ : std_logic;
SIGNAL \reg1[20]~input_o\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \reg1[21]~input_o\ : std_logic;
SIGNAL \reg2[21]~input_o\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \reg2[22]~input_o\ : std_logic;
SIGNAL \reg1[22]~input_o\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \reg1[23]~input_o\ : std_logic;
SIGNAL \reg2[23]~input_o\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \reg2[24]~input_o\ : std_logic;
SIGNAL \reg1[24]~input_o\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \reg1[25]~input_o\ : std_logic;
SIGNAL \reg2[25]~input_o\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~101_sumout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \reg1[26]~input_o\ : std_logic;
SIGNAL \reg2[26]~input_o\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~105_sumout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \reg1[27]~input_o\ : std_logic;
SIGNAL \reg2[27]~input_o\ : std_logic;
SIGNAL \Add0~106\ : std_logic;
SIGNAL \Add0~109_sumout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \reg1[28]~input_o\ : std_logic;
SIGNAL \reg2[28]~input_o\ : std_logic;
SIGNAL \Add0~110\ : std_logic;
SIGNAL \Add0~113_sumout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \reg2[29]~input_o\ : std_logic;
SIGNAL \reg1[29]~input_o\ : std_logic;
SIGNAL \Add0~114\ : std_logic;
SIGNAL \Add0~117_sumout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \reg2[30]~input_o\ : std_logic;
SIGNAL \reg1[30]~input_o\ : std_logic;
SIGNAL \Add0~118\ : std_logic;
SIGNAL \Add0~121_sumout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \reg1[31]~input_o\ : std_logic;
SIGNAL \reg2[31]~input_o\ : std_logic;
SIGNAL \Add0~122\ : std_logic;
SIGNAL \Add0~125_sumout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~125_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~121_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~117_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~101_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~105_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~109_sumout\ : std_logic;
SIGNAL \ALT_INV_s[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_s[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~97_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~113_sumout\ : std_logic;
SIGNAL \ALT_INV_s[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_cin~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg2[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_reg1[20]~input_o\ : std_logic;

BEGIN

ww_reg1 <= reg1;
ww_reg2 <= reg2;
ww_cin <= cin;
ww_s <= s;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
\ALT_INV_Add0~45_sumout\ <= NOT \Add0~45_sumout\;
\ALT_INV_Add0~53_sumout\ <= NOT \Add0~53_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
\ALT_INV_Add0~37_sumout\ <= NOT \Add0~37_sumout\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add0~65_sumout\ <= NOT \Add0~65_sumout\;
\ALT_INV_Add0~61_sumout\ <= NOT \Add0~61_sumout\;
\ALT_INV_Add0~29_sumout\ <= NOT \Add0~29_sumout\;
\ALT_INV_Add0~41_sumout\ <= NOT \Add0~41_sumout\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add0~33_sumout\ <= NOT \Add0~33_sumout\;
\ALT_INV_Add0~49_sumout\ <= NOT \Add0~49_sumout\;
\ALT_INV_Add0~57_sumout\ <= NOT \Add0~57_sumout\;
\ALT_INV_Add0~69_sumout\ <= NOT \Add0~69_sumout\;
\ALT_INV_Add0~73_sumout\ <= NOT \Add0~73_sumout\;
\ALT_INV_Add0~77_sumout\ <= NOT \Add0~77_sumout\;
\ALT_INV_Add0~25_sumout\ <= NOT \Add0~25_sumout\;
\ALT_INV_Add0~81_sumout\ <= NOT \Add0~81_sumout\;
\ALT_INV_Add0~21_sumout\ <= NOT \Add0~21_sumout\;
\ALT_INV_Add0~85_sumout\ <= NOT \Add0~85_sumout\;
\ALT_INV_Add0~89_sumout\ <= NOT \Add0~89_sumout\;
\ALT_INV_Add0~125_sumout\ <= NOT \Add0~125_sumout\;
\ALT_INV_Add0~121_sumout\ <= NOT \Add0~121_sumout\;
\ALT_INV_Add0~117_sumout\ <= NOT \Add0~117_sumout\;
\ALT_INV_Add0~101_sumout\ <= NOT \Add0~101_sumout\;
\ALT_INV_Add0~105_sumout\ <= NOT \Add0~105_sumout\;
\ALT_INV_Add0~109_sumout\ <= NOT \Add0~109_sumout\;
\ALT_INV_s[2]~input_o\ <= NOT \s[2]~input_o\;
\ALT_INV_s[0]~input_o\ <= NOT \s[0]~input_o\;
\ALT_INV_Add0~93_sumout\ <= NOT \Add0~93_sumout\;
\ALT_INV_Add0~97_sumout\ <= NOT \Add0~97_sumout\;
\ALT_INV_Add0~113_sumout\ <= NOT \Add0~113_sumout\;
\ALT_INV_s[1]~input_o\ <= NOT \s[1]~input_o\;
\ALT_INV_reg2[0]~input_o\ <= NOT \reg2[0]~input_o\;
\ALT_INV_reg1[0]~input_o\ <= NOT \reg1[0]~input_o\;
\ALT_INV_reg2[1]~input_o\ <= NOT \reg2[1]~input_o\;
\ALT_INV_reg1[1]~input_o\ <= NOT \reg1[1]~input_o\;
\ALT_INV_reg2[2]~input_o\ <= NOT \reg2[2]~input_o\;
\ALT_INV_reg1[2]~input_o\ <= NOT \reg1[2]~input_o\;
\ALT_INV_reg2[23]~input_o\ <= NOT \reg2[23]~input_o\;
\ALT_INV_reg1[31]~input_o\ <= NOT \reg1[31]~input_o\;
\ALT_INV_reg1[13]~input_o\ <= NOT \reg1[13]~input_o\;
\ALT_INV_reg2[7]~input_o\ <= NOT \reg2[7]~input_o\;
\ALT_INV_reg2[14]~input_o\ <= NOT \reg2[14]~input_o\;
\ALT_INV_reg1[8]~input_o\ <= NOT \reg1[8]~input_o\;
\ALT_INV_reg2[21]~input_o\ <= NOT \reg2[21]~input_o\;
\ALT_INV_reg2[25]~input_o\ <= NOT \reg2[25]~input_o\;
\ALT_INV_reg2[16]~input_o\ <= NOT \reg2[16]~input_o\;
\ALT_INV_reg1[5]~input_o\ <= NOT \reg1[5]~input_o\;
\ALT_INV_reg2[8]~input_o\ <= NOT \reg2[8]~input_o\;
\ALT_INV_reg2[10]~input_o\ <= NOT \reg2[10]~input_o\;
\ALT_INV_reg1[17]~input_o\ <= NOT \reg1[17]~input_o\;
\ALT_INV_reg2[18]~input_o\ <= NOT \reg2[18]~input_o\;
\ALT_INV_reg2[15]~input_o\ <= NOT \reg2[15]~input_o\;
\ALT_INV_reg1[22]~input_o\ <= NOT \reg1[22]~input_o\;
\ALT_INV_reg1[25]~input_o\ <= NOT \reg1[25]~input_o\;
\ALT_INV_reg1[10]~input_o\ <= NOT \reg1[10]~input_o\;
\ALT_INV_reg1[27]~input_o\ <= NOT \reg1[27]~input_o\;
\ALT_INV_reg1[11]~input_o\ <= NOT \reg1[11]~input_o\;
\ALT_INV_reg1[14]~input_o\ <= NOT \reg1[14]~input_o\;
\ALT_INV_reg1[21]~input_o\ <= NOT \reg1[21]~input_o\;
\ALT_INV_reg2[3]~input_o\ <= NOT \reg2[3]~input_o\;
\ALT_INV_reg1[23]~input_o\ <= NOT \reg1[23]~input_o\;
\ALT_INV_reg2[24]~input_o\ <= NOT \reg2[24]~input_o\;
\ALT_INV_reg1[24]~input_o\ <= NOT \reg1[24]~input_o\;
\ALT_INV_reg2[28]~input_o\ <= NOT \reg2[28]~input_o\;
\ALT_INV_reg1[28]~input_o\ <= NOT \reg1[28]~input_o\;
\ALT_INV_reg1[15]~input_o\ <= NOT \reg1[15]~input_o\;
\ALT_INV_reg1[7]~input_o\ <= NOT \reg1[7]~input_o\;
\ALT_INV_reg1[18]~input_o\ <= NOT \reg1[18]~input_o\;
\ALT_INV_reg1[9]~input_o\ <= NOT \reg1[9]~input_o\;
\ALT_INV_reg2[22]~input_o\ <= NOT \reg2[22]~input_o\;
\ALT_INV_reg1[19]~input_o\ <= NOT \reg1[19]~input_o\;
\ALT_INV_reg1[26]~input_o\ <= NOT \reg1[26]~input_o\;
\ALT_INV_reg2[29]~input_o\ <= NOT \reg2[29]~input_o\;
\ALT_INV_reg2[6]~input_o\ <= NOT \reg2[6]~input_o\;
\ALT_INV_reg1[12]~input_o\ <= NOT \reg1[12]~input_o\;
\ALT_INV_reg1[16]~input_o\ <= NOT \reg1[16]~input_o\;
\ALT_INV_reg1[29]~input_o\ <= NOT \reg1[29]~input_o\;
\ALT_INV_reg2[30]~input_o\ <= NOT \reg2[30]~input_o\;
\ALT_INV_reg2[5]~input_o\ <= NOT \reg2[5]~input_o\;
\ALT_INV_reg2[31]~input_o\ <= NOT \reg2[31]~input_o\;
\ALT_INV_reg2[26]~input_o\ <= NOT \reg2[26]~input_o\;
\ALT_INV_reg1[4]~input_o\ <= NOT \reg1[4]~input_o\;
\ALT_INV_reg1[3]~input_o\ <= NOT \reg1[3]~input_o\;
\ALT_INV_reg2[12]~input_o\ <= NOT \reg2[12]~input_o\;
\ALT_INV_cin~input_o\ <= NOT \cin~input_o\;
\ALT_INV_reg2[13]~input_o\ <= NOT \reg2[13]~input_o\;
\ALT_INV_reg2[20]~input_o\ <= NOT \reg2[20]~input_o\;
\ALT_INV_reg2[19]~input_o\ <= NOT \reg2[19]~input_o\;
\ALT_INV_reg2[9]~input_o\ <= NOT \reg2[9]~input_o\;
\ALT_INV_reg2[11]~input_o\ <= NOT \reg2[11]~input_o\;
\ALT_INV_reg2[17]~input_o\ <= NOT \reg2[17]~input_o\;
\ALT_INV_reg2[27]~input_o\ <= NOT \reg2[27]~input_o\;
\ALT_INV_reg1[30]~input_o\ <= NOT \reg1[30]~input_o\;
\ALT_INV_reg2[4]~input_o\ <= NOT \reg2[4]~input_o\;
\ALT_INV_reg1[6]~input_o\ <= NOT \reg1[6]~input_o\;
\ALT_INV_reg1[20]~input_o\ <= NOT \reg1[20]~input_o\;

-- Location: IOOBUF_X2_Y0_N76
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux31~0_combout\,
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X68_Y0_N36
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux30~0_combout\,
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X64_Y0_N19
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux29~0_combout\,
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X2_Y0_N59
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux28~0_combout\,
	devoe => ww_devoe,
	o => ww_output(3));

-- Location: IOOBUF_X72_Y0_N53
\output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux27~0_combout\,
	devoe => ww_devoe,
	o => ww_output(4));

-- Location: IOOBUF_X2_Y0_N93
\output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux26~0_combout\,
	devoe => ww_devoe,
	o => ww_output(5));

-- Location: IOOBUF_X28_Y0_N19
\output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux25~0_combout\,
	devoe => ww_devoe,
	o => ww_output(6));

-- Location: IOOBUF_X2_Y0_N42
\output[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux24~0_combout\,
	devoe => ww_devoe,
	o => ww_output(7));

-- Location: IOOBUF_X4_Y0_N53
\output[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux23~0_combout\,
	devoe => ww_devoe,
	o => ww_output(8));

-- Location: IOOBUF_X60_Y0_N2
\output[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux22~0_combout\,
	devoe => ww_devoe,
	o => ww_output(9));

-- Location: IOOBUF_X76_Y0_N19
\output[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux21~0_combout\,
	devoe => ww_devoe,
	o => ww_output(10));

-- Location: IOOBUF_X70_Y0_N2
\output[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux20~0_combout\,
	devoe => ww_devoe,
	o => ww_output(11));

-- Location: IOOBUF_X6_Y0_N53
\output[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux19~0_combout\,
	devoe => ww_devoe,
	o => ww_output(12));

-- Location: IOOBUF_X6_Y0_N36
\output[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux18~0_combout\,
	devoe => ww_devoe,
	o => ww_output(13));

-- Location: IOOBUF_X4_Y0_N2
\output[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux17~0_combout\,
	devoe => ww_devoe,
	o => ww_output(14));

-- Location: IOOBUF_X62_Y0_N36
\output[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux16~0_combout\,
	devoe => ww_devoe,
	o => ww_output(15));

-- Location: IOOBUF_X56_Y0_N36
\output[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~0_combout\,
	devoe => ww_devoe,
	o => ww_output(16));

-- Location: IOOBUF_X62_Y0_N19
\output[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux14~0_combout\,
	devoe => ww_devoe,
	o => ww_output(17));

-- Location: IOOBUF_X64_Y0_N36
\output[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux13~0_combout\,
	devoe => ww_devoe,
	o => ww_output(18));

-- Location: IOOBUF_X58_Y0_N59
\output[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux12~0_combout\,
	devoe => ww_devoe,
	o => ww_output(19));

-- Location: IOOBUF_X54_Y0_N2
\output[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~0_combout\,
	devoe => ww_devoe,
	o => ww_output(20));

-- Location: IOOBUF_X68_Y0_N53
\output[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_output(21));

-- Location: IOOBUF_X54_Y0_N53
\output[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~0_combout\,
	devoe => ww_devoe,
	o => ww_output(22));

-- Location: IOOBUF_X8_Y0_N53
\output[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_output(23));

-- Location: IOOBUF_X52_Y0_N36
\output[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_output(24));

-- Location: IOOBUF_X68_Y0_N2
\output[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_output(25));

-- Location: IOOBUF_X52_Y0_N19
\output[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_output(26));

-- Location: IOOBUF_X58_Y0_N42
\output[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_output(27));

-- Location: IOOBUF_X66_Y0_N42
\output[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_output(28));

-- Location: IOOBUF_X56_Y0_N19
\output[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_output(29));

-- Location: IOOBUF_X54_Y0_N36
\output[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_output(30));

-- Location: IOOBUF_X66_Y0_N59
\output[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_output(31));

-- Location: IOIBUF_X34_Y0_N58
\s[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(0),
	o => \s[0]~input_o\);

-- Location: IOIBUF_X26_Y0_N75
\reg2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(0),
	o => \reg2[0]~input_o\);

-- Location: IOIBUF_X34_Y0_N92
\s[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(2),
	o => \s[2]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\s[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(1),
	o => \s[1]~input_o\);

-- Location: IOIBUF_X6_Y0_N18
\reg1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(0),
	o => \reg1[0]~input_o\);

-- Location: IOIBUF_X76_Y0_N52
\cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: LABCELL_X35_Y2_N0
\Add0~130\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~130_cout\ = CARRY(( (\cin~input_o\) # (\s[0]~input_o\) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_cin~input_o\,
	cin => GND,
	cout => \Add0~130_cout\);

-- Location: LABCELL_X35_Y2_N3
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \reg1[0]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[0]~input_o\) ) + ( \Add0~130_cout\ ))
-- \Add0~2\ = CARRY(( \reg1[0]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[0]~input_o\) ) + ( \Add0~130_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[0]~input_o\,
	dataf => \ALT_INV_reg2[0]~input_o\,
	cin => \Add0~130_cout\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: MLABCELL_X34_Y2_N0
\Mux31~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux31~0_combout\ = ( \Add0~1_sumout\ & ( \reg1[0]~input_o\ & ( (!\reg2[0]~input_o\ & ((!\s[0]~input_o\ & ((!\s[1]~input_o\))) # (\s[0]~input_o\ & ((\s[1]~input_o\) # (\s[2]~input_o\))))) # (\reg2[0]~input_o\ & (((!\s[2]~input_o\) # (!\s[1]~input_o\)))) ) 
-- ) ) # ( !\Add0~1_sumout\ & ( \reg1[0]~input_o\ & ( (!\reg2[0]~input_o\ & ((!\s[0]~input_o\ & (!\s[2]~input_o\ & !\s[1]~input_o\)) # (\s[0]~input_o\ & ((\s[1]~input_o\))))) # (\reg2[0]~input_o\ & (((!\s[2]~input_o\)))) ) ) ) # ( \Add0~1_sumout\ & ( 
-- !\reg1[0]~input_o\ & ( (!\s[0]~input_o\ & (((\s[2]~input_o\)))) # (\s[0]~input_o\ & ((!\reg2[0]~input_o\ & (\s[2]~input_o\)) # (\reg2[0]~input_o\ & ((!\s[2]~input_o\) # (!\s[1]~input_o\))))) ) ) ) # ( !\Add0~1_sumout\ & ( !\reg1[0]~input_o\ & ( 
-- (!\s[2]~input_o\ & (\s[0]~input_o\ & (\reg2[0]~input_o\))) # (\s[2]~input_o\ & (\s[1]~input_o\ & ((!\s[0]~input_o\) # (!\reg2[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000011110000111110001111010110000011101001011111101110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_reg2[0]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_Add0~1_sumout\,
	dataf => \ALT_INV_reg1[0]~input_o\,
	combout => \Mux31~0_combout\);

-- Location: IOIBUF_X50_Y0_N58
\reg2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(1),
	o => \reg2[1]~input_o\);

-- Location: IOIBUF_X72_Y0_N35
\reg1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(1),
	o => \reg1[1]~input_o\);

-- Location: LABCELL_X35_Y2_N6
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[1]~input_o\) ) + ( \reg1[1]~input_o\ ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[1]~input_o\) ) + ( \reg1[1]~input_o\ ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg2[1]~input_o\,
	dataf => \ALT_INV_reg1[1]~input_o\,
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: LABCELL_X36_Y2_N30
\Mux30~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux30~0_combout\ = ( \reg2[1]~input_o\ & ( \reg1[1]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~5_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\reg2[1]~input_o\ & ( \reg1[1]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((!\s[0]~input_o\))) # 
-- (\s[2]~input_o\ & (\Add0~5_sumout\)))) # (\s[1]~input_o\ & (((\s[0]~input_o\)))) ) ) ) # ( \reg2[1]~input_o\ & ( !\reg1[1]~input_o\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~5_sumout\)) # (\s[1]~input_o\ & 
-- ((!\s[0]~input_o\))))) ) ) ) # ( !\reg2[1]~input_o\ & ( !\reg1[1]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~5_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001111111010011000100001101111111010011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~5_sumout\,
	datab => \ALT_INV_s[1]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[0]~input_o\,
	datae => \ALT_INV_reg2[1]~input_o\,
	dataf => \ALT_INV_reg1[1]~input_o\,
	combout => \Mux30~0_combout\);

-- Location: IOIBUF_X54_Y0_N18
\reg2[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(2),
	o => \reg2[2]~input_o\);

-- Location: IOIBUF_X60_Y0_N35
\reg1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(2),
	o => \reg1[2]~input_o\);

-- Location: LABCELL_X35_Y2_N9
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[2]~input_o\) ) + ( \reg1[2]~input_o\ ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[2]~input_o\) ) + ( \reg1[2]~input_o\ ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[2]~input_o\,
	dataf => \ALT_INV_reg1[2]~input_o\,
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X36_Y2_N6
\Mux29~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux29~0_combout\ = ( \reg1[2]~input_o\ & ( \s[0]~input_o\ & ( (!\s[2]~input_o\ & (((\s[1]~input_o\)) # (\reg2[2]~input_o\))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & ((\Add0~9_sumout\))) # (\s[1]~input_o\ & (!\reg2[2]~input_o\)))) ) ) ) # ( 
-- !\reg1[2]~input_o\ & ( \s[0]~input_o\ & ( (!\s[2]~input_o\ & (\reg2[2]~input_o\)) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & ((\Add0~9_sumout\))) # (\s[1]~input_o\ & (!\reg2[2]~input_o\)))) ) ) ) # ( \reg1[2]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[2]~input_o\ 
-- & (((!\s[1]~input_o\)) # (\reg2[2]~input_o\))) # (\s[2]~input_o\ & (((\Add0~9_sumout\ & !\s[1]~input_o\)))) ) ) ) # ( !\reg1[2]~input_o\ & ( !\s[0]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~9_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100001111111100110101000001010011010110100101001111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg2[2]~input_o\,
	datab => \ALT_INV_Add0~9_sumout\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_reg1[2]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux29~0_combout\);

-- Location: IOIBUF_X64_Y0_N52
\reg1[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(3),
	o => \reg1[3]~input_o\);

-- Location: IOIBUF_X28_Y0_N35
\reg2[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(3),
	o => \reg2[3]~input_o\);

-- Location: LABCELL_X35_Y2_N12
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[3]~input_o\) ) + ( \reg1[3]~input_o\ ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[3]~input_o\) ) + ( \reg1[3]~input_o\ ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[3]~input_o\,
	datad => \ALT_INV_reg2[3]~input_o\,
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: MLABCELL_X34_Y2_N36
\Mux28~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux28~0_combout\ = ( \s[0]~input_o\ & ( \reg1[3]~input_o\ & ( (!\s[2]~input_o\ & (((\s[1]~input_o\) # (\reg2[3]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~13_sumout\)) # (\s[1]~input_o\ & ((!\reg2[3]~input_o\))))) ) ) ) # ( 
-- !\s[0]~input_o\ & ( \reg1[3]~input_o\ & ( (!\s[2]~input_o\ & (((!\s[1]~input_o\) # (\reg2[3]~input_o\)))) # (\s[2]~input_o\ & (\Add0~13_sumout\ & ((!\s[1]~input_o\)))) ) ) ) # ( \s[0]~input_o\ & ( !\reg1[3]~input_o\ & ( (!\s[2]~input_o\ & 
-- (((\reg2[3]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~13_sumout\)) # (\s[1]~input_o\ & ((!\reg2[3]~input_o\))))) ) ) ) # ( !\s[0]~input_o\ & ( !\reg1[3]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~13_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001111001101010011110011110101001100000011010111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~13_sumout\,
	datab => \ALT_INV_reg2[3]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_reg1[3]~input_o\,
	combout => \Mux28~0_combout\);

-- Location: IOIBUF_X74_Y0_N41
\reg2[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(4),
	o => \reg2[4]~input_o\);

-- Location: IOIBUF_X64_Y0_N1
\reg1[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(4),
	o => \reg1[4]~input_o\);

-- Location: LABCELL_X35_Y2_N15
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[4]~input_o\) ) + ( \reg1[4]~input_o\ ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[4]~input_o\) ) + ( \reg1[4]~input_o\ ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[4]~input_o\,
	datad => \ALT_INV_reg2[4]~input_o\,
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: LABCELL_X36_Y2_N42
\Mux27~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux27~0_combout\ = ( \s[2]~input_o\ & ( \s[0]~input_o\ & ( (!\s[1]~input_o\ & ((\Add0~17_sumout\))) # (\s[1]~input_o\ & (!\reg2[4]~input_o\)) ) ) ) # ( !\s[2]~input_o\ & ( \s[0]~input_o\ & ( ((\reg1[4]~input_o\ & \s[1]~input_o\)) # (\reg2[4]~input_o\) ) 
-- ) ) # ( \s[2]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~17_sumout\)) # (\s[1]~input_o\ & ((!\reg1[4]~input_o\))) ) ) ) # ( !\s[2]~input_o\ & ( !\s[0]~input_o\ & ( (\reg1[4]~input_o\ & ((!\s[1]~input_o\) # (\reg2[4]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000101001100111111000001010101010111110011001110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg2[4]~input_o\,
	datab => \ALT_INV_Add0~17_sumout\,
	datac => \ALT_INV_reg1[4]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_s[2]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux27~0_combout\);

-- Location: IOIBUF_X34_Y0_N75
\reg1[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(5),
	o => \reg1[5]~input_o\);

-- Location: IOIBUF_X30_Y0_N18
\reg2[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(5),
	o => \reg2[5]~input_o\);

-- Location: LABCELL_X35_Y2_N18
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \reg1[5]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[5]~input_o\) ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( \reg1[5]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[5]~input_o\) ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101001011010010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[5]~input_o\,
	datad => \ALT_INV_reg1[5]~input_o\,
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: MLABCELL_X34_Y2_N42
\Mux26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux26~0_combout\ = ( \s[1]~input_o\ & ( \s[0]~input_o\ & ( (!\s[2]~input_o\ & ((\reg2[5]~input_o\) # (\reg1[5]~input_o\))) # (\s[2]~input_o\ & ((!\reg2[5]~input_o\))) ) ) ) # ( !\s[1]~input_o\ & ( \s[0]~input_o\ & ( (!\s[2]~input_o\ & 
-- (\reg2[5]~input_o\)) # (\s[2]~input_o\ & ((\Add0~21_sumout\))) ) ) ) # ( \s[1]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[2]~input_o\ & (\reg1[5]~input_o\ & \reg2[5]~input_o\)) # (\s[2]~input_o\ & (!\reg1[5]~input_o\)) ) ) ) # ( !\s[1]~input_o\ & ( 
-- !\s[0]~input_o\ & ( (!\s[2]~input_o\ & (\reg1[5]~input_o\)) # (\s[2]~input_o\ & ((\Add0~21_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001110111010001100100011000001010010111110111101001111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[2]~input_o\,
	datab => \ALT_INV_reg1[5]~input_o\,
	datac => \ALT_INV_reg2[5]~input_o\,
	datad => \ALT_INV_Add0~21_sumout\,
	datae => \ALT_INV_s[1]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux26~0_combout\);

-- Location: IOIBUF_X32_Y0_N35
\reg2[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(6),
	o => \reg2[6]~input_o\);

-- Location: IOIBUF_X8_Y0_N1
\reg1[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(6),
	o => \reg1[6]~input_o\);

-- Location: LABCELL_X35_Y2_N21
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[6]~input_o\) ) + ( \reg1[6]~input_o\ ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[6]~input_o\) ) + ( \reg1[6]~input_o\ ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg2[6]~input_o\,
	dataf => \ALT_INV_reg1[6]~input_o\,
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: MLABCELL_X34_Y2_N48
\Mux25~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux25~0_combout\ = ( \s[1]~input_o\ & ( \reg1[6]~input_o\ & ( (!\reg2[6]~input_o\ & ((\s[0]~input_o\))) # (\reg2[6]~input_o\ & (!\s[2]~input_o\)) ) ) ) # ( !\s[1]~input_o\ & ( \reg1[6]~input_o\ & ( (!\s[2]~input_o\ & (((!\s[0]~input_o\)) # 
-- (\reg2[6]~input_o\))) # (\s[2]~input_o\ & (((\Add0~25_sumout\)))) ) ) ) # ( \s[1]~input_o\ & ( !\reg1[6]~input_o\ & ( !\s[2]~input_o\ $ (((!\reg2[6]~input_o\) # (!\s[0]~input_o\))) ) ) ) # ( !\s[1]~input_o\ & ( !\reg1[6]~input_o\ & ( (!\s[2]~input_o\ & 
-- (\reg2[6]~input_o\ & (\s[0]~input_o\))) # (\s[2]~input_o\ & (((\Add0~25_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001001010111010101100101011010100010111101110010111000101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[2]~input_o\,
	datab => \ALT_INV_reg2[6]~input_o\,
	datac => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_Add0~25_sumout\,
	datae => \ALT_INV_s[1]~input_o\,
	dataf => \ALT_INV_reg1[6]~input_o\,
	combout => \Mux25~0_combout\);

-- Location: IOIBUF_X62_Y0_N1
\reg2[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(7),
	o => \reg2[7]~input_o\);

-- Location: IOIBUF_X30_Y0_N35
\reg1[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(7),
	o => \reg1[7]~input_o\);

-- Location: LABCELL_X35_Y2_N24
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[7]~input_o\) ) + ( \reg1[7]~input_o\ ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[7]~input_o\) ) + ( \reg1[7]~input_o\ ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg2[7]~input_o\,
	dataf => \ALT_INV_reg1[7]~input_o\,
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: MLABCELL_X34_Y2_N24
\Mux24~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = ( \s[1]~input_o\ & ( \reg1[7]~input_o\ & ( (!\reg2[7]~input_o\ & (\s[0]~input_o\)) # (\reg2[7]~input_o\ & ((!\s[2]~input_o\))) ) ) ) # ( !\s[1]~input_o\ & ( \reg1[7]~input_o\ & ( (!\s[2]~input_o\ & ((!\s[0]~input_o\) # 
-- ((\reg2[7]~input_o\)))) # (\s[2]~input_o\ & (((\Add0~29_sumout\)))) ) ) ) # ( \s[1]~input_o\ & ( !\reg1[7]~input_o\ & ( !\s[2]~input_o\ $ (((!\s[0]~input_o\) # (!\reg2[7]~input_o\))) ) ) ) # ( !\s[1]~input_o\ & ( !\reg1[7]~input_o\ & ( (!\s[2]~input_o\ & 
-- (\s[0]~input_o\ & (\reg2[7]~input_o\))) # (\s[2]~input_o\ & (((\Add0~29_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000011111000111100001111010110000101111110111010001110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_reg2[7]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_Add0~29_sumout\,
	datae => \ALT_INV_s[1]~input_o\,
	dataf => \ALT_INV_reg1[7]~input_o\,
	combout => \Mux24~0_combout\);

-- Location: IOIBUF_X62_Y0_N52
\reg2[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(8),
	o => \reg2[8]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\reg1[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(8),
	o => \reg1[8]~input_o\);

-- Location: LABCELL_X35_Y2_N27
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[8]~input_o\) ) + ( \reg1[8]~input_o\ ) + ( \Add0~30\ ))
-- \Add0~34\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[8]~input_o\) ) + ( \reg1[8]~input_o\ ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg2[8]~input_o\,
	dataf => \ALT_INV_reg1[8]~input_o\,
	cin => \Add0~30\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: MLABCELL_X34_Y2_N30
\Mux23~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux23~0_combout\ = ( \reg1[8]~input_o\ & ( \reg2[8]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~33_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\reg1[8]~input_o\ & ( \reg2[8]~input_o\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\)))) # (\s[2]~input_o\ & 
-- ((!\s[1]~input_o\ & (\Add0~33_sumout\)) # (\s[1]~input_o\ & ((!\s[0]~input_o\))))) ) ) ) # ( \reg1[8]~input_o\ & ( !\reg2[8]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((!\s[0]~input_o\))) # (\s[2]~input_o\ & (\Add0~33_sumout\)))) # 
-- (\s[1]~input_o\ & (((\s[0]~input_o\)))) ) ) ) # ( !\reg1[8]~input_o\ & ( !\reg2[8]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~33_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000101010101101100010000111100011011010110101011101110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[2]~input_o\,
	datab => \ALT_INV_Add0~33_sumout\,
	datac => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_reg1[8]~input_o\,
	dataf => \ALT_INV_reg2[8]~input_o\,
	combout => \Mux23~0_combout\);

-- Location: IOIBUF_X70_Y0_N18
\reg1[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(9),
	o => \reg1[9]~input_o\);

-- Location: IOIBUF_X6_Y0_N1
\reg2[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(9),
	o => \reg2[9]~input_o\);

-- Location: LABCELL_X35_Y2_N30
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[9]~input_o\) ) + ( \reg1[9]~input_o\ ) + ( \Add0~34\ ))
-- \Add0~38\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[9]~input_o\) ) + ( \reg1[9]~input_o\ ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[9]~input_o\,
	dataf => \ALT_INV_reg1[9]~input_o\,
	cin => \Add0~34\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: LABCELL_X36_Y2_N48
\Mux22~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux22~0_combout\ = ( \s[2]~input_o\ & ( \s[0]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~37_sumout\)) # (\s[1]~input_o\ & ((!\reg2[9]~input_o\))) ) ) ) # ( !\s[2]~input_o\ & ( \s[0]~input_o\ & ( ((\reg1[9]~input_o\ & \s[1]~input_o\)) # (\reg2[9]~input_o\) ) 
-- ) ) # ( \s[2]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[1]~input_o\ & ((\Add0~37_sumout\))) # (\s[1]~input_o\ & (!\reg1[9]~input_o\)) ) ) ) # ( !\s[2]~input_o\ & ( !\s[0]~input_o\ & ( (\reg1[9]~input_o\ & ((!\s[1]~input_o\) # (\reg2[9]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000101001100111010101000001111010111110011001111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg1[9]~input_o\,
	datab => \ALT_INV_Add0~37_sumout\,
	datac => \ALT_INV_reg2[9]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_s[2]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux22~0_combout\);

-- Location: IOIBUF_X70_Y0_N35
\reg1[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(10),
	o => \reg1[10]~input_o\);

-- Location: IOIBUF_X50_Y0_N92
\reg2[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(10),
	o => \reg2[10]~input_o\);

-- Location: LABCELL_X35_Y2_N33
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[10]~input_o\) ) + ( \reg1[10]~input_o\ ) + ( \Add0~38\ ))
-- \Add0~42\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[10]~input_o\) ) + ( \reg1[10]~input_o\ ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg2[10]~input_o\,
	dataf => \ALT_INV_reg1[10]~input_o\,
	cin => \Add0~38\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: LABCELL_X36_Y2_N54
\Mux21~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux21~0_combout\ = ( \s[2]~input_o\ & ( \s[0]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~41_sumout\)) # (\s[1]~input_o\ & ((!\reg2[10]~input_o\))) ) ) ) # ( !\s[2]~input_o\ & ( \s[0]~input_o\ & ( ((\reg1[10]~input_o\ & \s[1]~input_o\)) # (\reg2[10]~input_o\) 
-- ) ) ) # ( \s[2]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[1]~input_o\ & ((\Add0~41_sumout\))) # (\s[1]~input_o\ & (!\reg1[10]~input_o\)) ) ) ) # ( !\s[2]~input_o\ & ( !\s[0]~input_o\ & ( (\reg1[10]~input_o\ & ((!\s[1]~input_o\) # (\reg2[10]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000101001100111010101000001111010111110011001111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg1[10]~input_o\,
	datab => \ALT_INV_Add0~41_sumout\,
	datac => \ALT_INV_reg2[10]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_s[2]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux21~0_combout\);

-- Location: IOIBUF_X52_Y0_N1
\reg1[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(11),
	o => \reg1[11]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\reg2[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(11),
	o => \reg2[11]~input_o\);

-- Location: LABCELL_X35_Y2_N36
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[11]~input_o\) ) + ( \reg1[11]~input_o\ ) + ( \Add0~42\ ))
-- \Add0~46\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[11]~input_o\) ) + ( \reg1[11]~input_o\ ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[11]~input_o\,
	datad => \ALT_INV_reg2[11]~input_o\,
	cin => \Add0~42\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: LABCELL_X36_Y2_N0
\Mux20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux20~0_combout\ = ( \Add0~45_sumout\ & ( \reg2[11]~input_o\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\)) # (\reg1[11]~input_o\))) # (\s[2]~input_o\ & ((!\s[1]~input_o\) # ((!\reg1[11]~input_o\ & !\s[0]~input_o\)))) ) ) ) # ( !\Add0~45_sumout\ & ( 
-- \reg2[11]~input_o\ & ( (!\reg1[11]~input_o\ & ((!\s[0]~input_o\ & (\s[2]~input_o\ & \s[1]~input_o\)) # (\s[0]~input_o\ & (!\s[2]~input_o\)))) # (\reg1[11]~input_o\ & (((!\s[2]~input_o\)))) ) ) ) # ( \Add0~45_sumout\ & ( !\reg2[11]~input_o\ & ( 
-- (!\reg1[11]~input_o\ & (((\s[2]~input_o\)))) # (\reg1[11]~input_o\ & ((!\s[0]~input_o\ & ((!\s[1]~input_o\))) # (\s[0]~input_o\ & ((\s[1]~input_o\) # (\s[2]~input_o\))))) ) ) ) # ( !\Add0~45_sumout\ & ( !\reg2[11]~input_o\ & ( (!\reg1[11]~input_o\ & 
-- (((\s[2]~input_o\ & \s[1]~input_o\)))) # (\reg1[11]~input_o\ & ((!\s[0]~input_o\ & (!\s[2]~input_o\ & !\s[1]~input_o\)) # (\s[0]~input_o\ & ((\s[1]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000011011010011110001101101110000011110000111111101111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg1[11]~input_o\,
	datab => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_Add0~45_sumout\,
	dataf => \ALT_INV_reg2[11]~input_o\,
	combout => \Mux20~0_combout\);

-- Location: IOIBUF_X30_Y0_N52
\reg2[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(12),
	o => \reg2[12]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\reg1[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(12),
	o => \reg1[12]~input_o\);

-- Location: LABCELL_X35_Y2_N39
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( \reg1[12]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[12]~input_o\) ) + ( \Add0~46\ ))
-- \Add0~50\ = CARRY(( \reg1[12]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[12]~input_o\) ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[12]~input_o\,
	dataf => \ALT_INV_reg2[12]~input_o\,
	cin => \Add0~46\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: MLABCELL_X34_Y2_N6
\Mux19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = ( \s[0]~input_o\ & ( \Add0~49_sumout\ & ( (!\s[2]~input_o\ & (((\reg1[12]~input_o\ & \s[1]~input_o\)) # (\reg2[12]~input_o\))) # (\s[2]~input_o\ & ((!\reg2[12]~input_o\) # ((!\s[1]~input_o\)))) ) ) ) # ( !\s[0]~input_o\ & ( 
-- \Add0~49_sumout\ & ( (!\reg1[12]~input_o\ & (\s[2]~input_o\)) # (\reg1[12]~input_o\ & ((!\s[1]~input_o\) # ((!\s[2]~input_o\ & \reg2[12]~input_o\)))) ) ) ) # ( \s[0]~input_o\ & ( !\Add0~49_sumout\ & ( (!\reg2[12]~input_o\ & (\s[1]~input_o\ & 
-- ((\reg1[12]~input_o\) # (\s[2]~input_o\)))) # (\reg2[12]~input_o\ & (!\s[2]~input_o\)) ) ) ) # ( !\s[0]~input_o\ & ( !\Add0~49_sumout\ & ( (!\s[2]~input_o\ & (\reg1[12]~input_o\ & ((!\s[1]~input_o\) # (\reg2[12]~input_o\)))) # (\s[2]~input_o\ & 
-- (((!\reg1[12]~input_o\ & \s[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001010010001000100110111001011111010100100111011101101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[2]~input_o\,
	datab => \ALT_INV_reg2[12]~input_o\,
	datac => \ALT_INV_reg1[12]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_Add0~49_sumout\,
	combout => \Mux19~0_combout\);

-- Location: IOIBUF_X34_Y0_N41
\reg2[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(13),
	o => \reg2[13]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\reg1[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(13),
	o => \reg1[13]~input_o\);

-- Location: LABCELL_X35_Y2_N42
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[13]~input_o\) ) + ( \reg1[13]~input_o\ ) + ( \Add0~50\ ))
-- \Add0~54\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[13]~input_o\) ) + ( \reg1[13]~input_o\ ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[13]~input_o\,
	dataf => \ALT_INV_reg1[13]~input_o\,
	cin => \Add0~50\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: MLABCELL_X34_Y2_N12
\Mux18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = ( \s[0]~input_o\ & ( \reg1[13]~input_o\ & ( (!\s[2]~input_o\ & (((\s[1]~input_o\)) # (\reg2[13]~input_o\))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & ((\Add0~53_sumout\))) # (\s[1]~input_o\ & (!\reg2[13]~input_o\)))) ) ) ) # ( 
-- !\s[0]~input_o\ & ( \reg1[13]~input_o\ & ( (!\s[2]~input_o\ & (((!\s[1]~input_o\)) # (\reg2[13]~input_o\))) # (\s[2]~input_o\ & (((\Add0~53_sumout\ & !\s[1]~input_o\)))) ) ) ) # ( \s[0]~input_o\ & ( !\reg1[13]~input_o\ & ( (!\s[2]~input_o\ & 
-- (\reg2[13]~input_o\)) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & ((\Add0~53_sumout\))) # (\s[1]~input_o\ & (!\reg2[13]~input_o\)))) ) ) ) # ( !\s[0]~input_o\ & ( !\reg1[13]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~53_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100001111010100110101101011110011010100000101001111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg2[13]~input_o\,
	datab => \ALT_INV_Add0~53_sumout\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_reg1[13]~input_o\,
	combout => \Mux18~0_combout\);

-- Location: IOIBUF_X26_Y0_N41
\reg1[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(14),
	o => \reg1[14]~input_o\);

-- Location: IOIBUF_X8_Y0_N18
\reg2[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(14),
	o => \reg2[14]~input_o\);

-- Location: LABCELL_X35_Y2_N45
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( \reg1[14]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[14]~input_o\) ) + ( \Add0~54\ ))
-- \Add0~58\ = CARRY(( \reg1[14]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[14]~input_o\) ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg1[14]~input_o\,
	dataf => \ALT_INV_reg2[14]~input_o\,
	cin => \Add0~54\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: MLABCELL_X34_Y2_N18
\Mux17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = ( \reg2[14]~input_o\ & ( \Add0~57_sumout\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\)) # (\reg1[14]~input_o\))) # (\s[2]~input_o\ & ((!\s[1]~input_o\) # ((!\reg1[14]~input_o\ & !\s[0]~input_o\)))) ) ) ) # ( !\reg2[14]~input_o\ & ( 
-- \Add0~57_sumout\ & ( (!\reg1[14]~input_o\ & (\s[2]~input_o\)) # (\reg1[14]~input_o\ & ((!\s[0]~input_o\ & ((!\s[1]~input_o\))) # (\s[0]~input_o\ & ((\s[1]~input_o\) # (\s[2]~input_o\))))) ) ) ) # ( \reg2[14]~input_o\ & ( !\Add0~57_sumout\ & ( 
-- (!\s[2]~input_o\ & (((\s[0]~input_o\)) # (\reg1[14]~input_o\))) # (\s[2]~input_o\ & (!\reg1[14]~input_o\ & (!\s[0]~input_o\ & \s[1]~input_o\))) ) ) ) # ( !\reg2[14]~input_o\ & ( !\Add0~57_sumout\ & ( (!\s[2]~input_o\ & (\reg1[14]~input_o\ & 
-- (!\s[0]~input_o\ $ (\s[1]~input_o\)))) # (\s[2]~input_o\ & (\s[1]~input_o\ & ((!\reg1[14]~input_o\) # (\s[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000001000111001010100110101001110101010001110111111101101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[2]~input_o\,
	datab => \ALT_INV_reg1[14]~input_o\,
	datac => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_reg2[14]~input_o\,
	dataf => \ALT_INV_Add0~57_sumout\,
	combout => \Mux17~0_combout\);

-- Location: IOIBUF_X28_Y0_N52
\reg1[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(15),
	o => \reg1[15]~input_o\);

-- Location: IOIBUF_X26_Y0_N58
\reg2[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(15),
	o => \reg2[15]~input_o\);

-- Location: LABCELL_X35_Y2_N48
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( \reg1[15]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[15]~input_o\) ) + ( \Add0~58\ ))
-- \Add0~62\ = CARRY(( \reg1[15]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[15]~input_o\) ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101001011010010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[15]~input_o\,
	datad => \ALT_INV_reg1[15]~input_o\,
	cin => \Add0~58\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: MLABCELL_X34_Y2_N54
\Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = ( \s[0]~input_o\ & ( \reg2[15]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~61_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\s[0]~input_o\ & ( \reg2[15]~input_o\ & ( (!\s[2]~input_o\ & (\reg1[15]~input_o\)) # (\s[2]~input_o\ & ((!\s[1]~input_o\ 
-- & ((\Add0~61_sumout\))) # (\s[1]~input_o\ & (!\reg1[15]~input_o\)))) ) ) ) # ( \s[0]~input_o\ & ( !\reg2[15]~input_o\ & ( (!\s[2]~input_o\ & (\reg1[15]~input_o\ & ((\s[1]~input_o\)))) # (\s[2]~input_o\ & (((\s[1]~input_o\) # (\Add0~61_sumout\)))) ) ) ) # 
-- ( !\s[0]~input_o\ & ( !\reg2[15]~input_o\ & ( (!\s[2]~input_o\ & (\reg1[15]~input_o\ & ((!\s[1]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & ((\Add0~61_sumout\))) # (\s[1]~input_o\ & (!\reg1[15]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001100001010000000110101111101010011010110101111001111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg1[15]~input_o\,
	datab => \ALT_INV_Add0~61_sumout\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_reg2[15]~input_o\,
	combout => \Mux16~0_combout\);

-- Location: IOIBUF_X78_Y0_N52
\reg2[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(16),
	o => \reg2[16]~input_o\);

-- Location: IOIBUF_X74_Y0_N58
\reg1[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(16),
	o => \reg1[16]~input_o\);

-- Location: LABCELL_X35_Y2_N51
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( \reg1[16]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[16]~input_o\) ) + ( \Add0~62\ ))
-- \Add0~66\ = CARRY(( \reg1[16]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[16]~input_o\) ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101001011010010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[16]~input_o\,
	datad => \ALT_INV_reg1[16]~input_o\,
	cin => \Add0~62\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: LABCELL_X36_Y2_N36
\Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = ( \s[2]~input_o\ & ( \s[0]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~65_sumout\)) # (\s[1]~input_o\ & ((!\reg2[16]~input_o\))) ) ) ) # ( !\s[2]~input_o\ & ( \s[0]~input_o\ & ( ((\s[1]~input_o\ & \reg1[16]~input_o\)) # (\reg2[16]~input_o\) 
-- ) ) ) # ( \s[2]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~65_sumout\)) # (\s[1]~input_o\ & ((!\reg1[16]~input_o\))) ) ) ) # ( !\s[2]~input_o\ & ( !\s[0]~input_o\ & ( (\reg1[16]~input_o\ & ((!\s[1]~input_o\) # (\reg2[16]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001111011101110100010000001111001111110111010001110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~65_sumout\,
	datab => \ALT_INV_s[1]~input_o\,
	datac => \ALT_INV_reg2[16]~input_o\,
	datad => \ALT_INV_reg1[16]~input_o\,
	datae => \ALT_INV_s[2]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: IOIBUF_X52_Y0_N52
\reg1[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(17),
	o => \reg1[17]~input_o\);

-- Location: IOIBUF_X74_Y0_N75
\reg2[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(17),
	o => \reg2[17]~input_o\);

-- Location: LABCELL_X35_Y2_N54
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[17]~input_o\) ) + ( \reg1[17]~input_o\ ) + ( \Add0~66\ ))
-- \Add0~70\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[17]~input_o\) ) + ( \reg1[17]~input_o\ ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_reg1[17]~input_o\,
	datad => \ALT_INV_reg2[17]~input_o\,
	cin => \Add0~66\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: LABCELL_X36_Y2_N12
\Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = ( \reg2[17]~input_o\ & ( \s[0]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~69_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\reg2[17]~input_o\ & ( \s[0]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~69_sumout\ & (\s[2]~input_o\))) # (\s[1]~input_o\ & 
-- (((\reg1[17]~input_o\) # (\s[2]~input_o\)))) ) ) ) # ( \reg2[17]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[2]~input_o\ & (((\reg1[17]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~69_sumout\)) # (\s[1]~input_o\ & ((!\reg1[17]~input_o\))))) ) ) ) 
-- # ( !\reg2[17]~input_o\ & ( !\s[0]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((\reg1[17]~input_o\))) # (\s[2]~input_o\ & (\Add0~69_sumout\)))) # (\s[1]~input_o\ & (((\s[2]~input_o\ & !\reg1[17]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011111000100000001111111010000000111001101111111010011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~69_sumout\,
	datab => \ALT_INV_s[1]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_reg1[17]~input_o\,
	datae => \ALT_INV_reg2[17]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux14~0_combout\);

-- Location: IOIBUF_X40_Y0_N1
\reg1[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(18),
	o => \reg1[18]~input_o\);

-- Location: IOIBUF_X60_Y0_N18
\reg2[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(18),
	o => \reg2[18]~input_o\);

-- Location: LABCELL_X35_Y2_N57
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( \reg1[18]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[18]~input_o\) ) + ( \Add0~70\ ))
-- \Add0~74\ = CARRY(( \reg1[18]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[18]~input_o\) ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[18]~input_o\,
	dataf => \ALT_INV_reg2[18]~input_o\,
	cin => \Add0~70\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: LABCELL_X36_Y2_N18
\Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = ( \Add0~73_sumout\ & ( \s[0]~input_o\ & ( (!\reg2[18]~input_o\ & (((\reg1[18]~input_o\ & \s[1]~input_o\)) # (\s[2]~input_o\))) # (\reg2[18]~input_o\ & (((!\s[2]~input_o\) # (!\s[1]~input_o\)))) ) ) ) # ( !\Add0~73_sumout\ & ( 
-- \s[0]~input_o\ & ( (!\reg2[18]~input_o\ & (\s[1]~input_o\ & ((\s[2]~input_o\) # (\reg1[18]~input_o\)))) # (\reg2[18]~input_o\ & (((!\s[2]~input_o\)))) ) ) ) # ( \Add0~73_sumout\ & ( !\s[0]~input_o\ & ( (!\reg1[18]~input_o\ & (((\s[2]~input_o\)))) # 
-- (\reg1[18]~input_o\ & ((!\s[1]~input_o\) # ((\reg2[18]~input_o\ & !\s[2]~input_o\)))) ) ) ) # ( !\Add0~73_sumout\ & ( !\s[0]~input_o\ & ( (!\reg1[18]~input_o\ & (((\s[2]~input_o\ & \s[1]~input_o\)))) # (\reg1[18]~input_o\ & (!\s[2]~input_o\ & 
-- ((!\s[1]~input_o\) # (\reg2[18]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000011010010111110001101000110000011111000011111101111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg1[18]~input_o\,
	datab => \ALT_INV_reg2[18]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_Add0~73_sumout\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \Mux13~0_combout\);

-- Location: IOIBUF_X56_Y0_N52
\reg2[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(19),
	o => \reg2[19]~input_o\);

-- Location: IOIBUF_X40_Y0_N35
\reg1[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(19),
	o => \reg1[19]~input_o\);

-- Location: LABCELL_X35_Y1_N0
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[19]~input_o\) ) + ( \reg1[19]~input_o\ ) + ( \Add0~74\ ))
-- \Add0~78\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[19]~input_o\) ) + ( \reg1[19]~input_o\ ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg2[19]~input_o\,
	dataf => \ALT_INV_reg1[19]~input_o\,
	cin => \Add0~74\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: LABCELL_X36_Y1_N0
\Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = ( \Add0~77_sumout\ & ( \reg1[19]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[0]~input_o\) # ((\reg2[19]~input_o\) # (\s[2]~input_o\)))) # (\s[1]~input_o\ & ((!\reg2[19]~input_o\ & (\s[0]~input_o\)) # (\reg2[19]~input_o\ & 
-- ((!\s[2]~input_o\))))) ) ) ) # ( !\Add0~77_sumout\ & ( \reg1[19]~input_o\ & ( (!\reg2[19]~input_o\ & ((!\s[1]~input_o\ & (!\s[0]~input_o\ & !\s[2]~input_o\)) # (\s[1]~input_o\ & (\s[0]~input_o\)))) # (\reg2[19]~input_o\ & (((!\s[2]~input_o\)))) ) ) ) # ( 
-- \Add0~77_sumout\ & ( !\reg1[19]~input_o\ & ( (!\s[0]~input_o\ & (((\s[2]~input_o\)))) # (\s[0]~input_o\ & ((!\s[2]~input_o\ & ((\reg2[19]~input_o\))) # (\s[2]~input_o\ & ((!\s[1]~input_o\) # (!\reg2[19]~input_o\))))) ) ) ) # ( !\Add0~77_sumout\ & ( 
-- !\reg1[19]~input_o\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\ & \reg2[19]~input_o\)))) # (\s[2]~input_o\ & (\s[1]~input_o\ & ((!\s[0]~input_o\) # (!\reg2[19]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110100000011110011111010010001111100001001101111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[1]~input_o\,
	datab => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_reg2[19]~input_o\,
	datae => \ALT_INV_Add0~77_sumout\,
	dataf => \ALT_INV_reg1[19]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: IOIBUF_X32_Y0_N52
\reg2[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(20),
	o => \reg2[20]~input_o\);

-- Location: IOIBUF_X60_Y0_N52
\reg1[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(20),
	o => \reg1[20]~input_o\);

-- Location: LABCELL_X35_Y1_N3
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[20]~input_o\) ) + ( \reg1[20]~input_o\ ) + ( \Add0~78\ ))
-- \Add0~82\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[20]~input_o\) ) + ( \reg1[20]~input_o\ ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[20]~input_o\,
	dataf => \ALT_INV_reg1[20]~input_o\,
	cin => \Add0~78\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: LABCELL_X36_Y1_N6
\Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = ( \reg2[20]~input_o\ & ( \reg1[20]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~81_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\reg2[20]~input_o\ & ( \reg1[20]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((!\s[0]~input_o\))) # 
-- (\s[2]~input_o\ & (\Add0~81_sumout\)))) # (\s[1]~input_o\ & (((\s[0]~input_o\)))) ) ) ) # ( \reg2[20]~input_o\ & ( !\reg1[20]~input_o\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~81_sumout\)) # 
-- (\s[1]~input_o\ & ((!\s[0]~input_o\))))) ) ) ) # ( !\reg2[20]~input_o\ & ( !\reg1[20]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~81_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000101010101000110110101101010110001000011111011101110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[2]~input_o\,
	datab => \ALT_INV_Add0~81_sumout\,
	datac => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_reg2[20]~input_o\,
	dataf => \ALT_INV_reg1[20]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: IOIBUF_X50_Y0_N75
\reg1[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(21),
	o => \reg1[21]~input_o\);

-- Location: IOIBUF_X50_Y0_N41
\reg2[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(21),
	o => \reg2[21]~input_o\);

-- Location: LABCELL_X35_Y1_N6
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( \reg1[21]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[21]~input_o\) ) + ( \Add0~82\ ))
-- \Add0~86\ = CARRY(( \reg1[21]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[21]~input_o\) ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg1[21]~input_o\,
	dataf => \ALT_INV_reg2[21]~input_o\,
	cin => \Add0~82\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: LABCELL_X36_Y1_N12
\Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = ( \s[0]~input_o\ & ( \reg1[21]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((\reg2[21]~input_o\))) # (\s[2]~input_o\ & (\Add0~85_sumout\)))) # (\s[1]~input_o\ & (((!\s[2]~input_o\) # (!\reg2[21]~input_o\)))) ) ) ) # ( 
-- !\s[0]~input_o\ & ( \reg1[21]~input_o\ & ( (!\s[1]~input_o\ & (((!\s[2]~input_o\)) # (\Add0~85_sumout\))) # (\s[1]~input_o\ & (((!\s[2]~input_o\ & \reg2[21]~input_o\)))) ) ) ) # ( \s[0]~input_o\ & ( !\reg1[21]~input_o\ & ( (!\s[2]~input_o\ & 
-- (((\reg2[21]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~85_sumout\)) # (\s[1]~input_o\ & ((!\reg2[21]~input_o\))))) ) ) ) # ( !\s[0]~input_o\ & ( !\reg1[21]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~85_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001111111010011000100111101000011011111110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~85_sumout\,
	datab => \ALT_INV_s[1]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_reg2[21]~input_o\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_reg1[21]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: IOIBUF_X68_Y0_N18
\reg2[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(22),
	o => \reg2[22]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\reg1[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(22),
	o => \reg1[22]~input_o\);

-- Location: LABCELL_X35_Y1_N9
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[22]~input_o\) ) + ( \reg1[22]~input_o\ ) + ( \Add0~86\ ))
-- \Add0~90\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[22]~input_o\) ) + ( \reg1[22]~input_o\ ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg2[22]~input_o\,
	dataf => \ALT_INV_reg1[22]~input_o\,
	cin => \Add0~86\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: LABCELL_X36_Y1_N18
\Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = ( \s[0]~input_o\ & ( \reg1[22]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & (\reg2[22]~input_o\)) # (\s[2]~input_o\ & ((\Add0~89_sumout\))))) # (\s[1]~input_o\ & ((!\reg2[22]~input_o\) # ((!\s[2]~input_o\)))) ) ) ) # ( 
-- !\s[0]~input_o\ & ( \reg1[22]~input_o\ & ( (!\s[1]~input_o\ & (((!\s[2]~input_o\) # (\Add0~89_sumout\)))) # (\s[1]~input_o\ & (\reg2[22]~input_o\ & (!\s[2]~input_o\))) ) ) ) # ( \s[0]~input_o\ & ( !\reg1[22]~input_o\ & ( (!\s[2]~input_o\ & 
-- (((\reg2[22]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & ((\Add0~89_sumout\))) # (\s[1]~input_o\ & (!\reg2[22]~input_o\)))) ) ) ) # ( !\s[0]~input_o\ & ( !\reg1[22]~input_o\ & ( (\s[2]~input_o\ & ((\Add0~89_sumout\) # (\s[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001111001101000011111010110000101110100111010001111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[1]~input_o\,
	datab => \ALT_INV_reg2[22]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_Add0~89_sumout\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_reg1[22]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: IOIBUF_X32_Y0_N18
\reg1[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(23),
	o => \reg1[23]~input_o\);

-- Location: IOIBUF_X38_Y0_N18
\reg2[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(23),
	o => \reg2[23]~input_o\);

-- Location: LABCELL_X35_Y1_N12
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[23]~input_o\) ) + ( \reg1[23]~input_o\ ) + ( \Add0~90\ ))
-- \Add0~94\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[23]~input_o\) ) + ( \reg1[23]~input_o\ ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[23]~input_o\,
	dataf => \ALT_INV_reg1[23]~input_o\,
	cin => \Add0~90\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: LABCELL_X36_Y1_N54
\Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = ( \Add0~93_sumout\ & ( \reg2[23]~input_o\ & ( (!\s[2]~input_o\ & (((\reg1[23]~input_o\)) # (\s[0]~input_o\))) # (\s[2]~input_o\ & ((!\s[1]~input_o\) # ((!\s[0]~input_o\ & !\reg1[23]~input_o\)))) ) ) ) # ( !\Add0~93_sumout\ & ( 
-- \reg2[23]~input_o\ & ( (!\s[2]~input_o\ & (((\reg1[23]~input_o\)) # (\s[0]~input_o\))) # (\s[2]~input_o\ & (!\s[0]~input_o\ & (!\reg1[23]~input_o\ & \s[1]~input_o\))) ) ) ) # ( \Add0~93_sumout\ & ( !\reg2[23]~input_o\ & ( (!\reg1[23]~input_o\ & 
-- (\s[2]~input_o\)) # (\reg1[23]~input_o\ & ((!\s[0]~input_o\ & ((!\s[1]~input_o\))) # (\s[0]~input_o\ & ((\s[1]~input_o\) # (\s[2]~input_o\))))) ) ) ) # ( !\Add0~93_sumout\ & ( !\reg2[23]~input_o\ & ( (!\s[2]~input_o\ & (\reg1[23]~input_o\ & 
-- (!\s[0]~input_o\ $ (\s[1]~input_o\)))) # (\s[2]~input_o\ & (\s[1]~input_o\ & ((!\reg1[23]~input_o\) # (\s[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100001010011010111010101001100101010011010100111111101101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[2]~input_o\,
	datab => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[23]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_Add0~93_sumout\,
	dataf => \ALT_INV_reg2[23]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X4_Y0_N35
\reg2[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(24),
	o => \reg2[24]~input_o\);

-- Location: IOIBUF_X58_Y0_N75
\reg1[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(24),
	o => \reg1[24]~input_o\);

-- Location: LABCELL_X35_Y1_N15
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[24]~input_o\) ) + ( \reg1[24]~input_o\ ) + ( \Add0~94\ ))
-- \Add0~98\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[24]~input_o\) ) + ( \reg1[24]~input_o\ ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[24]~input_o\,
	datad => \ALT_INV_reg2[24]~input_o\,
	cin => \Add0~94\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: LABCELL_X35_Y1_N42
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( \reg1[24]~input_o\ & ( \s[2]~input_o\ & ( (!\s[1]~input_o\ & (((\Add0~97_sumout\)))) # (\s[1]~input_o\ & (\s[0]~input_o\ & (!\reg2[24]~input_o\))) ) ) ) # ( !\reg1[24]~input_o\ & ( \s[2]~input_o\ & ( (!\s[1]~input_o\ & 
-- (((\Add0~97_sumout\)))) # (\s[1]~input_o\ & ((!\s[0]~input_o\) # ((!\reg2[24]~input_o\)))) ) ) ) # ( \reg1[24]~input_o\ & ( !\s[2]~input_o\ & ( (!\s[0]~input_o\ $ (\s[1]~input_o\)) # (\reg2[24]~input_o\) ) ) ) # ( !\reg1[24]~input_o\ & ( !\s[2]~input_o\ & 
-- ( (\s[0]~input_o\ & \reg2[24]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001101101111011011100001110111111100000010011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_reg2[24]~input_o\,
	datac => \ALT_INV_s[1]~input_o\,
	datad => \ALT_INV_Add0~97_sumout\,
	datae => \ALT_INV_reg1[24]~input_o\,
	dataf => \ALT_INV_s[2]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: IOIBUF_X38_Y0_N1
\reg1[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(25),
	o => \reg1[25]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\reg2[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(25),
	o => \reg2[25]~input_o\);

-- Location: LABCELL_X35_Y1_N18
\Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~101_sumout\ = SUM(( \reg1[25]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[25]~input_o\) ) + ( \Add0~98\ ))
-- \Add0~102\ = CARRY(( \reg1[25]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[25]~input_o\) ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[25]~input_o\,
	dataf => \ALT_INV_reg2[25]~input_o\,
	cin => \Add0~98\,
	sumout => \Add0~101_sumout\,
	cout => \Add0~102\);

-- Location: LABCELL_X36_Y1_N30
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \s[0]~input_o\ & ( \reg1[25]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((\reg2[25]~input_o\))) # (\s[2]~input_o\ & (\Add0~101_sumout\)))) # (\s[1]~input_o\ & (((!\s[2]~input_o\) # (!\reg2[25]~input_o\)))) ) ) ) # ( 
-- !\s[0]~input_o\ & ( \reg1[25]~input_o\ & ( (!\s[1]~input_o\ & (((!\s[2]~input_o\)) # (\Add0~101_sumout\))) # (\s[1]~input_o\ & (((!\s[2]~input_o\ & \reg2[25]~input_o\)))) ) ) ) # ( \s[0]~input_o\ & ( !\reg1[25]~input_o\ & ( (!\s[2]~input_o\ & 
-- (((\reg2[25]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~101_sumout\)) # (\s[1]~input_o\ & ((!\reg2[25]~input_o\))))) ) ) ) # ( !\s[0]~input_o\ & ( !\reg1[25]~input_o\ & ( (\s[2]~input_o\ & ((\Add0~101_sumout\) # (\s[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001111111001010100010111100100101011111110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[1]~input_o\,
	datab => \ALT_INV_Add0~101_sumout\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_reg2[25]~input_o\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_reg1[25]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: IOIBUF_X38_Y0_N35
\reg1[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(26),
	o => \reg1[26]~input_o\);

-- Location: IOIBUF_X40_Y0_N52
\reg2[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(26),
	o => \reg2[26]~input_o\);

-- Location: LABCELL_X35_Y1_N21
\Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~105_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[26]~input_o\) ) + ( \reg1[26]~input_o\ ) + ( \Add0~102\ ))
-- \Add0~106\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[26]~input_o\) ) + ( \reg1[26]~input_o\ ) + ( \Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[26]~input_o\,
	datad => \ALT_INV_reg2[26]~input_o\,
	cin => \Add0~102\,
	sumout => \Add0~105_sumout\,
	cout => \Add0~106\);

-- Location: LABCELL_X36_Y1_N36
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \s[0]~input_o\ & ( \reg2[26]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~105_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\s[0]~input_o\ & ( \reg2[26]~input_o\ & ( (!\s[2]~input_o\ & (((\reg1[26]~input_o\)))) # (\s[2]~input_o\ & 
-- ((!\s[1]~input_o\ & (\Add0~105_sumout\)) # (\s[1]~input_o\ & ((!\reg1[26]~input_o\))))) ) ) ) # ( \s[0]~input_o\ & ( !\reg2[26]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~105_sumout\ & (\s[2]~input_o\))) # (\s[1]~input_o\ & (((\reg1[26]~input_o\) # 
-- (\s[2]~input_o\)))) ) ) ) # ( !\s[0]~input_o\ & ( !\reg2[26]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((\reg1[26]~input_o\))) # (\s[2]~input_o\ & (\Add0~105_sumout\)))) # (\s[1]~input_o\ & (((\s[2]~input_o\ & !\reg1[26]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011111000100000001110011011100000111111101001111010011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~105_sumout\,
	datab => \ALT_INV_s[1]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_reg1[26]~input_o\,
	datae => \ALT_INV_s[0]~input_o\,
	dataf => \ALT_INV_reg2[26]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: IOIBUF_X36_Y0_N35
\reg1[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(27),
	o => \reg1[27]~input_o\);

-- Location: IOIBUF_X70_Y0_N52
\reg2[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(27),
	o => \reg2[27]~input_o\);

-- Location: LABCELL_X35_Y1_N24
\Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~109_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[27]~input_o\) ) + ( \reg1[27]~input_o\ ) + ( \Add0~106\ ))
-- \Add0~110\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[27]~input_o\) ) + ( \reg1[27]~input_o\ ) + ( \Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[27]~input_o\,
	datad => \ALT_INV_reg2[27]~input_o\,
	cin => \Add0~106\,
	sumout => \Add0~109_sumout\,
	cout => \Add0~110\);

-- Location: LABCELL_X36_Y1_N42
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \s[2]~input_o\ & ( \reg2[27]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~109_sumout\)) # (\s[1]~input_o\ & (((!\reg1[27]~input_o\ & !\s[0]~input_o\)))) ) ) ) # ( !\s[2]~input_o\ & ( \reg2[27]~input_o\ & ( (\s[0]~input_o\) # 
-- (\reg1[27]~input_o\) ) ) ) # ( \s[2]~input_o\ & ( !\reg2[27]~input_o\ & ( (!\s[1]~input_o\ & (\Add0~109_sumout\)) # (\s[1]~input_o\ & (((!\reg1[27]~input_o\) # (\s[0]~input_o\)))) ) ) ) # ( !\s[2]~input_o\ & ( !\reg2[27]~input_o\ & ( (\reg1[27]~input_o\ & 
-- (!\s[1]~input_o\ $ (\s[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000101011100100111011100001111111111110111001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[1]~input_o\,
	datab => \ALT_INV_Add0~109_sumout\,
	datac => \ALT_INV_reg1[27]~input_o\,
	datad => \ALT_INV_s[0]~input_o\,
	datae => \ALT_INV_s[2]~input_o\,
	dataf => \ALT_INV_reg2[27]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X76_Y0_N1
\reg1[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(28),
	o => \reg1[28]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\reg2[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(28),
	o => \reg2[28]~input_o\);

-- Location: LABCELL_X35_Y1_N27
\Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~113_sumout\ = SUM(( \reg1[28]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[28]~input_o\) ) + ( \Add0~110\ ))
-- \Add0~114\ = CARRY(( \reg1[28]~input_o\ ) + ( !\s[0]~input_o\ $ (!\reg2[28]~input_o\) ) + ( \Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_reg1[28]~input_o\,
	dataf => \ALT_INV_reg2[28]~input_o\,
	cin => \Add0~110\,
	sumout => \Add0~113_sumout\,
	cout => \Add0~114\);

-- Location: LABCELL_X35_Y1_N48
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \reg1[28]~input_o\ & ( \reg2[28]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~113_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\reg1[28]~input_o\ & ( \reg2[28]~input_o\ & ( (!\s[2]~input_o\ & (\s[0]~input_o\)) # (\s[2]~input_o\ & 
-- ((!\s[1]~input_o\ & ((\Add0~113_sumout\))) # (\s[1]~input_o\ & (!\s[0]~input_o\)))) ) ) ) # ( \reg1[28]~input_o\ & ( !\reg2[28]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & (!\s[0]~input_o\)) # (\s[2]~input_o\ & ((\Add0~113_sumout\))))) # 
-- (\s[1]~input_o\ & (\s[0]~input_o\)) ) ) ) # ( !\reg1[28]~input_o\ & ( !\reg2[28]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~113_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100110011100010110101010101000111011001101100111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_s[2]~input_o\,
	datac => \ALT_INV_Add0~113_sumout\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_reg1[28]~input_o\,
	dataf => \ALT_INV_reg2[28]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: IOIBUF_X40_Y0_N18
\reg2[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(29),
	o => \reg2[29]~input_o\);

-- Location: IOIBUF_X38_Y0_N52
\reg1[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(29),
	o => \reg1[29]~input_o\);

-- Location: LABCELL_X35_Y1_N30
\Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~117_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[29]~input_o\) ) + ( \reg1[29]~input_o\ ) + ( \Add0~114\ ))
-- \Add0~118\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[29]~input_o\) ) + ( \reg1[29]~input_o\ ) + ( \Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg2[29]~input_o\,
	dataf => \ALT_INV_reg1[29]~input_o\,
	cin => \Add0~114\,
	sumout => \Add0~117_sumout\,
	cout => \Add0~118\);

-- Location: LABCELL_X36_Y1_N48
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \reg1[29]~input_o\ & ( \reg2[29]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~117_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\reg1[29]~input_o\ & ( \reg2[29]~input_o\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\)))) # (\s[2]~input_o\ & 
-- ((!\s[1]~input_o\ & (\Add0~117_sumout\)) # (\s[1]~input_o\ & ((!\s[0]~input_o\))))) ) ) ) # ( \reg1[29]~input_o\ & ( !\reg2[29]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((!\s[0]~input_o\))) # (\s[2]~input_o\ & (\Add0~117_sumout\)))) # 
-- (\s[1]~input_o\ & (((\s[0]~input_o\)))) ) ) ) # ( !\reg1[29]~input_o\ & ( !\reg2[29]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~117_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111110001000011011100000111111101001111010011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~117_sumout\,
	datab => \ALT_INV_s[1]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_s[0]~input_o\,
	datae => \ALT_INV_reg1[29]~input_o\,
	dataf => \ALT_INV_reg2[29]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: IOIBUF_X32_Y0_N1
\reg2[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(30),
	o => \reg2[30]~input_o\);

-- Location: IOIBUF_X36_Y0_N18
\reg1[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(30),
	o => \reg1[30]~input_o\);

-- Location: LABCELL_X35_Y1_N33
\Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~121_sumout\ = SUM(( !\s[0]~input_o\ $ (!\reg2[30]~input_o\) ) + ( \reg1[30]~input_o\ ) + ( \Add0~118\ ))
-- \Add0~122\ = CARRY(( !\s[0]~input_o\ $ (!\reg2[30]~input_o\) ) + ( \reg1[30]~input_o\ ) + ( \Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_reg1[30]~input_o\,
	datad => \ALT_INV_reg2[30]~input_o\,
	cin => \Add0~118\,
	sumout => \Add0~121_sumout\,
	cout => \Add0~122\);

-- Location: LABCELL_X36_Y1_N24
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \reg1[30]~input_o\ & ( \s[1]~input_o\ & ( (!\reg2[30]~input_o\ & (\s[0]~input_o\)) # (\reg2[30]~input_o\ & ((!\s[2]~input_o\))) ) ) ) # ( !\reg1[30]~input_o\ & ( \s[1]~input_o\ & ( !\s[2]~input_o\ $ (((!\reg2[30]~input_o\) # 
-- (!\s[0]~input_o\))) ) ) ) # ( \reg1[30]~input_o\ & ( !\s[1]~input_o\ & ( (!\s[2]~input_o\ & (((!\s[0]~input_o\)) # (\reg2[30]~input_o\))) # (\s[2]~input_o\ & (((\Add0~121_sumout\)))) ) ) ) # ( !\reg1[30]~input_o\ & ( !\s[1]~input_o\ & ( (!\s[2]~input_o\ & 
-- (\reg2[30]~input_o\ & (\s[0]~input_o\))) # (\s[2]~input_o\ & (((\Add0~121_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000011111110100001101111100011110000111100111001001110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg2[30]~input_o\,
	datab => \ALT_INV_s[0]~input_o\,
	datac => \ALT_INV_s[2]~input_o\,
	datad => \ALT_INV_Add0~121_sumout\,
	datae => \ALT_INV_reg1[30]~input_o\,
	dataf => \ALT_INV_s[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: IOIBUF_X66_Y0_N75
\reg1[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(31),
	o => \reg1[31]~input_o\);

-- Location: IOIBUF_X78_Y0_N35
\reg2[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(31),
	o => \reg2[31]~input_o\);

-- Location: LABCELL_X35_Y1_N36
\Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~125_sumout\ = SUM(( !\reg2[31]~input_o\ $ (!\s[0]~input_o\) ) + ( \reg1[31]~input_o\ ) + ( \Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reg1[31]~input_o\,
	datab => \ALT_INV_reg2[31]~input_o\,
	datac => \ALT_INV_s[0]~input_o\,
	cin => \Add0~122\,
	sumout => \Add0~125_sumout\);

-- Location: LABCELL_X35_Y1_N54
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \reg2[31]~input_o\ & ( \reg1[31]~input_o\ & ( (!\s[2]~input_o\) # ((\Add0~125_sumout\ & !\s[1]~input_o\)) ) ) ) # ( !\reg2[31]~input_o\ & ( \reg1[31]~input_o\ & ( (!\s[1]~input_o\ & ((!\s[2]~input_o\ & ((!\s[0]~input_o\))) # 
-- (\s[2]~input_o\ & (\Add0~125_sumout\)))) # (\s[1]~input_o\ & (((\s[0]~input_o\)))) ) ) ) # ( \reg2[31]~input_o\ & ( !\reg1[31]~input_o\ & ( (!\s[2]~input_o\ & (((\s[0]~input_o\)))) # (\s[2]~input_o\ & ((!\s[1]~input_o\ & (\Add0~125_sumout\)) # 
-- (\s[1]~input_o\ & ((!\s[0]~input_o\))))) ) ) ) # ( !\reg2[31]~input_o\ & ( !\reg1[31]~input_o\ & ( (\s[2]~input_o\ & ((\s[1]~input_o\) # (\Add0~125_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100110011000111010011110011010001000011111101110111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~125_sumout\,
	datab => \ALT_INV_s[2]~input_o\,
	datac => \ALT_INV_s[0]~input_o\,
	datad => \ALT_INV_s[1]~input_o\,
	datae => \ALT_INV_reg2[31]~input_o\,
	dataf => \ALT_INV_reg1[31]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X13_Y41_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


