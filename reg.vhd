----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
------ reg.vhd (component): -----------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------
ENTITY reg IS
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			d		:	IN		STD_LOGIC;
			q		:	OUT	STD_LOGIC);
END ENTITY reg;
---------------------------------------
ARCHITECTURE rtl OF reg IS
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF (rst='1') THEN 
			q	<=	'0';
		ELSIF (rising_edge(clk)) THEN 
			q	<=	d;
		END IF;
	END PROCESS;
END ARCHITECTURE rtl;
---------------------------------------