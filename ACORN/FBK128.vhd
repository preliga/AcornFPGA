LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY FBK128 IS PORT
(
	S		:IN STD_LOGIC_VECTOR(292 downto 0);
	KS		:IN STD_LOGIC_VECTOR(31 downto 0);
	CA		:IN STD_LOGIC_VECTOR(31 downto 0);
	CB		:IN STD_LOGIC_VECTOR(31 downto 0);
	
	OPT	:OUT STD_LOGIC_VECTOR(31 downto 0)
);
END ENTITY;

ARCHITECTURE A1 OF FBK128 IS
BEGIN
	OPT <=	S(31 downto 0) xor
			(not (S(138 downto 107) xor S(97 downto 66) xor S(92 downto 61))) xor
			(S(275 downto 244) and S(54 downto 23)) xor
			(S(275 downto 244) and S(191 downto 160)) xor
			(S(54 downto 23) and S(191 downto 160)) xor
			(CA and S(227 downto 196)) xor
			(CB and KS);
END ARCHITECTURE;