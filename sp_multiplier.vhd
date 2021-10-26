----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
-- Description:
-- 4-BIT Serial-Parallel multiplier
--
--         b(3)       b(2)		 b(1)               b(0)
--	    |         |                  |                  |
-- a(i)_____|__.______|__._______________|__._______________|__.
--	    |  |      |  |               |  |	            |  | 
--         _|__|_    _|__|_             _|__|_             _|__|_
--         | AND |   | AND |            | AND |           | AND |
--         |__.__|   |__.__|            |__.__|           |__.__|
--            |         |                  |                 |  _______   _____  
--            |         |                  | _______   _____ |__|fa  s|___|REG|__>>prod_serial
--            |         | _______   _____  |_|FA  s|___|REG|____|     |   |___|  
--            | _____   |_|FA  s|___|REG|____|     |   |___|  __|ci co|__       
--            |_|REG|_____|     |   |___|  __|ci co|__        | |_____| |
--              |___|   __|ci co|__        | |_____| |        |  _____  |
--                      | |_____| |        |  _____  |        |__|REG|__|
--                      |  _____  |        |__|REG|__|           |___|
--                      |__|REG|__|           |___|
--                         |___|

-- * FA => Full Adder
-- * REG => 1-bit Register    
------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_components.all;
---------------------------------------
ENTITY sp_multiplier IS
	PORT(	clk			:	IN		STD_LOGIC;
			rst			: 	IN		STD_LOGIC;
			ena			: 	IN		STD_LOGIC;
			load			:	IN		STD_LOGIC;
			a				: 	IN		STD_LOGIC_VECTOR (3 DOWNTO 0);
			b				:	IN		STD_LOGIC_VECTOR (3 DOWNTO 0);
			data_ready	:	OUT	STD_LOGIC;
			prod			:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			prod_ser		: 	OUT	STD_LOGIC);
 END ENTITY sp_multiplier;
 ---------------------------------------
ARCHITECTURE structural OF sp_multiplier IS
	SIGNAL a_s 		: STD_LOGIC;
	SIGNAL ready_s : STD_LOGIC;
	SIGNAL prod_s	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL and_out, reg_out: STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN
	U0:	COMPONENT serial_converter	PORT MAP (clk, rst, load, a, a_s);
	U1:	COMPONENT and_2		PORT MAP (a_s, b(3), and_out(3));
	U2:	COMPONENT and_2		PORT MAP (a_s, b(2), and_out(2));
	U3:	COMPONENT and_2		PORT MAP (a_s, b(1), and_out(1));
	U4:	COMPONENT and_2		PORT MAP (a_s, b(0), and_out(0));
	U5:	COMPONENT reg			PORT MAP (clk, rst, and_out(3), reg_out(3));
	U6:	COMPONENT pipe			PORT MAP (clk, rst, and_out(2), reg_out(3), reg_out(2));
	U7:	COMPONENT pipe 		PORT MAP (clk, rst, and_out(1), reg_out(2), reg_out(1));
	U8:	COMPONENT pipe 		PORT MAP (clk, rst, and_out(0), reg_out(1), reg_out(0));
	U9:	COMPONENT shiftReg	PORT MAP (clk, rst, ena, reg_out(0), prod_s);
	U10:	COMPONENT counter		PORT MAP (clk, rst, ena, '0', ready_s);
	U11:	COMPONENT my_reg		PORT MAP (clk, rst, ready_s, prod_s, prod);
	U12:	COMPONENT reg			PORT MAP (clk, rst, ready_s, data_ready);
	
	
	prod_ser <= reg_out(0);
END ARCHITECTURE structural;
---------------------------------------
