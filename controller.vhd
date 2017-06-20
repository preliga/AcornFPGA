LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY controller IS PORT
(
	CLK			:IN STD_LOGIC;
	ADDR			:IN STD_LOGIC_VECTOR(31 downto 0);
	RD				:IN STD_LOGIC;
	WR				:IN STD_LOGIC;
	
	DATA_RD		:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	TOKEN_CK		:IN STD_LOGIC;
	
	ADR1_RD		:OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MEM1_RD		:OUT STD_LOGIC;
	MEM1_WR		:OUT STD_LOGIC;
	
	ADD_ONE		:OUT STD_LOGIC;
	STATE_WR		:OUT STD_LOGIC;
	STATE_RESET	:OUT STD_LOGIC;
	CA				:OUT STD_LOGIC_VECTOR(31 downto 0);
	CB				:OUT STD_LOGIC_VECTOR(31 downto 0);
	
	DATA_WR		:OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	STATUS_WR	:OUT STD_LOGIC_VECTOR(1 downto 0);
	
	MEM2_RD		:OUT STD_LOGIC;
	
	ADR2_WR		:OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MEM2_WR		:OUT STD_LOGIC
	
	
);
END ENTITY;

ARCHITECTURE A1 OF controller IS

	SIGNAL CURR_STATE: STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL ADDR_RD: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL ADDR_WR: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
BEGIN
	
	-- change state
	PROCESS(CLK)
	BEGIN
		IF(CLK'EVENT AND CLK = '1') THEN
			CASE CURR_STATE IS
				WHEN "0000000" =>
					IF(ADDR = 0 AND WR = '1') THEN
						CURR_STATE <= "0000001";
					END IF;
				WHEN "1111111" =>
					CURR_STATE <= "0000000";
				WHEN OTHERS =>
					CURR_STATE <= CURR_STATE+1;
			END CASE;
		END IF;
	END PROCESS;
	
	
END ARCHITECTURE;