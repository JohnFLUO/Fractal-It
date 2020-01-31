---------------------------------------------------------------------------------------
-- Company: Digilent Inc.
-- Engineer: Josh Sackos
-- 
-- Create Date:    07/11/2012
-- Module Name:    PmodJSTK_Demo 
-- Project Name: 	 PmodJSTK_Demo
-- Target Devices: Nexys3
-- Tool versions:  ISE 14.1
-- Description: This is a demo for the Digilent PmodJSTK. Data is sent and received
--					 to and from the PmodJSTK at a frequency of 1kHz, and positional 
--					 data is displayed on the seven segment display (SSD). The positional
--					 data of the joystick ranges from 0 to 1023 in both the X and Y
--					 directions. Only one coordinate can be displayed on the SSD at a
--					 time, therefore switch SW0 is used to select which coordinate's data
--	   			 to display. Postional data displayed on the SSD will be updated at a
--					 frequency of 5Hz. The status of the buttons on the PmodJSTK are
--					 displayed on LD2, LD1, and LD0 on the Nexys3. The LEDs will
--					 illuminate when a button is pressed. Switches SW2 adn SW1 on the
--					 Nexys3 will turn on LD1 and LD2 on the PmodJSTK respectively. Button
--					 BTND on the Nexys3 is used for reseting the demo. The PmodJSTK
--					 connects to pins [4:1] on port JA on the Nexys3. SPI mode 0 is used
--					 for communication between the PmodJSTK and the Nexys3.
--
--					 NOTE: The digits on the SSD may at times appear to flicker, this
--						    is due to small pertebations in the positional data being read
--							 by the PmodJSTK's ADC. To reduce the flicker simply reduce
--							 the rate at which the data being displayed is updated.
--
-- Revision History: 
-- 						Revision 0.01 - File Created (Josh Sackos)
---------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.std_logic_arith.all;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;


--  ===================================================================================
--  								Define Module, Inputs and Outputs
--  ===================================================================================
entity JSTK is
    Port ( clk              : in  STD_LOGIC;			-- 100Mhz onboard clock
           rst              : in  STD_LOGIC;			-- Button D
           MISO             : in  STD_LOGIC;			-- Master In Slave Out, JA3
           CE_SPI_5Hz       : in  STD_LOGIC;            -- Serial Clock, Pin 4, Port JA
           CE_SPI_66_67kHz  : in  STD_LOGIC;            -- Serial Clock, Pin 4, Port JA
           SS               : out STD_LOGIC;			-- Slave Select, Pin 1, Port JA
           MOSI             : out STD_LOGIC;			-- Master Out Slave In, Pin 2, Port JA
           SCLK             : out STD_LOGIC;
           X_OFFSET         : out STD_LOGIC_VECTOR(9 downto 0);   
           Y_OFFSET         : out STD_LOGIC_VECTOR(9 downto 0)
           );         
end JSTK;

architecture Behavioral of JSTK is

--  ===================================================================================
-- 							  			Signals and Constants
--  ===================================================================================
    
    
    signal BUSY :    STD_LOGIC := '0';						-- Signal indicating that SPI interface is busy
    signal RxData :  STD_LOGIC_VECTOR(7 downto 0);	        -- Output data from SPI_Int
    signal getByte : STD_LOGIC;							    -- Initiates a data byte transfer in SPI_Int
    signal sndData : STD_LOGIC_VECTOR(7 downto 0) := X"00"; -- Data to be sent to Slave
    signal DOUT :    STD_LOGIC_VECTOR (39 downto 0);        -- Signal to send/receive data to/from PmodJSTK
    signal sndRec :  STD_LOGIC;                             -- Signal output data (X/Y) Offset
   
        
        
        
-- ====================================================================================
-- 							       		Components
-- ====================================================================================

    -- **********************************************
    -- 					SPI Controller
    -- **********************************************
    component spiCtrl

         Port ( CLK : in  STD_LOGIC;
                RST : in  STD_LOGIC;
                sndRec : in STD_LOGIC;
                BUSY : in STD_LOGIC;
                DIN : in  STD_LOGIC_VECTOR(7 downto 0);
                RxData : in  STD_LOGIC_VECTOR(7 downto 0);
                SS : out STD_LOGIC;
                getByte : out STD_LOGIC;
                sndData : inout STD_LOGIC_VECTOR(7 downto 0);
                DOUT : inout STD_LOGIC_VECTOR(39 downto 0)
         );

    end component;

    -- **********************************************
    -- 					SPI Interface
    -- **********************************************
    component spiMode0

         Port ( CLK : in  STD_LOGIC;
                RST : in  STD_LOGIC;
                sndRec : in STD_LOGIC;
                DIN : in  STD_LOGIC_VECTOR(7 downto 0);
                MISO : in  STD_LOGIC;
                MOSI : out STD_LOGIC;
                SCLK : out STD_LOGIC;
                BUSY : out STD_LOGIC;
                DOUT : out STD_LOGIC_VECTOR (7 downto 0)
         );

    end component;
		
--  ===================================================================================
-- 							  				Implementation
--  ===================================================================================
begin

        -------------------------------------------------
        --  	  				SPI Controller
        -------------------------------------------------
        SPI_Ctrl : spiCtrl port map(
                CLK=>CE_SPI_66_67kHz,
                RST=>rst,
                sndRec=>CE_SPI_5Hz,
                BUSY=>BUSY,
                DIN=>(others => '0'),
                RxData=>RxData,
                SS=>SS,
                getByte=>getByte,
                sndData=>sndData,
                DOUT=>DOUT
        );

        -------------------------------------------------
        --  	  				  SPI Mode 0
        -------------------------------------------------
        SPI_Int : spiMode0 port map(
                CLK=>CE_SPI_66_67kHz,
                RST=>rst,
                sndRec=>getByte,
                DIN=>sndData,
                MISO=>MISO,
                MOSI=>MOSI,
                SCLK=>SCLK,
                BUSY=>BUSY,
                DOUT=>RxData
        );

			
	dead_zone : process(DOUT) is
	variable tempX : std_logic_vector(9 downto 0) := (others => '0');
	variable tempY : std_logic_vector(9 downto 0) := (others => '0');
	begin		
	    tempX := std_logic_vector(  unsigned( (DOUT(9 downto 8)   & DOUT(23 downto 16)) ) - to_unsigned(512,10));			        
        tempY := std_logic_vector(  unsigned( (DOUT(25 downto 24) & DOUT(39 downto 32)) ) - to_unsigned(512,10));
        
        if( signed(tempX) > to_signed(-51, 10) and signed(tempX) < to_signed(51, 10)) then
            tempX := (others => '0');
        end if;
        
        if( signed(tempY) > to_signed(-51, 10) and signed(tempY) < to_signed(51, 10)) then
           tempY := (others => '0');
        end if;
        
        --tempX := (DOUT(9 downto 8)   & DOUT(23 downto 16));
        --tempY := (DOUT(25 downto 24) & DOUT(39 downto 32));
        X_OFFSET <= tempX;
        Y_OFFSET <= tempY;

    end process;
     
--     Update : process (DOUT)
--        begin 
        
        
--        X_OFFSET    <= std_logic_vector(  unsigned( (DOUT(9 downto 8) & DOUT(23 downto 16)) ) - to_unsigned(512,10))  ;
--        Y_OFFSET    <= (DOUT(25 downto 24) & DOUT(39 downto 32));
        
        
--        end process;


end Behavioral;

