
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Controller is
    generic(
        VGA_WIDTH      : integer := 640;
        VGA_HEIGHT     : integer := 480
    );
    port(
        -- Clock & Reset
        clk            : in  std_logic;
        reset          : in  std_logic;
        
        -- Buttons 
        button_up      : in  std_logic;
        button_down    : in  std_logic;
        button_left    : in  std_logic;
        button_right   : in  std_logic;
        
        -- Out screen position
        position       : out  std_logic_vector(18 downto 0)
    );
end Controller;

architecture Behavioral of Controller is

constant MAXIMUM_ADDR : integer := VGA_WIDTH * VGA_HEIGHT;
constant ROW_UNIT     : integer := 1;
constant COLUMN_UNIT  : integer := VGA_WIDTH;

-- VGA controller
signal s_pos : unsigned(18 downto 0);

begin

    p_control : process(clk)
    begin
        if rising_edge(clk) then
            if button_up = '1' and s_pos > COLUMN_UNIT then
                s_pos <= s_pos - COLUMN_UNIT;
            elsif button_down = '1' and s_pos < MAXIMUM_ADDR - COLUMN_UNIT then
                s_pos <= s_pos + COLUMN_UNIT;
            elsif button_left = '1' and s_pos > ROW_UNIT then
                s_pos <= s_pos - ROW_UNIT;
            elsif button_right = '1'  and s_pos < MAXIMUM_ADDR - ROW_UNIT then
                s_pos <= s_pos + ROW_UNIT;
            else
                s_pos <= s_pos;
            end if;
        end if;
    end process;
    
    position <= std_logic_vector(s_pos);
    
end Behavioral;