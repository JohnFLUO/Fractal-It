

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ViewController is
    port (
        -- general
        clk                   : in std_logic;
        rst                   : in std_logic;
        
        -- valeurs d'entrée
        val_joystick_x        : in std_logic_vector(9 downto 0);               
        val_joystick_y        : in std_logic_vector(9 downto 0);  
        bouton_haut           : in std_logic;
        bouton_haut_hold      : in std_logic;
        bouton_bas            : in std_logic;
        bouton_bas_hold       : in std_logic;

        -- valeurs de sortie
        offset_x              : out std_logic_vector(9 downto 0);               
        offset_y              : out std_logic_vector(9 downto 0);  
        zoom                  : out std_logic_vector(9 downto 0)    --TODO: reflexion sur le format de donnée  
    );
end ViewController;

architecture Behavioral of ViewController is

constant simple_zoom_factor     : integer := 50;
constant continuous_zoom_factor : integer := 5;

signal s_zoom : unsigned(9 downto 0); --TODO: reflexion sur le format de donnée  

begin
    
    zoom_manager: process(bouton_haut, bouton_haut_hold, bouton_bas, bouton_bas_hold) is
    begin
        if (bouton_haut = '1') then
            if (bouton_haut_hold = '0') then -- Appui simple
                s_zoom <= s_zoom + simple_zoom_factor; -- zoom *= 0.75
            else -- Appui continu
                s_zoom <= s_zoom + simple_zoom_factor; -- zoom *= 0.90
            end if;
        elsif (bouton_bas = '1') then
            if (bouton_bas_hold = '0') then -- Appui simple
                s_zoom <= s_zoom - simple_zoom_factor; -- zoom /= 0.75
            else -- Appui continu
                s_zoom <= s_zoom - simple_zoom_factor; -- zoom /= 0.90
            end if;
        else
            s_zoom <= s_zoom;
        end if;
    end process;
    
    zoom <= std_logic_vector(s_zoom);
    
end Behavioral;
