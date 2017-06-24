LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY KSG128 IS PORT
(
	S		:IN STD_LOGIC_VECTOR(292 downto 0);
	OPT	:OUT STD_LOGIC_VECTOR(31 downto 0)
);
END ENTITY;

ARCHITECTURE A1 OF KSG128 IS
BEGIN
	
	--(S(92 downto 61) XOR S(54 downto 23) XOR S(31 downto 0))
	--(S(224 downto 193) XOR S(191 downto 160) XOR S(185 downto 154))
	--(S(261 downto 230) XOR S(227 downto 196) XOR S(224 downto 193))
	
	OPT <= 	S(43 downto 12) XOR
			S(185 downto 154) XOR
			S(142 downto 111) XOR
			S(138 downto 107) XOR
			(
				S(266 downto 235) AND (S(92 downto 61) XOR
				S(54 downto 23) XOR
				S(31 downto 0))
			) XOR (
				S(266 downto 235) AND (S(224 downto 193) XOR
				S(191 downto 160)XOR
				S(185 downto 154))
			) XOR (
				(S(92 downto 61) XOR S(54 downto 23) XOR S(31 downto 0)) AND
				(S(224 downto 193) XOR S(191 downto 160) XOR S(185 downto 154))
			) XOR (
				(S(261 downto 230) XOR S(227 downto 196) XOR S(224 downto 193)) AND
				S(142 downto 111)
			) XOR (
				(not (S(261 downto 230) XOR S(227 downto 196) XOR S(224 downto 193))) AND
				S(97 downto 66)
			);
		
END ARCHITECTURE;