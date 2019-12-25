----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.12.2019 10:56:44
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

signal clock : std_logic;
signal reset : std_logic;
signal x : STD_LOGIC_VECTOR (9 downto 0);
signal y : STD_LOGIC_VECTOR (8 downto 0);
signal couleur : STD_LOGIC_VECTOR (11 downto 0);

constant clock_period: time := 10 ns;

component main IS
port (
clk : IN STD_LOGIC;
reset : IN STD_LOGIC;
x : OUT STD_LOGIC_VECTOR (9 downto 0);
y : OUT STD_LOGIC_VECTOR (8 downto 0);
couleur : OUT STD_LOGIC_VECTOR (11 downto 0));
end component;

begin

    grp_main : component main
    port map (
        clk => clock,
        reset => reset,
        x => x,
        couleur => couleur,
        y => y);
        
    init : process
    begin
        reset <= '1';
        wait for clock_period;
        reset <= '0';
        wait;
    end process;
        
    ck : process
    begin
        clock <= '0';
        wait for clock_period/2;
        clock <= '1';
        wait for clock_period/2;
    end process;
        
end Behavioral;