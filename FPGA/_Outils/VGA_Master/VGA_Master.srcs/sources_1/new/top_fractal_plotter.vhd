
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_VGA_master is
    port(
        -- Clock & Reset
        clock        : in  std_logic;
        n_reset      : in  std_logic;
        
        -- Boutons :
        button_up    : in std_logic; 
        button_down  : in std_logic; 
        button_left  : in std_logic; 
        button_right : in std_logic; 

        -- VGA 
        VGA_hs       : out std_logic;   -- horizontal vga syncr.
        VGA_vs       : out std_logic;   -- vertical vga syncr.
        VGA_red      : out std_logic_vector(3 downto 0);   -- red output
        VGA_green    : out std_logic_vector(3 downto 0);   -- green output
        VGA_blue     : out std_logic_vector(3 downto 0)    -- blue output
    );
end top_VGA_master;

architecture Behavioral of top_VGA_master is

-- Clock & Reset
signal s_reset          : std_logic;
 
-- Buttons 
signal s_button_up      : std_logic;
signal s_button_down    : std_logic;
signal s_button_left    : std_logic;
signal s_button_right   : std_logic;

-- On screen position
signal s_position       : std_logic_vector(18 downto 0);


begin


-------------------------------
--      Reset & Clock        --
-------------------------------

    s_reset <= not n_reset;
   
   
   
-------------------------------
--          Boutons          --
-------------------------------
 
    inst_button_up : entity work.push_detector -- ^
    generic map(
        STABILITY_TIME    => 10000, -- [us] 
        CLOCK_FREQUENCY   => 100,   -- [MHz]
        BURST_ON_HOLD     => true,         
        BURST_PERIOD      => 150,   -- [ms] 
        TIME_UNTIL_BURST  => 750    -- [ms] 
    )
    port map(
        clk               => clock,
        reset             => s_reset,
        btn_in            => button_up,
        btn_pushed        => s_button_up,
        btn_released      => open,
        btn_hold          => open
    );
 
    inst_button_down : entity work.push_detector -- v
    generic map(
        STABILITY_TIME    => 10000, -- [us] 
        CLOCK_FREQUENCY   => 100,   -- [MHz]
        BURST_ON_HOLD     => true,         
        BURST_PERIOD      => 150,   -- [ms] 
        TIME_UNTIL_BURST  => 750    -- [ms] 
    )
    port map(
        clk               => clock,
        reset             => s_reset,
        btn_in            => button_down,
        btn_pushed        => s_button_down,
        btn_released      => open,
        btn_hold          => open
    );      
    
     
   inst_button_left : entity work.push_detector -- <
   generic map(
       STABILITY_TIME    => 10000, -- [us] 
       CLOCK_FREQUENCY   => 100,   -- [MHz]
       BURST_ON_HOLD     => true,         
       BURST_PERIOD      => 150,   -- [ms] 
       TIME_UNTIL_BURST  => 750    -- [ms] 
   )
   port map(
       clk               => clock,
       reset             => s_reset,
       btn_in            => button_left,
       btn_pushed        => s_button_left,
       btn_released      => open,
       btn_hold          => open
   );            
    
    inst_button_right : entity work.push_detector -- >
    generic map(
      STABILITY_TIME    => 10000, -- [us] 
      CLOCK_FREQUENCY   => 100,   -- [MHz]
      BURST_ON_HOLD     => true,         
      BURST_PERIOD      => 150,   -- [ms] 
      TIME_UNTIL_BURST  => 750    -- [ms] 
    )
    port map(
      clk               => clock,
      reset             => s_reset,
      btn_in            => button_right,
      btn_pushed        => s_button_right,
      btn_released      => open,
      btn_hold          => open
    );                
   
   
   
-------------------------------
--        Controleur         --
-------------------------------

    inst_controller : entity work.Controller
    generic map (
        VGA_WIDTH      => 640,
        VGA_HEIGHT     => 480
    )
    port map (
        -- Clock & Reset
        clk            => clock,
        reset          => s_reset,
        
        -- Buttons 
        button_up      => s_button_up,
        button_down    => s_button_down,
        button_left    => s_button_left,
        button_right   => s_button_right,
        
        -- Out screen position
        position       => s_position
    );
    
    
    
-------------------------------
--         Affichage         --
-------------------------------
    
    inst_diplay_module : entity work.Display_Module
    generic map(
        bit_per_pixel  => 8,
        grayscale      => false
    )
    port map(
        -- Clock & Reset
        clk           => clock,
        reset         => s_reset,
       
        position      => s_position,
               
        -- VGA
        VGA_hs       =>  VGA_hs,       
        VGA_vs       =>  VGA_vs,        
        VGA_red      =>  VGA_red,      
        VGA_green    =>  VGA_green,   
        VGA_blue     =>  VGA_blue    
    );
        

end Behavioral;
