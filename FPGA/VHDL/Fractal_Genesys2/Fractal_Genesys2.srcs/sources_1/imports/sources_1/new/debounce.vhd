-------------------------------------------------------------------------------
-- counter size N is computed from the time period P that validate the button's
-- stability with the formulae (f = clock frequency):
--    P = (2^N + 2)/f ~= 2^N / f
-- => N ~= log2(P.f)
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity debounce is
	generic(
		STABILITY_TIME  : integer := 10000; -- [us]
		CLOCK_FREQUENCY : integer := 100    -- [MHz]
	);
	port(
		clk    : in  std_logic; -- input clock
		reset  : in  std_logic; -- reset signal
		btn_in : in  std_logic; -- input signal to be debounced
		result : out std_logic  -- debounced signal
	);
end debounce;

architecture logic of debounce is

	constant counter_max : integer := STABILITY_TIME*CLOCK_FREQUENCY;
	signal   counter     : integer range 0 to counter_max := 0;

	signal in_buffer     : std_logic_vector(1 downto 0) := (others => '0'); -- input buffer

	signal counter_set   : std_logic;                    -- sync reset to zero


begin

	counter_set <= in_buffer(0) xor in_buffer(1);   --determine when to start/reset counter

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				counter   <=  0 ;
				result    <= '0';
				in_buffer <= (others => '0');

			else
				in_buffer <= in_buffer(0) & btn_in;    -- shift input with the new value

				if counter_set = '1' then              -- reset counter because input is changing
					counter <= 0;

				elsif counter < counter_max then       -- stable input time is not yet met
					counter <= counter + 1;

				else                                   -- stable input time is met
					result <= in_buffer(1);

				end if;
			end if;
		end if;
	end process;
end logic;

--------------------------------------------------------------------------------

--entity_name : entity work.debounce
--generic map(
--	 STABILITY_TIME => ,
--	CLOCK_FREQUENCY => )
--port map(
--	   clk => ,
--	 reset => ,
--	btn_in => ,
--	result => );