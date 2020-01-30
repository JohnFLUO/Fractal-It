library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity top_Mandelbrot_tb is
end;

architecture bench of top_Mandelbrot_tb is

  component top_Mandelbrot
      Port (
          clock           : in std_logic;
          n_reset         : in std_logic;
          switch          : in std_logic_vector(15 downto 0);
          bouton_haut     : in std_logic;
          bouton_bas      : in std_logic;
          bouton_gauche   : in std_logic;
          bouton_droite   : in std_logic;
          bouton_centre   : in std_logic;
          sept_segment    : out std_logic_vector(6 downto 0);
          an              : out std_logic_vector(7 downto 0);
          point           : out std_logic;
          VGA_hs          : out std_logic;
          VGA_vs          : out std_logic;
          VGA_red         : out std_logic_vector(3 downto 0);
          VGA_green       : out std_logic_vector(3 downto 0);
          VGA_blue        : out std_logic_vector(3 downto 0);
          led             : out std_logic_vector(15 downto 0);
          rgb_17          : out std_logic_vector(2 downto 0);
          rgb_16          : out std_logic_vector(2 downto 0);
          MISO            : in  STD_LOGIC;
          SS              : out  STD_LOGIC;
          MOSI            : out  STD_LOGIC;
          SCLK            : out  STD_LOGIC
      );
  end component;

  signal clock: std_logic;
  signal n_reset: std_logic;
  signal switch: std_logic_vector(15 downto 0);
  signal bouton_haut: std_logic;
  signal bouton_bas: std_logic;
  signal bouton_gauche: std_logic;
  signal bouton_droite: std_logic;
  signal bouton_centre: std_logic;
  signal sept_segment: std_logic_vector(6 downto 0);
  signal an: std_logic_vector(7 downto 0);
  signal point: std_logic;
  signal VGA_hs: std_logic;
  signal VGA_vs: std_logic;
  signal VGA_red: std_logic_vector(3 downto 0);
  signal VGA_green: std_logic_vector(3 downto 0);
  signal VGA_blue: std_logic_vector(3 downto 0);
  signal led: std_logic_vector(15 downto 0);
  signal rgb_17: std_logic_vector(2 downto 0);
  signal rgb_16: std_logic_vector(2 downto 0);
  signal MISO: STD_LOGIC;
  signal SS: STD_LOGIC;
  signal MOSI: STD_LOGIC;
  signal SCLK: STD_LOGIC ;
  
  constant period: time := 20 ns;

begin

  uut: top_Mandelbrot port map ( clock         => clock,
                                 n_reset       => n_reset,
                                 switch        => switch,
                                 bouton_haut   => bouton_haut,
                                 bouton_bas    => bouton_bas,
                                 bouton_gauche => bouton_gauche,
                                 bouton_droite => bouton_droite,
                                 bouton_centre => bouton_centre,
                                 sept_segment  => sept_segment,
                                 an            => an,
                                 point         => point,
                                 VGA_hs        => VGA_hs,
                                 VGA_vs        => VGA_vs,
                                 VGA_red       => VGA_red,
                                 VGA_green     => VGA_green,
                                 VGA_blue      => VGA_blue,
                                 led           => led,
                                 rgb_17        => rgb_17,
                                 rgb_16        => rgb_16,
                                 MISO          => MISO,
                                 SS            => SS,
                                 MOSI          => MOSI,
                                 SCLK          => SCLK );

  stimulus: process
  begin
  
  n_reset <= '0';
  
  wait for period;
  
  n_reset <= '1';
  
  wait for 2us ;
  
  bouton_haut <= '1';
  
  wait for 30 ns;
  
  bouton_haut <= '0';
  
  
  wait for 5 us;
  
  bouton_haut <= '1';
  
  wait for 2us ;
  
  bouton_haut <= '0';
  
  wait for 5 us;
  
  bouton_haut <= '1';
  
  wait for 2us ;
  
    wait;
  end process;

  clocking: process
  begin
    clock <= '0';
    wait for period/2;
    clock <= '1';
    wait for period/2;
  
  end process;




end;