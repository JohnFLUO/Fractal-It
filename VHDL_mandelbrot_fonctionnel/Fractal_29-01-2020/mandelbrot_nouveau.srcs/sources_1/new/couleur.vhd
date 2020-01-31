----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2020 15:19:00
-- Design Name: 
-- Module Name: couleur - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity couleur is
    Port ( iteration : in STD_LOGIC_VECTOR (6 downto 0);
           couleur_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end couleur;

architecture Behavioral of couleur is

type mem_array is array (0 to 100) of std_logic_vector (7 downto 0); 
signal mem : mem_array := (
    0 => "11111111", 1 => "00000001", 2 => "00000010", 
    3 => "00000011", 4 => "00000100", 5 => "00000101", 
    6 => "00000110", 7 => "00010111", 8 => "00011000", 
    9 => "00110001",
    10 => "00110001", 11 => "00101010", 12 => "00101010",
    13 => "00111011", 14 => "00111100", 15 => "00111100", 
    16 => "01001100", 17 => "01001101", 18 => "01011101", 
    19 => "01011101", 20 => "01101101", 21 => "01101110", 
    22 => "10111111", 23 => "01111110", 24 => "01111110", 
    25 => "11001110", 26 => "10001110", 27 => "10011110", 
    28 => "11011110", 29 => "10101110", 30 => "10101110", 
    31 => "11101101", 32 => "00111011", 33 => "10111101", 
    34 => "11111101", 35 => "01001100", 36 => "11001100", 
    37 => "11011100", 38 => "01001100", 39 => "11011100", 
    40 => "11011011", 41 => "01011110", 42 => "11101011", 
    43 => "11101011", 44 => "01101110", 45 => "11101010", 
    46 => "11101001", 47 => "01111110", 48 => "11101001", 
    49 => "11101000", 50 => "10011111", 51 => "11101000",
    52 => "11100001", 53 => "10101110", 54 => "11100111",
    55 => "11100110", 56 => "10111110", 57 => "11100110",
    58 => "11100110", 59 => "11001110", 60 => "11010101",
    61 => "11010100", 62 => "11011101", 63 => "11011101",
    64 => "11000100", 65 => "11011100", 66 => "11101100",
    67 => "10110011", 68 => "11101011", 69 => "11101010",
    70 => "10100010", 71 => "11101010", 72 => "11111001",
    73 => "10010001", 74 => "11111000", 75 => "11111000",
    76 => "01110001", 77 => "11110111", 78 => "11110111",
    79 => "01100000", 80 => "11100110", 81 => "11100101",
    82 => "01010000", 83 => "11010100", 84 => "11010100",
    85 => "00110000", 86 => "11000011", 87 => "11000011",
    88 => "10100000", 89 => "10110010", 90 => "10100001",
    91 => "00010000", 92 => "10000001", 93 => "10000001",
    94 => "00001000", 95 => "01100000", 96 => "01010000",
    97 => "00000010", 98 => "00100000", 99 => "00010000",
    100 => "00000000"
    );

begin

process(clk)

    variable addr : std_logic_vector(6 downto 0);

begin
    if (clk = '1' and clk'event) then
        if (reset = '1') then
            couleur_out <= (others => '0');
        else
            addr := iteration;
            if (unsigned(addr) > 100) then
                couleur_out <= mem(to_INTEGER(to_unsigned(99,7)));
            else
                couleur_out <= mem(to_INTEGER(unsigned(iteration)) );
            end if;
        end if;
    end if;

end process;

end Behavioral;
