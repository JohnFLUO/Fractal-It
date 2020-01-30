-------------------------------------------------------------------------------
-- Bitmap VGA display with 640x480 pixel resolution
-------------------------------------------------------------------------------
-- V 1.1.1 (2015/07/28)
-- Yannick Bornat (yannick.bornat@enseirb-matmeca.fr)
--
-- For more information on this module, refer to module page :
--  http://bornat.vvv.enseirb.fr/wiki/doku.php?id=en202:vga_bitmap
-- 
-- V1.1.1 :
--   - Comment additions
--   - Code cleanup
-- V1.1.0 :
--   - added capacity above 3bpp
--   - ability to display grayscale pictures
--   - Module works @ 100MHz clock frequency
-- V1.0.1 :
--   - Fixed : image not centered on screen
-- V1.0.0 :
--   - Initial release
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity VGA_bitmap_640x480 is
  generic(bit_per_pixel : integer range 1 to 12:=1;    -- number of bits per pixel
          grayscale     : boolean := false);           -- should data be displayed in grayscale
  port(clk          : in  std_logic;
       reset        : in  std_logic;
       VGA_hs       : out std_logic;   -- horisontal vga syncr.
       VGA_vs       : out std_logic;   -- vertical vga syncr.
       VGA_red      : out std_logic_vector(3 downto 0);   -- red output
       VGA_green    : out std_logic_vector(3 downto 0);   -- green output
       VGA_blue     : out std_logic_vector(3 downto 0);   -- blue output

       ADDR         : in  std_logic_vector(18 downto 0);
       data_in      : in  std_logic_vector(bit_per_pixel - 1 downto 0);
       data_write   : in  std_logic;
       data_out     : out std_logic_vector(bit_per_pixel - 1 downto 0));
end VGA_bitmap_640x480;

architecture Behavioral of VGA_bitmap_640x480 is

-- Graphic RAM type. this object is the content of the displayed image
type GRAM is array (0 to 307199) of std_logic_vector(bit_per_pixel - 1 downto 0); 

signal screen      : GRAM;                           -- the memory representation of the image

signal h_counter   : integer range 0 to 3199:=0;     -- counter for H sync. (size depends of frequ because of division)
signal v_counter   : integer range 0 to 520 :=0;     -- counter for V sync. (base on v_counter, so no frequ issue)

signal TOP_line    : boolean := false;               -- this signal is true when the current pixel column is visible on the screen
signal TOP_display : boolean := false;               -- this signal is true when the current pixel line is visible on the screen

signal pix_read_addr : integer range 0 to 307199:=0;  -- the address at which displayed data is read

signal next_pixel : std_logic_vector(bit_per_pixel - 1 downto 0);  -- the data coding the value of the pixel to be displayed

begin


-- This process performs data access (read and write) to the memory
memory_management : process(clk)
begin
   if clk'event and clk='1' then
      next_pixel <= screen(pix_read_addr);
      data_out   <= screen(to_integer(unsigned(ADDR)));
      if data_write = '1' then
         screen(to_integer(unsigned(ADDR))) <= data_in;
      end if;
   end if;
end process;


pixel_read_addr : process(clk)
begin
   if clk'event and clk='1' then
      if reset = '1' or (not TOP_display) then
         pix_read_addr <= 0;
      elsif TOP_line and (h_counter mod 4)=0 then
         pix_read_addr <= pix_read_addr + 1;
      end if;
   end if;
end process;


-- this process manages the horizontal synchro using the counters
process(clk)
begin
   if clk'event and clk='1' then
      if reset = '1' then
         VGA_vs    <= '0';
         TOP_display <= false;
      else
         case v_counter is
            when 0   => VGA_vs      <= '0'; -- start of Tpw   (  0 ->   0 +   1)
            when 2   => VGA_vs      <= '1'; -- start of Tbp   (  2 ->   2 +  28 =  30)
            when 31  => TOP_display <= true; -- start of Tdisp ( 31 ->  31 + 479 = 510)  
            when 511 => TOP_display <= false; -- start of Tfp   (511 -> 511 +   9 = 520)
            when others   => null;
         end case;
      end if;
   end if;
end process;



process(clk)
begin
   if clk'event and clk='1' then
      if (not TOP_line) or (not TOP_display) then
         VGA_red   <= "0000";
         VGA_green <= "0000";
         VGA_blue  <= "0000";
      else
        case next_pixel is
               when x"00" =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"0";
            VGA_BLUE <= x"0";
          when x"01" =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"0";
            VGA_BLUE <= x"4";
          when x"02" =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"1";
            VGA_BLUE <= x"7";
          when x"03" =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"2";
            VGA_BLUE <= x"a";
          when x"04" =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"3";
            VGA_BLUE <= x"c";
          when x"05" =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"5";
            VGA_BLUE <= x"d";
          when x"06" =>
            VGA_RED <= x"1";
            VGA_GREEN <= x"6";
            VGA_BLUE <= x"e";
          when x"07" =>
            VGA_RED <= x"1";
            VGA_GREEN <= x"8";
            VGA_BLUE <= x"e";
          when x"08" =>
            VGA_RED <= x"2";
            VGA_GREEN <= x"9";
            VGA_BLUE <= x"e";
          when x"09" =>
            VGA_RED <= x"3";
            VGA_GREEN <= x"b";
            VGA_BLUE <= x"d";
          when x"0a" =>
            VGA_RED <= x"4";
            VGA_GREEN <= x"c";
            VGA_BLUE <= x"c";
          when x"0b" =>
            VGA_RED <= x"5";
            VGA_GREEN <= x"d";
            VGA_BLUE <= x"b";
          when x"0c" =>
            VGA_RED <= x"6";
            VGA_GREEN <= x"e";
            VGA_BLUE <= x"a";
          when x"0d" =>
            VGA_RED <= x"7";
            VGA_GREEN <= x"e";
            VGA_BLUE <= x"9";
          when x"0e" =>
            VGA_RED <= x"8";
            VGA_GREEN <= x"e";
            VGA_BLUE <= x"8";
          when x"0f" =>
            VGA_RED <= x"a";
            VGA_GREEN <= x"e";
            VGA_BLUE <= x"7";
          when x"10" =>
            VGA_RED <= x"b";
            VGA_GREEN <= x"e";
            VGA_BLUE <= x"6";
          when x"11" =>
            VGA_RED <= x"c";
            VGA_GREEN <= x"d";
            VGA_BLUE <= x"5";
          when x"12" =>
            VGA_RED <= x"d";
            VGA_GREEN <= x"c";
            VGA_BLUE <= x"3";
          when x"13" =>
            VGA_RED <= x"e";
            VGA_GREEN <= x"b";
            VGA_BLUE <= x"3";
          when x"14" =>
            VGA_RED <= x"e";
            VGA_GREEN <= x"9";
            VGA_BLUE <= x"2";
          when x"15" =>
            VGA_RED <= x"f";
            VGA_GREEN <= x"8";
            VGA_BLUE <= x"1";
          when x"16" =>
            VGA_RED <= x"e";
            VGA_GREEN <= x"6";
            VGA_BLUE <= x"1";
          when x"17" =>
            VGA_RED <= x"e";
            VGA_GREEN <= x"5";
            VGA_BLUE <= x"0";
          when x"18" =>
            VGA_RED <= x"c";
            VGA_GREEN <= x"3";
            VGA_BLUE <= x"0";
          when x"19" =>
            VGA_RED <= x"a";
            VGA_GREEN <= x"2";
            VGA_BLUE <= x"0";
          when x"1a" =>
            VGA_RED <= x"8";
            VGA_GREEN <= x"1";
            VGA_BLUE <= x"0";
          when x"1b" =>
            VGA_RED <= x"4";
            VGA_GREEN <= x"0";
            VGA_BLUE <= x"0";
          when x"1c" =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"0";
            VGA_BLUE <= x"0";
          when others =>
            VGA_RED <= x"0";
            VGA_GREEN <= x"0";
            VGA_BLUE <= x"0";
           end case;
      end if;
   end if;
end process;





-- this process manages the horizontal synchro using the counters
process(clk)
begin
   if clk'event and clk='1' then
      if reset = '1' then
         VGA_hs <= '0';
         TOP_line <= false;
      else
         case h_counter is
            when    2 => VGA_hs   <= '0';     -- start of Tpw   (  0  ->   0 +   95) -- +2 because of delay in RAM
            when  386 => VGA_hs   <= '1';     -- start of Tbp   (  96 ->   96 +  47 = 143) -- 384=96*4 -- -- +2 because of delay in RAM
            when  576 => TOP_line <= true;    -- start of Tdisp ( 144 ->  144 + 639 = 783)  -- 576=144*4
            when 3136 => TOP_line <= false;   -- start of Tfp   ( 784 ->  784 +  15 = 799) -- 3136 = 784*4
            when others => null;
         end case;
      
      end if;
   end if;
end process;

-- counter management for synchro
process(clk)
begin
   if clk'event and clk='1' then
      if reset='1' then
         h_counter <= 0;
         v_counter <= 0;
      else
         if h_counter = 3199 then
            h_counter <= 0;
            if v_counter = 520 then
               v_counter <= 0;
            else
               v_counter <= v_counter + 1;
            end if;
         else
            h_counter <= h_counter +1;      
         end if;
      end if;
   end if;
end process;



end Behavioral;
