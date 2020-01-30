--/////////////////////////////////////////////////////////////////////////////////
-- Company: Digilent Inc.
-- Engineer: Josh Sackos
-- 
-- Create Date:    07/11/2012
-- Module Name:    ssdCtrl 
-- Project Name: 	 PmodJSTK_Demo
-- Target Devices: Nexys3
-- Tool versions:  ISE 14.1
-- Description: This module interfaces the onboard seven segment display (SSD) on
--					 the Nexys3, and formats the data to be displayed.
--
--					 The DIN input is a binary number that gets converted to binary
--					 coded decimals, and is displayed as a 4 digit number on the SSD. The
--					 AN output bus drives the SSD's anodes controling the illumination
--					 of the 4 digits on the SSD.  The SEG output bus drives the cathodes
--					 on the SSD to display different characters.
--
-- Revision History: 
-- 						Revision 0.01 - File Created (Josh Sackos)
--/////////////////////////////////////////////////////////////////////////////////
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--  ===================================================================================
--  								Define Module, Inputs and Outputs
--  ===================================================================================
entity ssdCtrl is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DINX : in  STD_LOGIC_VECTOR (9 downto 0);
           DINY : in  STD_LOGIC_VECTOR (9 downto 0);
           AN : out  STD_LOGIC_VECTOR (7 downto 0);
           SEG : out  STD_LOGIC_VECTOR (6 downto 0));
end ssdCtrl;

architecture Behavioral of ssdCtrl is

--  ===================================================================================
-- 							  					Components
--  ===================================================================================

		-- **********************************************
		-- 					Binary to BCD Converter
		-- **********************************************
		component Binary_To_BCD

			 Port ( CLK : in  STD_LOGIC;
					  RST : in  STD_LOGIC;
					  START : in STD_LOGIC;
					  BIN : in  STD_LOGIC_VECTOR(9 downto 0);
					  BCDOUT : inout STD_LOGIC_VECTOR(15 downto 0)
			 );

		end component;
					  
--  ===================================================================================
-- 							  			Signals and Constants
--  ===================================================================================

			-- 1 kHz Clock Divider
			constant cntEndVal : STD_LOGIC_VECTOR(15 downto 0) := X"C350";
			signal clkCount : STD_LOGIC_VECTOR(15 downto 0) := X"0000";
			signal DCLK : STD_LOGIC := '0';

			-- 2 Bit Counter
			signal CNT : STD_LOGIC_VECTOR(2 downto 0) := "000";

			-- Binary to BCD
			signal bcdDataX : STD_LOGIC_VECTOR(15 downto 0) := X"0000";
			signal bcdDataY : STD_LOGIC_VECTOR(15 downto 0) := X"0000";

			-- Output Data Mux
			signal muxData : STD_LOGIC_VECTOR(3 downto 0);
			
--  ===================================================================================
-- 							  				Implementation
--  ===================================================================================
begin

			-------------------------------------------------
			--  	  		 Convert Binary to BCD
			------------------------------------------------
			BtoBCD1 : Binary_To_BCD port map(
					CLK=>CLK,
					RST=>RST,
					START=>DCLK,
					BIN=>DINX,
					BCDOUT=>bcdDataX
			);
			
            BtoBCD2 : Binary_To_BCD port map(
                    CLK=>CLK,
                    RST=>RST,
                    START=>DCLK,
                    BIN=>DINY,
                    BCDOUT=>bcdDataY
            );
                        
			-------------------------------------------------
			--					 Output Data Mux
			-- 		Select data to display on SSD
			-------------------------------------------------
			process(CNT(2), CNT(1), CNT(0), bcdDataX, RST) begin
					if(RST = '1') then
							muxData <= "0000";
					else
							case (CNT) is
									when "000" => muxData <= bcdDataX(3 downto 0);
									when "001" => muxData <= bcdDataX(7 downto 4);
									when "010" => muxData <= bcdDataX(11 downto 8);
									when "011" => muxData <= bcdDataX(15 downto 12);
									when "100" => muxData <= bcdDataY(3 downto 0);
                                    when "101" => muxData <= bcdDataY(7 downto 4);
                                    when "110" => muxData <= bcdDataY(11 downto 8);
                                    when "111" => muxData <= bcdDataY(15 downto 12);
									when others => muxData <= "0000";
							end case;
					end if;
			end process;
			
			
			
			--------------------------------
			--		   Segment Decoder
			-- Determines cathode pattern
			--   to display digit on SSD
			--------------------------------
			process(DCLK, RST) begin
					if(RST = '1') then
							SEG <= "1111111";
					elsif rising_edge(DCLK) then
							case (muxData) is

									when X"0" => SEG <= "1000000";  -- 0
									when X"1" => SEG <= "1111001";  -- 1
									when X"2" => SEG <= "0100100";  -- 2
									when X"3" => SEG <= "0110000";  -- 3
									when X"4" => SEG <= "0011001";  -- 4
									when X"5" => SEG <= "0010010";  -- 5
									when X"6" => SEG <= "0000010";  -- 6
									when X"7" => SEG <= "1111000";  -- 7
									when X"8" => SEG <= "0000000";  -- 8
									when X"9" => SEG <= "0010000";  -- 9
									when others => SEG <= "1111111";
									
							end case;
					end if;
			end process;



			-----------------------------------
			--	  		  Anode Decoder
			--    Determines digit digit to
			--   illuminate for clock period
			-----------------------------------
			process(DCLK, RST) begin
					if(RST = '1') then
							AN <= "00000000";
					elsif rising_edge(DCLK) then
							case (CNT) is

									when "000" => AN <= "11111110";  -- 0
									when "001" => AN <= "11111101";  -- 1
									when "010" => AN <= "11111011";  -- 2
									when "011" => AN <= "11110111";  -- 3
									when "100" => AN <= "11101111";  -- 4
                                    when "101" => AN <= "11011111";  -- 5
                                    when "110" => AN <= "10111111";  -- 6
                                    when "111" => AN <= "01111111";  -- 7
									when others => AN <= "11111111";
									
							end case;
					end if;
			end process;
			

			--------------------------------
			--			2 Bit Counter
			--	 Used to select which diigt
			--	  is being illuminated, and
			--	selects data to be displayed
			--------------------------------
			process(DCLK) begin

					if rising_edge(DCLK) then
							CNT <= CNT + 1;
					end if;
					
			end process;
			
			--------------------------------
			--			1khz Clock Divider
			--  Timing for refreshing the
			--  			 SSD, etc.
			--------------------------------
			process(CLK) begin

					if rising_edge(CLK) then
							if(clkCount = cntEndVal) then
									DCLK <= '1';
									clkCount <= X"0000";
							else
									DCLK <= '0';
									clkCount <= clkCount + 1;
							end if;
					end if;
					
			end process;

end Behavioral;

