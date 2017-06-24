LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY state IS PORT
(
	CLK	:IN STD_LOGIC;
	INP_F	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	INP_M	:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	WR		:IN STD_LOGIC;
	RESET	:IN STD_LOGIC;
	S		:OUT STD_LOGIC_VECTOR(292 downto 0)
);
END ENTITY;

ARCHITECTURE A1 OF state IS
	SIGNAL STATE : STD_LOGIC_VECTOR(292 DOWNTO 0);
BEGIN

	PROCESS(CLK)
	BEGIN
		IF (CLK'EVENT AND CLK = '1') THEN
			IF (RESET = '1') THEN
				STATE<=(others=>'0');
			END IF;
			IF (WR = '1') THEN
				STATE(292 downto 261) <= INP_M xor INP_F xor ("0000" & STATE(266 downto 239)) xor ("0000" & STATE(261 downto 234));
				STATE(260 downto 257) <= STATE(292 downto 289) xor STATE(238 downto 235) xor STATE(233 downto 230);
				STATE(256 downto 230) <= STATE(288 downto 262);
				STATE(229 downto 198) <= STATE(261 downto 230) xor STATE(227 downto 196) xor STATE(224 downto 193);
				STATE(197 downto 193) <= STATE(229 downto 225);
				STATE(192 downto 161) <= STATE(224 downto 193) xor STATE(191 downto 160) xor STATE(185 downto 154);
				STATE(160 downto 154) <= STATE(192 downto 186);
				STATE(153 downto 122) <= STATE(185 downto 154) xor STATE(142 downto 111) xor STATE(138 downto 107);
				STATE(121 downto 107) <= STATE(153 downto 139);
				STATE(106 downto 75) <= STATE(138 downto 107) xor STATE(97 downto 66) xor STATE(92 downto 61);
				STATE(74 downto 61) <= STATE(106 downto 93);
				STATE(60 downto 29) <= STATE(92 downto 61) xor STATE(54 downto 23) xor STATE(31 downto 0);
				STATE(28 downto 0) <= STATE(60 downto 32);
			END IF;
		END IF;
	END PROCESS;
	
	S <= STATE;
	
END ARCHITECTURE;