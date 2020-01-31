library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity convergence is
    generic(
		ITERATION_NUMBER : integer := 19 -- Nombre de bloc "Itération"		
	);
    Port ( clk  : in STD_LOGIC;
           reset  : in STD_LOGIC;
           zoom : in STD_LOGIC_VECTOR (23 downto 0);
           offset_X : in STD_LOGIC_VECTOR (23 downto 0);
           offset_Y : in STD_LOGIC_VECTOR (23 downto 0);
           couleur_out : out STD_LOGIC_VECTOR (7 downto 0);
           addr : out STD_LOGIC_VECTOR (18 downto 0); 
           update : out std_logic);
end convergence;

architecture Behavioral of convergence is

component iteration is
    port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           
           addr_in  : in std_logic_vector(18 downto 0);
           addr_out : out std_logic_vector(18 downto 0);
           
           iteration_in  : in STD_LOGIC_VECTOR (7 downto 0);
           iteration_out : out STD_LOGIC_VECTOR (7 downto 0);
           
           enable_in  : in STD_LOGIC;
           enable_out : out STD_LOGIC;
           
           zreal_in  : in STD_LOGIC_VECTOR (23 downto 0);
           zimag_in  : in STD_LOGIC_VECTOR (23 downto 0);
           zreal_out : out STD_LOGIC_VECTOR (23 downto 0);
           zimag_out : out STD_LOGIC_VECTOR (23 downto 0);
           
           startreal_in  : in STD_LOGIC_VECTOR (23 downto 0);
           startimag_in  : in STD_LOGIC_VECTOR (23 downto 0);
           startreal_out : out STD_LOGIC_VECTOR (23 downto 0);
           startimag_out : out STD_LOGIC_VECTOR (23 downto 0)
    );
end component;

type t_Vector is array   (0 to ITERATION_NUMBER) of std_logic;
type t_Vector8 is array  (0 to ITERATION_NUMBER) of std_logic_vector(7 downto 0);
type t_Vector19 is array (0 to ITERATION_NUMBER) of std_logic_vector(18 downto 0);
type t_Vector32 is array (0 to ITERATION_NUMBER) of std_logic_vector(23 downto 0);

signal s_addr      : t_Vector19 := (others => (others => '0'));
signal s_iteration : t_Vector8  := (others => (others => '0'));
signal s_enable    : t_Vector   := (others => '0');
signal s_zreal     : t_Vector32 := (others => (others => '0'));
signal s_zimag     : t_Vector32 := (others => (others => '0'));
signal s_startreal : t_Vector32 := (others => (others => '0'));
signal s_startimag : t_Vector32 := (others => (others => '0'));



begin
    g_point : entity work.point
    port map (
        zoom => zoom,
        offset_X => offset_X,
        offset_Y => offset_Y,
        startreal => s_startreal(0),
        startimag => s_startimag(0),
        enable => s_enable(0),
        addr => s_addr(0),
        clk  => clk,
        reset  => reset,
        update => update);

 Gen_IT: for I in 0 to ITERATION_NUMBER-1 generate
      ITX: iteration port map(
         clk => clk,
         reset => reset,
         
         addr_in  => s_addr(I),
         addr_out => s_addr(I+1),
         
         iteration_in  => s_iteration(I),
         iteration_out => s_iteration(I+1),
         
         enable_in  => s_enable(I),
         enable_out => s_enable(I+1),
         
         zreal_in  => s_zreal(I),
         zimag_in  => s_zimag(I),
         zreal_out => s_zreal(I+1),
         zimag_out => s_zimag(I+1),
         
         startreal_in  => s_startreal(I),
         startimag_in  => s_startimag(I),
         startreal_out => s_startreal(I+1),
         startimag_out => s_startimag(I+1)
          );
          
 end generate Gen_IT;

addr        <= s_addr(ITERATION_NUMBER);
couleur_out <= s_iteration(ITERATION_NUMBER);



end Behavioral;
