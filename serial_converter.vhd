----- sp_multiplier.vhd (project): -------
-- Date: 2020-04-08
-- Author: Eduardo Gerlein
-- Version: 1.0 
------ serial_converter.vhd (component): ----------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------
ENTITY serial_converter IS
	GENERIC	(	MAX_WIDTH		:	INTEGER	:=	4);
	PORT 		(	clk				:	IN		STD_LOGIC;
					rst				:	IN		STD_LOGIC;
					load				:	IN		STD_LOGIC;
					d					: 	IN 	STD_LOGIC_VECTOR (MAX_WIDTH-1 DOWNTO 0);
					dout				: 	OUT 	STD_LOGIC);
END ENTITY;
-------------------------------------------------
ARCHITECTURE rtl OF serial_converter IS
	SIGNAL buffer_s: STD_LOGIC_VECTOR (MAX_WIDTH-1 DOWNTO 0);
BEGIN
	PROCESS (clk,rst)
	BEGIN
		IF (rst='1') THEN
			buffer_s <= (OTHERS => '0');
		ELSIF (falling_edge(clk)) THEN
			IF (load='1') THEN 
				buffer_s <= d;
			ELSE 
				buffer_s <= '0'& buffer_s(MAX_WIDTH-1 DOWNTO 1) ;
			END IF;
		END IF;
	END PROCESS;
	
	dout <= buffer_s(buffer_s'RIGHT);

END ARCHITECTURE;
-------------------------------------------------
