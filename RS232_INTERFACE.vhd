----------------------------------
-- Łukasz DZIEŁ (883533374)     --
-- FPGACOMMEXAMPLE-v2           --
-- 01.2016                      --
-- 1.0                          --
----------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;
USE WORK.RS232_INTERFACE_PKG.ALL;

ENTITY RS232_INTERFACE IS PORT
(	
	CLK	:IN STD_LOGIC;
	INIT	:IN STD_LOGIC;
	
	TX		:OUT STD_LOGIC;
	STORE	:IN STD_LOGIC;
	DIN	:IN STD_LOGIC_VECTOR(7 DOWNTO 0);

	RX		:IN STD_LOGIC;
	LOAD	:IN STD_LOGIC;
	DRL	:OUT STD_LOGIC;
	DOUT	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END ENTITY;

ARCHITECTURE RS232_INTERFACE_ARCH OF RS232_INTERFACE IS
	
	SIGNAL TEMP0 :STD_LOGIC;
	SIGNAL TEMP1 :STD_LOGIC;
	SIGNAL TEMP2 :STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL TEMP3 :STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL TEMP4 :STD_LOGIC;
	
BEGIN

	unit01 : ENTITY WORK.RS232_MEMORY PORT MAP (CLK, INIT, STORE, TEMP0, TEMP1, DIN, TEMP2);
	unit02 : ENTITY WORK.RS232_TRANSMITTER PORT MAP (CLK, INIT, TEMP1, TEMP0, TEMP2, TX);
	
	unit03 : ENTITY WORK.RS232_MEMORY PORT MAP (CLK, INIT, TEMP4, LOAD, DRL, TEMP3, DOUT);
	unit04 : ENTITY WORK.RS232_RECEIVER PORT MAP (CLK, INIT, RX, TEMP4, TEMP3);
	
END ARCHITECTURE;