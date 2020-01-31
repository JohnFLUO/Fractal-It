-------------------------------
--   GESTIONNAIRE HORLOGE    --
-------------------------------

-- Description :
----------------

-- Ce module permet de générer les différents clock enables nécéssaires 
-- à l'affichage ainsi que l'horloge de sortie et l'horloge de réponse 
-- du module sous test


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library unisim;
use unisim.vcomponents.all;

entity Gestionnaire_Horloge is
    Port (
        clk             : in  std_logic;  -- horloge 100 MHz
        rst             : in  std_logic;  -- reset
        CE_3kHz         : out std_logic;  -- clock enable d'affichage 7-segments
        CE_SPI_66_67kHz : out std_logic;  -- clock enable de communication SPI_int
        CE_SPI_5Hz      : out std_logic   -- clock enable de communication SPI_ctrl
    );                                                     
end Gestionnaire_Horloge;

architecture Behavioral of Gestionnaire_Horloge is

signal s_CE_3kHz         : std_logic := '0';
signal cmpt_3kHz         : natural range 0 to 33333;     --100M/3k

signal s_CE_SPI_66_67kHz : std_logic := '0';
signal clkCount_SPI_66_67kHz    : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
constant cntEndVal_SPI_66_67kHz : STD_LOGIC_VECTOR(9 downto 0) := "1011101110";

signal s_CE_SPI_5Hz      : std_logic := '0';
signal clkCount_SPI_5Hz    : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
constant cntEndVal_SPI_5Hz : STD_LOGIC_VECTOR(23 downto 0) := X"989680";

begin

    diviseur_de_freq_3Hz : process(clk)
    begin
       if (rising_edge(clk)) then
           -- Horloge Affichage (3kHz) :
            if (cmpt_3kHz = 33333) then
                cmpt_3kHz <= 0;
            else 
                cmpt_3kHz <= cmpt_3kHz + 1;
            end if;
        end if;
    end process;
    
    CE_3kHz <= '1' when (cmpt_3kHz = 0) else '0';
    
    diviseur_de_freq_66_67kHz: process(CLK, RST) begin
        if(RST = '1')  then
            s_CE_SPI_66_67kHz <= '0';
            clkCount_SPI_66_67kHz <= "0000000000";
        elsif rising_edge(CLK) then
            if(clkCount_SPI_66_67kHz = cntEndVal_SPI_66_67kHz) then
                    s_CE_SPI_66_67kHz <= not s_CE_SPI_66_67kHz;
                    clkCount_SPI_66_67kHz <= "0000000000";
            else
                    clkCount_SPI_66_67kHz <= clkCount_SPI_66_67kHz + '1';
            end if;
        end if;
    end process;
    
      
    diviseur_de_freq_5Hz:process(CLK, RST) begin
        if(RST = '1')  then
            s_CE_SPI_5Hz <= '0';
            clkCount_SPI_5Hz <= X"000000";
        elsif rising_edge(CLK) then
            if(clkCount_SPI_5Hz = cntEndVal_SPI_5Hz) then
                s_CE_SPI_5Hz <= not s_CE_SPI_5Hz;
                clkCount_SPI_5Hz <= X"000000";
            else
                clkCount_SPI_5Hz <= clkCount_SPI_5Hz + '1';
            end if;
        end if;
    end process;


    CE_SPI_66_67kHz <= s_CE_SPI_66_67kHz;
    CE_SPI_5Hz <= s_CE_SPI_5Hz;
    
end Behavioral;
