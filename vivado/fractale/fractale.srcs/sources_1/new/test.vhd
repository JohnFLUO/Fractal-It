----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.12.2019 10:45:55
-- Design Name: 
-- Module Name: test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
    Port (
           offset_X : out STD_LOGIC_VECTOR (31 downto 0);
           offset_Y : out STD_LOGIC_VECTOR (31 downto 0);
           zoom : out STD_LOGIC_VECTOR (31 downto 0));
end test;

architecture Behavioral of test is

begin
    offset_X <= "00111110001100011001111011100111";
    offset_Y <= "10111111000101111001100100101001";
    zoom <= "00110111100011100001010111000110";

end Behavioral;
