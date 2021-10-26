----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
------ counter.vhd (component): ----------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------
ENTITY counter IS
	GENERIC	(	MAX_COUNT:	INTEGER	:=	9;
					N			:	INTEGER	:=	4);
	PORT		(	clk		:	IN		STD_LOGIC;
					rst		:	IN		STD_LOGIC;
					ena 		:	IN		STD_LOGIC;
					syn_clr	:	IN		STD_LOGIC;
					max_tick	:	OUT	STD_LOGIC);
END ENTITY counter;
-------------------------------------
ARCHITECTURE rtl OF counter IS
	CONSTANT	ONES			:	UNSIGNED(N-1 DOWNTO 0) := (OTHERS => '1');
	CONSTANT	ZEROS			:	UNSIGNED(N-1 DOWNTO 0) := (OTHERS => '0');
	
	SIGNAL	count_s		:	UNSIGNED(N-1 DOWNTO 0);
	SIGNAL	count_next	:	UNSIGNED(N-1 DOWNTO 0);
BEGIN
	-- NEXT STATE LOGIC
	count_next 	<=		(OTHERS =>	'0') 	WHEN 	count_s = to_unsigned(MAX_COUNT,N) 	ELSE
							(OTHERS =>	'0') 	WHEN 	syn_clr='1'									ELSE
							count_s + 1 		WHEN	(ena ='1') 									ELSE
							count_s;
	
	PROCESS(clk,rst)
		VARIABLE	temp	:	UNSIGNED(N-1 DOWNTO 0);
	BEGIN
		IF(rst='1') THEN
			temp	:= (OTHERS => '0');
		ELSIF (rising_edge(clk)) THEN
			IF (ena='1') THEN
				temp	:= count_next;
			END IF;
		END IF;
		count_s	<=	temp;
	END PROCESS;

	-- OUTPUT LOGIC
	max_tick	<=	'1' when count_s = to_unsigned(MAX_COUNT,N) 	ELSE '0';
	
END ARCHITECTURE rtl;