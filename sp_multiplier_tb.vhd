----- sp_multiplier.vhd (project): -------
-- TESTBENCH
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0
----------------------------------------- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_components.all;
---------------------------------------
ENTITY sp_multiplier_tb IS
END ENTITY sp_multiplier_tb;
 ---------------------------------------
ARCHITECTURE testbench OF sp_multiplier_tb IS
SIGNAL	clk_tb			:	STD_LOGIC	:= '0';
SIGNAL	rst_tb			: 	STD_LOGIC	:= '1';
SIGNAL	ena_tb			: 	STD_LOGIC	:= '0';
SIGNAL	load_tb			:	STD_LOGIC	:= '0';
SIGNAL	a_tb				: 	STD_LOGIC_VECTOR (3 DOWNTO 0) := "1100";
SIGNAL	b_tb				:	STD_LOGIC_VECTOR (3 DOWNTO 0)	:= "1101";
SIGNAL	prod_tb			:	STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL	prod_ser_tb		: 	STD_LOGIC;
SIGNAL	data_ready_tb	: 	STD_LOGIC;
BEGIN
	--CLOCK GENERATION:------------------------
	clk_tb <= not clk_tb after 10ns; -- 50MHz clock generation
	rst_tb <= '0' after 30ns;
	--LOAD GENERATION:------------------------
	load_tb	<= '1' after 50ns,
					'0' after 70ns,
					'1' after 310ns,
					'0' after 330ns;
	--LOAD GENERATION:------------------------
	ena_tb	<= '1' after 50ns,
					'0' after 270ns,
					'1' after 310ns;
	--DATA GENERATION:------------------------
	a_tb		<=	"1111" after 290ns;
	b_tb		<=	"1010" after 290ns;
	--DUT INSTANTIATION-----------------------
	DUT: ENTITY work.sp_multiplier
		PORT MAP (	clk			=>	clk_tb,
						rst			=>	rst_tb,
						ena			=>	ena_tb,
						load			=>	load_tb,
						a				=>	a_tb,
						b				=>	b_tb,
						data_ready	=>	data_ready_tb,
						prod			=>	prod_tb,
						prod_ser		=>	prod_ser_tb);
						
				
END ARCHITECTURE testbench;
---------------------------------------