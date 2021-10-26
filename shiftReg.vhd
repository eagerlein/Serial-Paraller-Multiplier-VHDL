LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------
ENTITY shiftReg IS
	GENERIC	(MAX_WIDTH		:	INTEGER	:=	8);
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			ena	:	IN		STD_LOGIC;
			d 		:	IN		STD_LOGIC;
			q_reg	: 	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0));
END ENTITY;
-------------------------------------
ARCHITECTURE behavior OF shiftReg IS
	SIGNAL	buffer_s	:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF (rst = '1') THEN
			buffer_s <= (OTHERS => '0');
		ELSIF (rising_edge(clk)) THEN
			IF (ena ='1') THEN
				buffer_s <= d & buffer_s(MAX_WIDTH-1 DOWNTO 1);
			END IF;
		END IF;
	END PROCESS;
	q_reg <= buffer_s;	
END ARCHITECTURE;
