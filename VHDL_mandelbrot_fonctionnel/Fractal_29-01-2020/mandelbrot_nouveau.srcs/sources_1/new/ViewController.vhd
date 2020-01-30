

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
        update                : in std_logic;

        -- valeurs de sortie
        offset_x              : out std_logic_vector(23 downto 0);               
        offset_y              : out std_logic_vector(23 downto 0);  
        zoom                  : out std_logic_vector(23 downto 0)     
    );
end ViewController;

architecture Behavioral of ViewController is

constant simple_zoom_factor     : std_logic_vector(23 downto 0) := x"018000"; -- 0.75
constant continuous_zoom_factor : std_logic_vector(23 downto 0) := x"01F800"; -- 0,984375

constant simple_inv_zoom_factor     : std_logic_vector(23 downto 0) := x"02AAAB"; -- 1,333335876
constant continuous_inv_zoom_factor : std_logic_vector(23 downto 0) := x"020821"; -- 1,01587677

signal s_zoom      : unsigned(23 downto 0); 
 
signal s_offset_x  : std_logic_vector(23 downto 0); 
signal s_offset_y  : std_logic_vector(23 downto 0); 
 

begin
    
    zoom_manager: process(clk) is
    variable s_zoom_temp : unsigned(47 downto 0);
    begin
    if rising_edge(clk) then
        if(rst = '1') then
            s_zoom <= x"00020C";  
            s_zoom_temp := x"000000000002";      
        else
            if (bouton_haut = '1') then
                if (bouton_haut_hold = '0') then -- Appui simple
                    s_zoom_temp := unsigned(s_zoom)* unsigned(simple_zoom_factor); -- zoom *= 0.75
                    
                else -- Appui continu
                    s_zoom_temp := unsigned(s_zoom) * unsigned(continuous_zoom_factor); -- zoom *= 0.98
                   
                end if;
                s_zoom <= s_zoom_temp (40 downto 17);
            elsif (bouton_bas = '1') then
                if (bouton_bas_hold = '0') then -- Appui simple
                    s_zoom_temp := unsigned(s_zoom)* unsigned(simple_inv_zoom_factor); -- zoom *= 1/0.75
                    
                else -- Appui continu
                    s_zoom_temp := unsigned(s_zoom) * unsigned(continuous_inv_zoom_factor); -- zoom *= 1/0.98
                   
                end if;
                s_zoom <= s_zoom_temp (40 downto 17);
            else 
                s_zoom <= s_zoom;
            end if;
        end if;
    end if;
    end process;
    
    zoom <= std_logic_vector(s_zoom);
    
    moving_manager : process(clk) is    
    variable v_offset_x : std_logic_vector(23 downto 0);
    variable v_offset_y : std_logic_vector(23 downto 0);     
    variable offsetplusjoy_x : signed(23 downto 0);
    variable offsetplusjoy_y : signed(23 downto 0);
    
    begin
    if rising_edge(clk) then
        if(rst = '1') then
            v_offset_x := (others => '0');        
            v_offset_y := (others => '0');
        else
            if (update = '1') then
                offsetplusjoy_x := signed(v_offset_x) + signed(val_joystick_x & "000"); 
                offsetplusjoy_y := signed(v_offset_y) + signed(val_joystick_y & "000");              
                
                v_offset_x := std_logic_vector(offsetplusjoy_x);
                v_offset_y := std_logic_vector(offsetplusjoy_y);
        
                s_offset_x <= v_offset_x;
                s_offset_y <= v_offset_y;       
            else
                s_offset_x <= s_offset_x;
                s_offset_y <= s_offset_y;
           end if;
           offset_x <= s_offset_x;
           offset_y <= s_offset_y;
        end if;       
    end if;
    end process;

    
    
end Behavioral;
