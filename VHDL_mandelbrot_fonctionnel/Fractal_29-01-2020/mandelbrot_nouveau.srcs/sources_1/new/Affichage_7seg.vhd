-------------------------------
--        AFFICHAGE          --
-------------------------------

-- Description :
----------------

-- Ce module permet de gerer l'affichage sur afficheurs 7-segments  
-- ainsi que sur l'ecran VGA


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Char7seg.ALL;

entity Affichage_7seg is
    Port (
        -- general
        clk                   : in std_logic;
        rst                   : in std_logic;
        CE_3kHz               : in std_logic;
                          
        -- valeurs a afficher
        val_joystick_x        : in std_logic_vector(9 downto 0);               
        val_joystick_y        : in std_logic_vector(9 downto 0);     
                              
        -- 7 seg
        Num_aff               : out std_logic_vector(7 downto 0);
        Valeur_aff            : out std_logic_vector(6 downto 0);
        point                 : out std_logic
    );
end Affichage_7seg;

architecture Behavioral of Affichage_7seg is

signal septseg                                                      : std_logic_vector (6 downto 0);
signal aff, aff_0, aff_1, aff_2, aff_3, aff_4, aff_5, aff_6, aff_7  : std_logic_vector (5 downto 0);
signal cmpt                                                         : unsigned (2 downto 0);
signal points                                                       : std_logic_vector (7 downto 0);

component decodeur_7seg
    Port ( 
        E : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
end component;

begin


-------------------------------
--      AFFICHEUR 7SEG       --
-------------------------------

    p_afficheur: process(val_joystick_x, val_joystick_y)
    begin
    
        -- Afficheur gauche :
        if (signed(val_joystick_x) < 0) then
            aff_0 <= char_tiret_milieu; 
            aff_1 <= std_logic_vector(resize(((10-((signed(val_joystick_x))/100)) mod 10), 6));
            aff_2 <= std_logic_vector(resize(((10-((signed(val_joystick_x))/10)) mod 10), 6));
            aff_3 <= std_logic_vector(resize(((10-(signed(val_joystick_x))) mod 10), 6));                
        else 
            aff_0 <= char_vide;
            aff_1 <= std_logic_vector(resize((signed(val_joystick_x))/100, 6));
            aff_2 <= std_logic_vector(resize(((signed(val_joystick_x))/10) mod 10, 6));
            aff_3 <= std_logic_vector(resize((signed(val_joystick_x)) mod 10, 6));
        end if;
        
        -- Afficheur droite :
        if (signed(val_joystick_y) < 0) then
            aff_4 <= char_tiret_milieu; 
            aff_5 <= std_logic_vector(resize(((10-((signed(val_joystick_y))/100)) mod 10), 6));
            aff_6 <= std_logic_vector(resize(((10-((signed(val_joystick_y))/10)) mod 10), 6));
            aff_7 <= std_logic_vector(resize(((10-(signed(val_joystick_y))) mod 10), 6));                
        else 
            aff_4 <= char_vide;
            aff_5 <= std_logic_vector(resize((signed(val_joystick_y))/100, 6));
            aff_6 <= std_logic_vector(resize(((signed(val_joystick_y))/10) mod 10, 6));
            aff_7 <= std_logic_vector(resize((signed(val_joystick_y)) mod 10, 6));
        end if;
    
        points <= "00000000";
    end process;
    
    transcodeur_7seg: decodeur_7seg port map (E => aff, S => septseg);
    
    p_decod_7seg: process (clk)
    begin  
        if (RISING_EDGE (clk)) then
            if (rst = '1') then 
                cmpt <= "000";
            elsif (CE_3kHz = '1') then
                -- Affichage :
                Valeur_aff <= std_logic_vector(septseg);
                point <= not points(to_integer(7-cmpt));
                
                case cmpt is
                    when "000"  => aff <= aff_6; Num_aff <= "11111110";
                    when "001"  => aff <= aff_5; Num_aff <= "11111101";
                    when "010"  => aff <= aff_4; Num_aff <= "11111011";
                    when "011"  => aff <= aff_3; Num_aff <= "11110111";
                    when "100"  => aff <= aff_2; Num_aff <= "11101111";
                    when "101"  => aff <= aff_1; Num_aff <= "11011111";
                    when "110"  => aff <= aff_0; Num_aff <= "10111111";
                    when "111"  => aff <= aff_7; Num_aff <= "01111111";
                    when others => aff <= aff_1; Num_aff <= "11111111";
                end case;
                
                if (cmpt = "111") then 
                    cmpt <= "000";
                else
                    cmpt <= cmpt + 1;
                end if;
            end if;
        end if;
    end process;
    
end Behavioral;
