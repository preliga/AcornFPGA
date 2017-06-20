LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY m IS PORT
(
	CLK	:IN STD_LOGIC;
	INP	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	KEY_S	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	OPT	:OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END ENTITY;

ARCHITECTURE A1 OF m IS
	SIGNAL M_REGISTER : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	PROCESS(CLK)
	BEGIN
		IF (CLK'EVENT AND CLK = '1') THEN
			M_REGISTER <= INP;
		END IF;
	END PROCESS;
	
	OPT <= M_REGISTER xor KEY_S;
	
END ARCHITECTURE;