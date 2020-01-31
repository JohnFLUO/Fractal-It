-------------------------------
--      FILTRE BOUTONS       --
-------------------------------

-- version 1.1 (22/08/2019 08:55)
-- (c) 2019 Jonathan SAUSSEREAU

-- Description :
----------------

-- Ce module permet de filtrer les rebonds d'un bouton poussoir  
-- et de générer des signaux de commandes.


-- Utilisation :
----------------

-- Ce module filtre pendant une durée STABILITY_TIME [us] les rebonds.
--
-- Il propose 3 signaux de sortie pour un même bouton :
--      - btn_pushed est actif pendant 1 coups d'horloge 
--        après la detection d'un appui.
--      - btn_released est actif pendant 1 coups d'horloge 
--        après la detection d'un relachement.
--      - btn_pushed est actif pendant toute la durée d'un appui.
--
-- Il propose également de générer des impultions de période BURST_PERIOD [ms]
-- sur btn_pushed après un appui de TIME_UNTIL_BURST [ms] sur le bouton.
-- Cette option est activable en initialisant BURST_ON_HOLD Ã  true.


-- Chronogrammes :
------------------
--                   ____      ____               ____      ____      ____                 ____      ____
--   clk           _/    \____/    \____  ...  __/    \____/    \____/    \____  ...  ____/    \____/    
--                     _________     ___       ________________________________       _
--   btn_in        ___/         \___/     ...                                    ...   \_________________
--                  période de rebond            ^ STABILITY_TIME atteint
--                                                _____________________________       ____
--   btn_hold      _____________________  ...  __/                               ...      \______________   
--                                                _________
--   btn_pushed    _____________________  ...  __/         \___________________  ...  ___________________  
--                                                                                         _________
--   btn_released  _____________________  ...  ________________________________  ...  ____/         \____


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity push_detector is
	generic(
		STABILITY_TIME    : integer := 10000; -- [us]   durée de filtrage
		CLOCK_FREQUENCY   : integer := 100;   -- [MHz]  fréquence de l'horloge clk
		BURST_ON_HOLD     : boolean := false; --        true : envoi d'impulsions périodiques sur btn_pushed lors d'un appui long
		BURST_PERIOD      : integer := 150;   -- [ms]   période des impulsions lors d'un appui long
		TIME_UNTIL_BURST  : integer := 750    -- [ms]   durée d'appui avant de générer les impulsions
	);
	port(
		clk               : in  std_logic;    -- horloge de fréquence CLOCK_FREQUENCY
		reset             : in  std_logic;    -- reset
		btn_in            : in  std_logic;    -- signal d'entrée à  filtrer
		btn_pushed        : out std_logic;    -- signal de detection d'appui (actif 1 période de clk)
		btn_released      : out std_logic;    -- signal de detection relachement (actif 1 période de clk)
		btn_hold          : out std_logic     -- signal de maintient du bouton
	);
end push_detector;

architecture Behavioral of push_detector is

constant counter_max      : integer := BURST_PERIOD*1000*CLOCK_FREQUENCY;
signal burst_counter      : integer range 0 to counter_max;

constant counter_time_max : integer := TIME_UNTIL_BURST*1000*CLOCK_FREQUENCY;
signal time_counter       : integer range 0 to counter_time_max := 0;
signal burst_can_start    : boolean := false;

signal deb_res, p_deb_res : std_logic := '0';
signal change             : std_logic;
signal burst              : std_logic := '0';

begin
    
    deb_inst: entity work.debounce
    generic map(
        STABILITY_TIME    => STABILITY_TIME,
        CLOCK_FREQUENCY   => CLOCK_FREQUENCY   
    )
    port map(
        clk               => clk,
        reset             => reset,
        btn_in            => btn_in,
        result            => deb_res
    );
    
    reg: process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                p_deb_res <= '0';
            else
                p_deb_res <= deb_res;
            end if;
        end if;
    end process;
    
    
burst_handler : if BURST_ON_HOLD generate
    counter_time: process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                time_counter <= 0;
                burst_can_start <= false;
            else
                if (deb_res = '1') then -- if button is currently down
                    if (change and deb_res) = '1' then -- if pushed
                       time_counter <= 0;
                       burst_can_start <= false;
                    else
                        if (time_counter < counter_time_max) then
                           time_counter <= time_counter + 1;
                           burst_can_start <= false;
                        else
                           time_counter <= time_counter;
                           burst_can_start <= true;                 
                        end if;
                    end if;
                else
                    time_counter <= 0;
                    burst_can_start <= false;
                end if;
            end if;
        end if;
    end process;

    counter_burst: process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                burst_counter <= 0;
                burst <= '0';
            else
                if (BURST_ON_HOLD and deb_res = '1' and burst_can_start) then
                    if (burst_counter < counter_max) then
                        burst_counter <= burst_counter + 1;
                        burst <= '0';
                    else
                        burst_counter <= 0;
                        burst <= '1';                    
                    end if;
                else
                    burst_counter <= 0;
                    burst <= '0';
                end if;
            end if;
        end if;
    end process;
end generate burst_handler;
    
    change       <= p_deb_res xor deb_res;
    btn_hold     <= deb_res; --TODO : and not change --> ne pas oublier de mettre à  jour le chronogramme de hold
    btn_pushed   <= (change and deb_res) or burst;
    btn_released <= change and not deb_res;
        
end Behavioral;

--------------------------------------------------------------------------------

--entity_name : entity work.push_detector
--generic map(
--    STABILITY_TIME    => 10000, -- [us] 
--    CLOCK_FREQUENCY   => 100,   -- [MHz]
--    BURST_ON_HOLD     => false,         
--    BURST_PERIOD      => 150,   -- [ms] 
--    TIME_UNTIL_BURST  => 750    -- [ms] 
--)
--port map(
--    clk               => ,
--    reset             => ,
--    btn_in            => ,
--    btn_pushed        => ,
--    btn_released      => ,
--    btn_hold          => 
--);