----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
---- my_components.vhd (package):-----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------
PACKAGE my_components IS
	--------------------------
	COMPONENT and_2 IS
		PORT ( 	a	:	IN STD_LOGIC;
					b	:	IN STD_LOGIC;
					y	:	OUT STD_LOGIC);
	END COMPONENT and_2;
	--------------------------
	COMPONENT full_adder IS
		PORT(	a		:	IN		STD_LOGIC;
				b		:	IN		STD_LOGIC;
				cin	:	IN		STD_LOGIC;
				s		:	OUT	STD_LOGIC;
				cout	:	OUT	STD_LOGIC);
	END COMPONENT full_adder;			
	--------------------------
	COMPONENT reg IS
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			d		:	IN		STD_LOGIC;
			q		:	OUT	STD_LOGIC);
	END COMPONENT reg;
	--------------------------
	COMPONENT pipe IS
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			a		:	IN		STD_LOGIC;
			b		:	IN		STD_LOGIC;
			q		:	OUT	STD_LOGIC);
	END COMPONENT pipe;
	--------------------------
	COMPONENT shiftReg IS
	GENERIC	(	MAX_WIDTH		:	INTEGER	:=	8);
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			ena	:	IN		STD_LOGIC;
			d 		:	IN		STD_LOGIC;
			q_reg	: 	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0));
	END COMPONENT shiftReg;
	--------------------------
	COMPONENT serial_converter IS
	GENERIC	(	MAX_WIDTH		:	INTEGER	:=	4);
	PORT 		(	clk				:	IN		STD_LOGIC;
					rst				:	IN		STD_LOGIC;
					load				:	IN		STD_LOGIC;
					d					: 	IN 	STD_LOGIC_VECTOR (MAX_WIDTH-1 DOWNTO 0);
					dout				: 	OUT 	STD_LOGIC);
	END COMPONENT serial_converter;
	--------------------------
	COMPONENT counter IS
	GENERIC	(	MAX_COUNT:	INTEGER	:=	9;
					N			:	INTEGER	:=	4);
	PORT		(	clk		:	IN		STD_LOGIC;
					rst		:	IN		STD_LOGIC;
					ena 		:	IN		STD_LOGIC;
					syn_clr	:	IN		STD_LOGIC;
					max_tick	:	OUT	STD_LOGIC);
	END COMPONENT counter;
	--------------------------
	COMPONENT my_reg IS
	GENERIC (N	:	INTEGER	:= 8);
	PORT(	clk	:	IN		STD_LOGIC;
			rst	:	IN		STD_LOGIC;
			ena	:	IN		STD_LOGIC;
			d		:	IN		STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			q		:	OUT	STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT my_reg;
	--------------------------
END PACKAGE my_components;
---------------------------------------

