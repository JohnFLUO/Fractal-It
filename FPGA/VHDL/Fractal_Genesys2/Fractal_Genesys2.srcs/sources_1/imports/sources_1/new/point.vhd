----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2020 15:19:00
-- Design Name: 
-- Module Name: point - Behavioral
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

entity point is
    Port ( offset_X : in STD_LOGIC_VECTOR (23 downto 0);
           offset_Y : in STD_LOGIC_VECTOR (23 downto 0);
           zoom : in STD_LOGIC_VECTOR (23 downto 0);
           startreal : out std_logic_vector(23 downto 0);
           startimag : out std_logic_vector(23 downto 0);
           addr : out std_logic_vector(18 downto 0);
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : out STD_LOGIC;
           update : out std_logic);
end point;

architecture Behavioral of point is

signal x : signed(18 downto 0) := (others => '0');
signal y : signed(18 downto 0) := (others => '0');


signal r1_startreal : std_logic_vector(23 downto 0);
signal r2_startreal : std_logic_vector(23 downto 0);
signal r1_startimag : std_logic_vector(23 downto 0);
signal r2_startimag : std_logic_vector(23 downto 0);
signal r1_addr : std_logic_vector(18 downto 0);
signal r2_addr : std_logic_vector(18 downto 0);
signal r1_enable : STD_LOGIC;
signal r2_enable : STD_LOGIC;
signal r1_update : std_logic;
signal r2_update : std_logic;

begin

    calcul : process(clk) is  
    variable tempx : signed(34 downto 0);
    variable tempy : signed(34 downto 0);
    variable addr_temp : unsigned(18 downto 0);
    constant width : signed(10 downto 0) := to_signed(640,11);
    constant height : signed(10 downto 0) := to_signed(480,11);
    begin
        if rising_edge(clk) then
            if  (reset = '1') then
                x <= to_signed(0,19);
                y <= to_signed(0,19);
                tempx := (others => '0');
                tempy := (others => '0');
                addr_temp := (others => '0');
                r1_startimag <= (others => '0');
                r1_startreal <= (others => '0');
                r1_addr   <= (others => '0');
                r1_enable <= '0';
                r1_update <= '1';
                
            else     
                                       
                tempy :=  height/to_signed(2,2) * signed(zoom)  + resize(y,11)*signed(zoom) ;
                r1_startimag <= std_logic_vector( signed(offset_Y) + tempy(23 downto 0));
                tempx :=  width/to_signed(2,2) * signed(zoom) + resize(x,11)*signed(zoom);
                r1_startreal <= std_logic_vector( signed(offset_X) + tempx(23 downto 0));
                
                addr_temp := resize(unsigned(x) + resize(to_unsigned(640,19)*unsigned(y),19),19);
                r1_addr <= std_logic_vector(addr_temp);
                
                if (x >= 639 ) then
                    x <= to_signed(0,19);
                    if (y >= 479 ) then
                         y <= to_signed(0,19);
                    else
                         y <= y + to_signed(1,19);
                    end if;
                else
                    x <= x + to_signed(1,19);
                end if;

                r1_enable <= '1';
                
                 if (addr_temp >= 307199) then -- 640*480-1
                    r1_update <= '1';
                 else 
                    r1_update <= '0';
                 end if;
                
            end if;
        end if;
    end process;

process(clk)
begin
    if rising_edge(clk) then
    
    r2_startreal <= r1_startreal;
    r2_startimag <= r1_startimag;
    r2_addr      <= r1_addr;
    r2_enable    <= r1_enable;
    r2_update    <= r1_update;

    startreal <= r2_startreal;
    startimag <= r2_startimag;
    addr      <= r2_addr;
    enable    <= r2_enable;
    update    <= r2_update;
    
    end if;
end process;

end Behavioral;
