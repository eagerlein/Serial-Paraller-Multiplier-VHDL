----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
------ and_2.vhd (component): ---------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------
ENTITY and_2 IS
PORT ( 	a	:	IN STD_LOGIC;
			b	:	IN STD_LOGIC;
			y	:	OUT STD_LOGIC);
END ENTITY and_2;
---------------------------------------
ARCHITECTURE gateLevel OF and_2 IS
BEGIN
	y <= a AND b;
END ARCHITECTURE gateLevel;
---------------------------------------