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
        clk           : in  std_logic;  -- horloge 100 MHz
        rst           : in  std_logic;  -- reset
        CE_3kHz       : out std_logic   -- clock enable d'affichage 7-segments
    );                                                     
end Gestionnaire_Horloge;

architecture Behavioral of Gestionnaire_Horloge is

signal s_CE_3kHz      : std_logic := '0';
signal cmpt_3kHz      : natural range 0 to 33333;     --100M/3k

begin

    diviseur_de_freq: process(clk)
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
    
end Behavioral;
