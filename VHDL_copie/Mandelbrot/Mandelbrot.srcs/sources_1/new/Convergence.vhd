

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Convergence is
    generic(
		IMAGE_WIDTH           : integer := 640;
		IMAGE_HEIGHT          : integer := 480
	);
    port (
        -- general
        clk                   : in std_logic;
        rst                   : in std_logic;
    
        offset_x              : in std_logic_vector(9 downto 0);               
        offset_y              : in std_logic_vector(9 downto 0);  
        zoom                  : in std_logic_vector(9 downto 0); --TODO: reflexion sur le format de donnée 
        
        pixel_x               : out std_logic_vector(9 downto 0);  
        pixel_y               : out std_logic_vector(8 downto 0);
        pixel_color           : out std_logic_vector(11 downto 0)
    );
end Convergence;

architecture Behavioral of Convergence is

begin

-- TMP
    pixel_x     <= (others=>'0');
    pixel_y     <= (others=>'0');     
    pixel_color <= (others=>'0');

end Behavioral;
