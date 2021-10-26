----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
------ my_reg.vhd (component): -----------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------
ENTITY my_reg IS
	GENERIC (N	:	INTEGER	:= 8);
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			ena	:	IN		STD_LOGIC;
			d		:	IN		STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			q		:	OUT	STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END ENTITY my_reg;
---------------------------------------
ARCHITECTURE rtl OF my_reg IS
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF (rst='1') THEN 
			q	<=	(OTHERS => '0');
		ELSIF (rising_edge(clk)) THEN 
			IF (ena = '1') THEN
				q	<=	d;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE rtl;
---------------------------------------