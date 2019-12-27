
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Display_Module is
    generic(
        bit_per_pixel  : integer range 1 to 12:=1;    -- number of bits per pixel
        grayscale      : boolean := false -- should data be displayed in grayscale
    );
    port(
        -- Clock & Reset
        clk            : in  std_logic;
        reset          : in  std_logic;
        
        position       : in  std_logic_vector(18 downto 0);
                
        -- VGA 
        VGA_hs         : out std_logic;   -- horizontal vga syncr.
        VGA_vs         : out std_logic;   -- vertical vga syncr.
        VGA_red        : out std_logic_vector(3 downto 0);   -- red output
        VGA_green      : out std_logic_vector(3 downto 0);   -- green output
        VGA_blue       : out std_logic_vector(3 downto 0)    -- blue output
    );
end Display_Module;

architecture Behavioral of Display_Module is

-- VGA Module
signal s_ADDR          : unsigned(18 downto 0);
signal s_data_in       : std_logic_vector(bit_per_pixel - 1 downto 0);
signal s_data_write    : std_logic;
signal s_data_out      : std_logic_vector(bit_per_pixel - 1 downto 0);

constant MAXIMUM_ADDR : integer := 307200;

begin

    p_counter : process(clk) is
    begin
        if rising_edge(clk) then
            if (s_ADDR = MAXIMUM_ADDR) then
                s_ADDR <= (others => '0');
            else 
                s_ADDR <= s_ADDR + 1;
            end if;
        end if;
    end process;
    
    
    p_colormap : process(clk) is
    begin
        if rising_edge(clk) then
            if (unsigned(position) = s_ADDR) then
                s_data_in <= "11100000";
            else
                s_data_in <= "11111111";
            end if;
        end if;
    end process;
    
    
    s_data_write <= '1';
    
    
    inst_VGA_bitmap : entity work.VGA_bitmap_640x480
    generic map (
        bit_per_pixel   => bit_per_pixel,   -- number of bits per pixel
        grayscale       => grayscale        -- should data be displayed in grayscale
    )
    port map(
        clk             => clk,
        reset           => reset,
        VGA_hs          => VGA_hs,       
        VGA_vs          => VGA_vs,       
        VGA_red         => VGA_red,      
        VGA_green       => VGA_green,    
        VGA_blue        => VGA_blue,     
        
        ADDR            => std_logic_vector(s_ADDR),          
        data_in         => s_data_in,       
        data_write      => s_data_write,
        data_out        => s_data_out      
    );

end Behavioral;
