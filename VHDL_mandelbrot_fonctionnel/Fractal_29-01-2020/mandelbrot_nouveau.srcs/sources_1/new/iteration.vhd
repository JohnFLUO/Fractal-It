----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2020 15:19:00
-- Design Name: 
-- Module Name: iteration - Behavioral
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

entity iteration is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           
           addr_in : in std_logic_vector(18 downto 0);
           addr_out : out std_logic_vector(18 downto 0);
           
           iteration_in : in STD_LOGIC_VECTOR (7 downto 0);
           iteration_out : out STD_LOGIC_VECTOR (7 downto 0);
           
           enable_in : in STD_LOGIC;
           enable_out : out STD_LOGIC;
           
           zreal_in : in STD_LOGIC_VECTOR (23 downto 0);
           zimag_in : in STD_LOGIC_VECTOR (23 downto 0);
           zreal_out : out STD_LOGIC_VECTOR (23 downto 0);
           zimag_out : out STD_LOGIC_VECTOR (23 downto 0);
           
           startreal_in : in STD_LOGIC_VECTOR (23 downto 0);
           startimag_in : in STD_LOGIC_VECTOR (23 downto 0);
           startreal_out : out STD_LOGIC_VECTOR (23 downto 0);
           startimag_out : out STD_LOGIC_VECTOR (23 downto 0)
           );
end iteration;

architecture Behavioral of iteration is

  signal s_r2_64 :             signed(47 downto 0);
  signal s_i2_64 :             signed(47 downto 0);
  signal s_r2 :                signed(23 downto 0);
  signal s_i2 :                signed(23 downto 0);
  signal s_zreal_zimag_64 :    signed(47 downto 0);
  signal s_deux_zreal_zimag :  signed(23 downto 0);
  signal s_temp_iteration :    signed(7 downto 0);
  signal s_r2plusi2 :          signed(23 downto 0);   

signal r1_addr_out : std_logic_vector(18 downto 0);          
signal r1_iteration_out : STD_LOGIC_VECTOR (7 downto 0);           
signal r1_enable_out : STD_LOGIC;          
signal r1_zreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r1_zimag_out : STD_LOGIC_VECTOR (23 downto 0);        
signal r1_startreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r1_startimag_out : STD_LOGIC_VECTOR (23 downto 0);
signal r2_addr_out : std_logic_vector(18 downto 0);          
signal r2_iteration_out : STD_LOGIC_VECTOR (7 downto 0);           
signal r2_enable_out : STD_LOGIC;          
signal r2_zreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r2_zimag_out : STD_LOGIC_VECTOR (23 downto 0);        
signal r2_startreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r2_startimag_out : STD_LOGIC_VECTOR (23 downto 0);

signal r3_addr_out : std_logic_vector(18 downto 0);          
signal r3_iteration_out : STD_LOGIC_VECTOR (7 downto 0);           
signal r3_enable_out : STD_LOGIC;          
signal r3_zreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r3_zimag_out : STD_LOGIC_VECTOR (23 downto 0);        
signal r3_startreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r3_startimag_out : STD_LOGIC_VECTOR (23 downto 0);


signal r4_addr_out : std_logic_vector(18 downto 0);          
signal r4_iteration_out : STD_LOGIC_VECTOR (7 downto 0);           
signal r4_enable_out : STD_LOGIC;          
signal r4_zreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r4_zimag_out : STD_LOGIC_VECTOR (23 downto 0);        
signal r4_startreal_out : STD_LOGIC_VECTOR (23 downto 0);
signal r4_startimag_out : STD_LOGIC_VECTOR (23 downto 0);

begin


conv : process(clk) is
    variable r2_64 :             signed(47 downto 0);
    variable i2_64 :             signed(47 downto 0);
    variable r2 :                signed(23 downto 0);
    variable i2 :                signed(23 downto 0);
    variable zreal_zimag_64 :    signed(47 downto 0);
    variable deux_zreal_zimag :  signed(23 downto 0);
    variable temp_iteration :    signed(7 downto 0);
    variable r2plusi2 :          signed(23 downto 0);   
    constant quatre :            signed(23 downto 0) := x"080000";  
    begin
    
    if rising_edge(clk) then
        if (reset = '1') then
            r1_enable_out <= '1';
            r1_iteration_out <= (others =>'0');
            r1_startreal_out <= (others => '0');
            r1_startimag_out <= (others => '0');
            r1_addr_out <= (others => '0');
            temp_iteration := (others => '0');
        else
            if (enable_in = '1') then 
                r1_startreal_out <= startreal_in;
                r1_startimag_out <= startimag_in;
                r2_64 := signed(zreal_in) * signed(zreal_in);
                if(r2_64 (40 downto 17) < x"7fffff") then --saturation
                    r2 := r2_64 (40 downto 17);
                else
                    r2 := x"7fffff";
                end if;
                
                i2_64 := signed(zimag_in) * signed(zimag_in);
                if(i2_64 (40 downto 17) < x"7fffff") then
                    i2 := i2_64 (40 downto 17);
                else
                    i2 := x"7fffff";
                end if;
                
                zreal_zimag_64 := signed(zreal_in)*signed(zimag_in);
                if(zreal_zimag_64 (39 downto 16) < x"7fffff") then
                    deux_zreal_zimag := zreal_zimag_64 (39 downto 16); -- *2 
                else
                    deux_zreal_zimag := x"7fffff";
                end if;
                               
                r1_zreal_out <= std_logic_vector( (r2 - i2) + signed(startreal_in) );
                r1_zimag_out <= std_logic_vector( deux_zreal_zimag + signed(startimag_in) );
                r2plusi2 := r2 + i2;    
                
                if (r2plusi2 > quatre) then
                    r1_enable_out    <= '0';
                    r1_iteration_out <= iteration_in;
                else 
                    r1_enable_out <= '1';
                    temp_iteration := signed(iteration_in) + to_signed(1,8);
                    r1_iteration_out <= std_logic_vector(temp_iteration);
                end if;
                
            else -- enable_in = '0'
                r1_iteration_out <= iteration_in;
                r1_enable_out <= '0';
                r1_startreal_out <= (others => '0');
                r1_startimag_out <= (others => '0');
                temp_iteration := (others => '0');
            end if;
            r1_addr_out <= addr_in;
        end if;
        
        s_r2_64            <=  r2_64            ;
        s_i2_64            <=  i2_64            ;
        s_r2               <=  r2               ;
        s_i2               <=  i2               ;
        s_zreal_zimag_64   <=  zreal_zimag_64   ;
        s_deux_zreal_zimag <=  deux_zreal_zimag ;
        s_temp_iteration   <=  temp_iteration   ;
        s_r2plusi2         <=  r2plusi2         ;
        
        
    end if;
    
    end process;

process(clk) 
begin

if rising_edge(clk) then

 r2_addr_out       <=  r1_addr_out     ;
 r2_iteration_out  <=  r1_iteration_out;
 r2_enable_out     <=  r1_enable_out   ;
 r2_zreal_out      <=  r1_zreal_out    ;
 r2_zimag_out      <=  r1_zimag_out    ;
 r2_startreal_out  <=  r1_startreal_out;
 r2_startimag_out  <=  r1_startimag_out;

 r3_addr_out       <=  r2_addr_out     ;
 r3_iteration_out  <=  r2_iteration_out;
 r3_enable_out     <=  r2_enable_out   ;
 r3_zreal_out      <=  r2_zreal_out    ;
 r3_zimag_out      <=  r2_zimag_out    ;
 r3_startreal_out  <=  r2_startreal_out;
 r3_startimag_out  <=  r2_startimag_out;

 r4_addr_out       <=  r3_addr_out     ;
 r4_iteration_out  <=  r3_iteration_out;
 r4_enable_out     <=  r3_enable_out   ;
 r4_zreal_out      <=  r3_zreal_out    ;
 r4_zimag_out      <=  r3_zimag_out    ;
 r4_startreal_out  <=  r3_startreal_out;
 r4_startimag_out  <=  r3_startimag_out;

 addr_out       <=  r4_addr_out     ;
 iteration_out  <=  r4_iteration_out;
 enable_out     <=  r4_enable_out   ;
 zreal_out      <=  r4_zreal_out    ;
 zimag_out      <=  r4_zimag_out    ;
 startreal_out  <=  r4_startreal_out;
 startimag_out  <=  r4_startimag_out;
end if;

end process;


end Behavioral;
