-------------------------------------
--          Mandelbrot             --
--            Plotter              --
-------------------------------------

-- version 1.0 (23/11/2019 18:30)
-- (c) 2019 Jonathan SAUSSEREAU
--          Denis LE HEGARAT
--          Augustin HUET
--          Florian LOUPIAS


-- Description :
----------------

-- Ce projet permet d'afficher sur un écran VGA la fractale de Mandelbrot


-- Utilisation :
----------------

-- Le projet est calibré pour fonctionner sur carte Digilent Nexys4 DDR
-- Le déplacement s'effectue à l'aide d'un PMOD joystick placé sur le connecteur JC
-- Le zoom s'effectue à l'aide des boutons haut et bas de la Nexys4 DRR


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top_Mandelbrot is
    Port (
        -- general
        clock           : in std_logic;
        n_reset         : in std_logic;
        
        -- interrupteurs
        switch          : in std_logic_vector(15 downto 0);
        
        -- boutons
        bouton_haut     : in std_logic;
        bouton_bas      : in std_logic;
        bouton_gauche   : in std_logic;
        bouton_droite   : in std_logic;
        bouton_centre   : in std_logic;
        
        -- 7 seg 
        sept_segment    : out std_logic_vector(6 downto 0);
        an              : out std_logic_vector(7 downto 0);
        point           : out std_logic;
        
        -- VGA
        VGA_hs          : out std_logic;                      -- horisontal vga syncr.
        VGA_vs          : out std_logic;                      -- vertical vga syncr.
        VGA_red         : out std_logic_vector(3 downto 0);   -- red output
        VGA_green       : out std_logic_vector(3 downto 0);   -- green output
        VGA_blue        : out std_logic_vector(3 downto 0);   -- blue output
        
        -- LED
        led             : out std_logic_vector(15 downto 0);
        rgb_17          : out std_logic_vector(2 downto 0);
        rgb_16          : out std_logic_vector(2 downto 0)
    );
end top_Mandelbrot;

architecture Top_Level of top_Mandelbrot is

-- Reset & Clock
signal s_rst                    : std_logic;
signal s_CE_3kHz                : std_logic;

-- Boutons
signal s_bouton_haut            : std_logic;
signal s_bouton_haut_hold       : std_logic;
signal s_bouton_bas             : std_logic;
signal s_bouton_bas_hold        : std_logic;
signal s_bouton_gauche          : std_logic;
signal s_bouton_droite          : std_logic;
signal s_bouton_centre          : std_logic;
signal s_bouton_cpu_rst         : std_logic;

-- Joysticks
signal s_val_joystick_x         : std_logic_vector(9 downto 0);
signal s_val_joystick_y         : std_logic_vector(9 downto 0);

-- Processed inputs 
signal s_offset_x               : std_logic_vector(9 downto 0);
signal s_offset_y               : std_logic_vector(9 downto 0);
signal s_zoom                   : std_logic_vector(9 downto 0);

signal s_pixel_x                : std_logic_vector(9 downto 0);  
signal s_pixel_y                : std_logic_vector(8 downto 0);
signal s_pixel_color            : std_logic_vector(11 downto 0);

begin
   
   
-------------------------------
--      Reset & Clock        --
-------------------------------

    s_rst <= not n_reset;
    
    inst_Gestionnaire_Horloge: entity work.Gestionnaire_Horloge
    port map(
        clk           => clock,
        rst           => s_rst,
        CE_3kHz       => s_CE_3kHz  -- clock enable d'affichage 7-segments
    );                           
   
   
-------------------------------
--          Boutons          --
-------------------------------
 
    gestion_bouton_haut : entity work.push_detector -- ^
    generic map(
        STABILITY_TIME    => 10000, -- [us] 
        CLOCK_FREQUENCY   => 100,   -- [MHz]
        BURST_ON_HOLD     => true,         
        BURST_PERIOD      => 150,   -- [ms] 
        TIME_UNTIL_BURST  => 750    -- [ms] 
    )
    port map(
        clk               => clock,
        reset             => s_rst,
        btn_in            => bouton_haut,
        btn_pushed        => s_bouton_haut,
        btn_released      => open,
        btn_hold          => s_bouton_haut_hold
    );
 
    gestion_bouton_bas : entity work.push_detector -- v
    generic map(
        STABILITY_TIME    => 10000, -- [us] 
        CLOCK_FREQUENCY   => 100,   -- [MHz]
        BURST_ON_HOLD     => true,         
        BURST_PERIOD      => 150,   -- [ms] 
        TIME_UNTIL_BURST  => 750    -- [ms] 
    )
    port map(
        clk               => clock,
        reset             => s_rst,
        btn_in            => bouton_bas,
        btn_pushed        => s_bouton_bas,
        btn_released      => open,
        btn_hold          => s_bouton_bas_hold
 );                    
   
    gestion_bouton_centre : entity work.push_detector
    generic map(
        STABILITY_TIME    => 10000, -- [us] 
        CLOCK_FREQUENCY   => 100,   -- [MHz]
        BURST_ON_HOLD     => false,           
        BURST_PERIOD      => 150,   -- [ms]   
        TIME_UNTIL_BURST  => 750    -- [ms]   
    )
    port map(
        clk               => clock,
        reset             => s_rst,
        btn_in            => bouton_centre,
        btn_pushed        => s_bouton_centre,
        btn_released      => open,
        btn_hold          => open
    );
    
    
    
    inst_ViewController: entity work.ViewController
    port map(
        clk               => clock,
        rst               => s_rst,
      
        val_joystick_x    => s_val_joystick_x, 
        val_joystick_y    => s_val_joystick_y, 
        bouton_haut       => s_bouton_haut,  
        bouton_haut_hold  => s_bouton_haut_hold,    
        bouton_bas        => s_bouton_bas,  
        bouton_bas_hold   => s_bouton_bas_hold,     
                          
        offset_x          => s_offset_x,       
        offset_y          => s_offset_y,       
        zoom              => s_zoom           
    );

                          
-------------------------------
--         Calculs           --
-------------------------------
                              
    inst_Convergence: entity work.Convergence 
    port map (
        clk               => clock, 
        rst               => s_rst,
      
        offset_x          => s_offset_x, 
        offset_y          => s_offset_y, 
        zoom              => s_zoom, 
      
        pixel_x           => s_pixel_x,          
        pixel_y           => s_pixel_y,         
        pixel_color       => s_pixel_color
    );
    
    
-------------------------------
--        Affichage          --
-------------------------------
 
    inst_Affichage_7seg: entity work.Affichage_7seg 
    port map (
        clk               => clock, 
        rst               => s_rst,
        CE_3kHz           => s_CE_3kHz,
       
        val_joystick_x    => s_val_joystick_x, 
        val_joystick_y    => s_val_joystick_y,   
       
        Num_aff           => an, 
        Valeur_aff        => sept_segment,
        point             => point
    );
    
    inst_Affichage_VGA: entity work.Affichage_VGA 
    port map (
        clk               => clock, 
        rst               => s_rst,
       
        pixel_x           => s_pixel_x,          
        pixel_y           => s_pixel_y,         
        pixel_color       => s_pixel_color,
       
        VGA_hs            => VGA_hs,       
        VGA_vs            => VGA_vs,       
        VGA_red           => VGA_red,      
        VGA_green         => VGA_green,    
        VGA_blue          => VGA_blue
    );


end Top_Level;
