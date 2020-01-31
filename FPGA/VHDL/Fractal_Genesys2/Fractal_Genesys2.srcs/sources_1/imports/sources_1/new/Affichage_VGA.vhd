-------------------------------
--        AFFICHAGE          --
-------------------------------

-- Description :
----------------

-- Ce module permet de gérer l'affichage sur afficheurs 7-segments  
-- ainsi que sur l'écran VGA


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Char7seg.ALL;

entity Affichage_VGA is
    generic(
        IMAGE_WIDTH           : integer := 640;
        IMAGE_HEIGHT          : integer := 480
    );
    Port (
        -- general
        clk                   : in std_logic;
        rst                   : in std_logic;
        
        -- pixel
        --pixel_x               : in std_logic_vector(9 downto 0);  
        --pixel_y               : in std_logic_vector(8 downto 0);
        addr : in std_logic_vector(18 downto 0);
        pixel_color           : in std_logic_vector(7 downto 0);
        
        -- VGA
        VGA_hs                : out std_logic;
        VGA_vs                : out std_logic;
        VGA_red               : out std_logic_vector(3 downto 0);
        VGA_green             : out std_logic_vector(3 downto 0);
        VGA_blue              : out std_logic_vector(3 downto 0)
    );
end Affichage_VGA;

architecture Behavioral of Affichage_VGA is

-- VGA Module
constant bit_per_pixel : integer range 1 to 12 := 8; 
signal s_ADDR          : std_logic_vector(18 downto 0);
signal s_data_in       : std_logic_vector(bit_per_pixel - 1 downto 0);
signal s_data_write    : std_logic;
signal s_data_out      : std_logic_vector(bit_per_pixel - 1 downto 0);

begin

    s_data_write <= '1';
-------------------------------
--          VGA              --
-------------------------------
    
    --s_ADDR <= std_logic_vector(unsigned(pixel_x) + to_unsigned(IMAGE_WIDTH, 10) * unsigned(pixel_y));
    
    inst_VGA_bitmap : entity work.VGA_bitmap_640x480
    generic map (
        bit_per_pixel   => bit_per_pixel,
        grayscale       => false         
    )
    port map(
        clk             => clk,
        reset           => rst,
        VGA_hs          => VGA_hs,       
        VGA_vs          => VGA_vs,       
        VGA_red         => VGA_red,      
        VGA_green       => VGA_green,    
        VGA_blue        => VGA_blue,     
        
        ADDR            => addr,          
        data_in         => pixel_color,       
        data_write      => s_data_write,
        data_out        => s_data_out      
    );

end Behavioral;
