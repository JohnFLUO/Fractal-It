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

-- Ce projet permet d'afficher sur un ecran VGA la fractale de Mandelbrot


-- Utilisation :
----------------

-- Le projet est calibre pour fonctionner sur carte Digilent Nexys7a
-- Le déplacement s'effectue a l'aide d'un PMOD joystick placé sur le connecteur JC
-- Le zoom s'effectue a l'aide des boutons haut et bas de la Nexys4 DRR


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
        rgb_16          : out std_logic_vector(2 downto 0);
        
        -- SPI
        MISO            : in  STD_LOGIC;	                  -- Master In Slave Out, JA3
        SS              : out  STD_LOGIC;                     -- Slave Select, Pin 1, Port JA
        MOSI            : out  STD_LOGIC;                     -- Master Out Slave In, Pin 2, Port JA
        SCLK            : out  STD_LOGIC                      -- Serial Clock, Pin 4, Port JA
    );
end top_Mandelbrot;

architecture Top_Level of top_Mandelbrot is

-- Reset & Clock
signal s_rst                    : std_logic;
signal s_CE_3kHz                : std_logic;
signal s_CE_SPI_66_67kHz        : std_logic;
signal s_CE_SPI_5Hz             : std_logic;

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
signal s_offset_x               : std_logic_vector(23 downto 0);
signal s_offset_y               : std_logic_vector(23 downto 0);
signal s_zoom                   : std_logic_vector(23 downto 0);

signal s_addr                   : std_logic_vector(18 downto 0);  
signal s_pixel_color            : std_logic_vector(7 downto 0);
signal s_update                 : std_logic;

begin
   
   
-------------------------------
--      Reset & Clock        --
-------------------------------

    s_rst <= not n_reset;
    
    inst_Gestionnaire_Horloge: entity work.Gestionnaire_Horloge
    port map(
        clk             => clock,
        rst             => s_rst,
        CE_3kHz         => s_CE_3kHz,           -- clock enable d'affichage 7-segments
        CE_SPI_66_67kHz => s_CE_SPI_66_67kHz,   -- clock enable de communication SPI_int
        CE_SPI_5Hz      => s_CE_SPI_5Hz         -- clock enable de communication SPI_ctrl
    );                         
   
   
-------------------------------
--          Boutons          --
-------------------------------
 
    gestion_bouton_haut : entity work.push_detector -- ^
    generic map(
        STABILITY_TIME    => 10000, -- [us] 
        CLOCK_FREQUENCY   => 100,   -- [MHz]
        BURST_ON_HOLD     => true,         
        BURST_PERIOD      => 50,   -- [ms] 
        TIME_UNTIL_BURST  => 500    -- [ms] 
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
        BURST_PERIOD      => 50,   -- [ms] 
        TIME_UNTIL_BURST  => 500    -- [ms] 
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
    
    joystick : entity work.JSTK
     port map( clk             => clock,			
              rst              => s_rst,            
              MISO             => MISO,           
              CE_SPI_5Hz       => s_CE_SPI_5Hz,           
              CE_SPI_66_67kHz  => s_CE_SPI_66_67kHz,           
              SS               => SS,           
              MOSI             => MOSI,           
              SCLK             => SCLK,
              X_OFFSET         => s_val_joystick_x,   
              Y_OFFSET         => s_val_joystick_y
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
        update            => s_update,    
                          
        offset_x          => s_offset_x,       
        offset_y          => s_offset_y,       
        zoom              => s_zoom           
    );

                          
-------------------------------
--         Calculs           --
-------------------------------
                              
    inst_Convergence: entity work.Convergence 
    generic map(
        ITERATION_NUMBER  => 28 -- Nombre de bloc "It�ration"        
    )
    port map (
        clk               => clock, 
        reset             => s_rst,
      
        offset_X          => s_offset_x, 
        offset_Y          => s_offset_y, 
        zoom              => s_zoom, 
        update            => s_update,
            
        addr            => s_addr,         
        couleur_out     => s_pixel_color       
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
              
        addr           => s_addr,         
        pixel_color       => s_pixel_color,
       
        VGA_hs            => VGA_hs,       
        VGA_vs            => VGA_vs,       
        VGA_red           => VGA_red,      
        VGA_green         => VGA_green,    
        VGA_blue          => VGA_blue
    );


end Top_Level;
