LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tag IS PORT
(
	CLK	:IN STD_LOGIC;
	
	RD		:IN STD_LOGIC;
	WR		:IN STD_LOGIC;
	
	ADR	:IN STD_LOGIC_VECTOR(31 downto 0);
	INP	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	OPT	:OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END ENTITY;

ARCHITECTURE A1 OF tag IS
	SIGNAL TAG_REGISTER : STD_LOGIC_VECTOR(127 DOWNTO 0);
BEGIN

	PROCESS(CLK)
	BEGIN
		IF (CLK'EVENT AND CLK = '1') THEN
			IF (WR = '1') THEN
				TAG_REGISTER <= TAG_REGISTER(95 DOWNTO 0) & INP;
			END IF;
		END IF;
	END PROCESS;
	
	OPT <= TAG_REGISTER(127 downto 96);

	
END ARCHITECTURE;