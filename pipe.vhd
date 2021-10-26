----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
------ pipe.vhd (component): ----------
--		      _______   _____  
--	 a>>_____|FA  s|___|REG|__>>q
--	 b>>_____|     |   |___|  
--        __|ci co|__        
--        | |_____| |       
--        |  _____  |       
--        |__|REG|__|
--           |___|
--
-- * FA => Full Adder
-- * REG => 1-bit Register   
---------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_components.all;
---------------------------------------
ENTITY pipe IS
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			a		:	IN		STD_LOGIC;
			b		:	IN		STD_LOGIC;
			q		:	OUT	STD_LOGIC);
END ENTITY pipe;
 ---------------------------------------
ARCHITECTURE structural OF pipe IS
	SIGNAL s, cin, cout: STD_LOGIC;
BEGIN
	U1: COMPONENT full_adder 	PORT MAP (a, b, cin, s, cout);
	U2: COMPONENT reg 			PORT MAP (clk, rst, cout, cin);
	U3: COMPONENT reg 			PORT MAP (clk, rst, s, q);
END ARCHITECTURE structural;
---------------------------------------