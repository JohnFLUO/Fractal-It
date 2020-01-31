-------------------------------
--    DECODEUR 7 SEGMENT     --
-------------------------------

-- version 1.3 (23/09/2019 10:20)
-- (c) 2019 Jonathan SAUSSEREAU

-- Description :
----------------

-- Ce module permet d'afficher des caractères alphanumériques
-- sur un afficheur 7 segments.
-- Le package lié permet d'en faciliter l'utilisation.


-- Utilisation :
----------------

-- Ce module suit la tale de transcodage visible plus bas.
-- Le format 7-segments de sortie est  [A B C D E F G].
--   -------                          MSB           LSB
--   |  A  |
-- F |     | B
--   -------
--   |  G  |
-- E |     | C
--   -------
--      D

-- La fonction char_to_code définie dans le packagze Char7seg ci-dessous
-- permet d'obtenir la valeur codée d'un caractère sans connaitre la table.
-- Les constantes du même package offrent le même service.


-------------------------------
--          Package          --
-------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Char7seg is
    function char_to_code(char : character) return std_logic_vector;
    
    constant char_0             : std_logic_vector(5 downto 0) := "000000";  -- 0
    constant char_1             : std_logic_vector(5 downto 0) := "000001";  -- 1
    constant char_2             : std_logic_vector(5 downto 0) := "000010";  -- 2
    constant char_3             : std_logic_vector(5 downto 0) := "000011";  -- 3
    constant char_4             : std_logic_vector(5 downto 0) := "000100";  -- 4
    constant char_5             : std_logic_vector(5 downto 0) := "000101";  -- 5
    constant char_6             : std_logic_vector(5 downto 0) := "000110";  -- 6
    constant char_7             : std_logic_vector(5 downto 0) := "000111";  -- 7
    constant char_8             : std_logic_vector(5 downto 0) := "001000";  -- 8
    constant char_9             : std_logic_vector(5 downto 0) := "001001";  -- 9
    constant char_a             : std_logic_vector(5 downto 0) := "001010";  -- A        
    constant char_b             : std_logic_vector(5 downto 0) := "001011";  -- b        
    constant char_c             : std_logic_vector(5 downto 0) := "001100";  -- C        
    constant char_d             : std_logic_vector(5 downto 0) := "001101";  -- d        
    constant char_e             : std_logic_vector(5 downto 0) := "001110";  -- E        
    constant char_f             : std_logic_vector(5 downto 0) := "001111";  -- F        
    constant char_g             : std_logic_vector(5 downto 0) := "010000";  -- G        
    constant char_h             : std_logic_vector(5 downto 0) := "010001";  -- H        
    constant char_i             : std_logic_vector(5 downto 0) := "010010";  -- I        
    constant char_j             : std_logic_vector(5 downto 0) := "010011";  -- J        
    constant char_k             : std_logic_vector(5 downto 0) := "010100";  -- k        
    constant char_l             : std_logic_vector(5 downto 0) := "010101";  -- L        
    constant char_m             : std_logic_vector(5 downto 0) := "010110";  -- M        
    constant char_n             : std_logic_vector(5 downto 0) := "010111";  -- n        
    constant char_o             : std_logic_vector(5 downto 0) := "011000";  -- o        
    constant char_p             : std_logic_vector(5 downto 0) := "011001";  -- P        
    constant char_q             : std_logic_vector(5 downto 0) := "011010";  -- Q        
    constant char_r             : std_logic_vector(5 downto 0) := "011011";  -- r        
    constant char_s             : std_logic_vector(5 downto 0) := "011100";  -- S        
    constant char_t             : std_logic_vector(5 downto 0) := "011101";  -- t        
    constant char_u             : std_logic_vector(5 downto 0) := "011110";  -- U        
    constant char_v             : std_logic_vector(5 downto 0) := "011111";  -- V        
    constant char_w             : std_logic_vector(5 downto 0) := "100000";  -- W        
    constant char_x             : std_logic_vector(5 downto 0) := "100001";  -- X        
    constant char_y             : std_logic_vector(5 downto 0) := "100010";  -- y        
    constant char_z             : std_logic_vector(5 downto 0) := "100011";  -- Z        
    constant char_tiret_haut    : std_logic_vector(5 downto 0) := "100100";  -- - haut   
    constant char_tiret_milieu  : std_logic_vector(5 downto 0) := "100101";  -- - milieu 
    constant char_tiret_bas     : std_logic_vector(5 downto 0) := "100110";  -- - bas    
    constant char_par_gauche    : std_logic_vector(5 downto 0) := "100110";  -- | gauche 
    constant char_par_droite    : std_logic_vector(5 downto 0) := "101000";  -- | droite 
    constant char_slash         : std_logic_vector(5 downto 0) := "101001";  -- /        
    constant char_antislash     : std_logic_vector(5 downto 0) := "101010";  -- \        
    constant char_vide          : std_logic_vector(5 downto 0) := "111111";  --          
end package;

package body Char7seg is
    function char_to_code(char : character) return std_logic_vector is
    begin
        case char is
            when '0' => return "000000"; -- 0
            when '1' => return "000001"; -- 1
            when '2' => return "000010"; -- 2
            when '3' => return "000011"; -- 3
            when '4' => return "000100"; -- 4
            when '5' => return "000101"; -- 5
            when '6' => return "000110"; -- 6
            when '7' => return "000111"; -- 7
            when '8' => return "001000"; -- 8
            when '9' => return "001001"; -- 9
            when 'a' => return "001010"; -- A
            when 'b' => return "001011"; -- b
            when 'c' => return "001100"; -- C
            when 'd' => return "001101"; -- d
            when 'e' => return "001110"; -- E
            when 'f' => return "001111"; -- F
            when 'g' => return "010000"; -- G
            when 'h' => return "010001"; -- H
            when 'i' => return "010010"; -- I
            when 'j' => return "010011"; -- J
            when 'k' => return "010100"; -- k
            when 'l' => return "010101"; -- L
            when 'm' => return "010110"; -- M
            when 'n' => return "010111"; -- n
            when 'o' => return "011000"; -- O
            when 'p' => return "011001"; -- P
            when 'q' => return "011010"; -- Q
            when 'r' => return "011011"; -- r
            when 's' => return "011100"; -- S
            when 't' => return "011101"; -- t
            when 'u' => return "011110"; -- U
            when 'v' => return "011111"; -- V
            when 'w' => return "100000"; -- W
            when 'x' => return "100001"; -- X
            when 'y' => return "100010"; -- y
            when 'z' => return "100011"; -- Z
            when '*' => return "100100"; -- - haut
            when '-' => return "100101"; -- - milieu
            when '_' => return "100110"; -- - bas
            when '(' => return "100110"; -- | gauche
            when ')' => return "101000"; -- | droite
            when '/' => return "101001"; -- _|
            when '\' => return "101010"; -- |*
            when ' ' => return "111111"; -- 
            when others => return "111111"; --
        end case;
    end function;
end package body;


-------------------------------
--         Module            --
-------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity decodeur_7seg is
    port (
        E : in std_logic_vector(5 downto 0);   -- valeur codée d'entrée 
        S : out std_logic_vector(6 downto 0)   -- valeur transcodée 7-segments de sortie
    );
end decodeur_7seg;

architecture Behavioral of decodeur_7seg is
begin
    process (E)
    begin
        case E is
            when "000000" => S <= "0000001"; -- 0
            when "000001" => S <= "1001111"; -- 1
            when "000010" => S <= "0010010"; -- 2
            when "000011" => S <= "0000110"; -- 3
            when "000100" => S <= "1001100"; -- 4
            when "000101" => S <= "0100100"; -- 5
            when "000110" => S <= "0100000"; -- 6
            when "000111" => S <= "0001111"; -- 7
            when "001000" => S <= "0000000"; -- 8
            when "001001" => S <= "0000100"; -- 9
    
            when "001010" => S <= "0001000"; -- A
            when "001011" => S <= "1100000"; -- b
            when "001100" => S <= "0110001"; -- C
            when "001101" => S <= "1000010"; -- d
            when "001110" => S <= "0110000"; -- E
            when "001111" => S <= "0111000"; -- F
            when "010000" => S <= "0100001"; -- G
            when "010001" => S <= "1001000"; -- H
            when "010010" => S <= "1111001"; -- I
            when "010011" => S <= "1000011"; -- J
            when "010100" => S <= "0101000"; -- k
            when "010101" => S <= "1110001"; -- L
            when "010110" => S <= "0001001"; -- M
            when "010111" => S <= "1101010"; -- n
            when "011000" => S <= "1100010"; -- o
            when "011001" => S <= "0011000"; -- P
            when "011010" => S <= "0001100"; -- Q
            when "011011" => S <= "1111010"; -- r
            when "011100" => S <= "0100100"; -- S
            when "011101" => S <= "1110000"; -- t
            when "011110" => S <= "1000001"; -- U
            when "011111" => S <= "1010101"; -- V
            when "100000" => S <= "1000000"; -- W
            when "100001" => S <= "0110110"; -- X
            when "100010" => S <= "1000100"; -- y
            when "100011" => S <= "0010010"; -- Z
            when "100100" => S <= "0111111"; -- - haut
            when "100101" => S <= "1111110"; -- - milieu
            when "100110" => S <= "1110111"; -- - bas
            when "100111" => S <= "1111001"; -- | gauche
            when "101000" => S <= "1001111"; -- | droite
            when "101001" => S <= "0111001"; -- /
            when "101010" => S <= "0001111"; -- \
            when "111111" => S <= "1111111"; -- 
           
            when others => S <= "1111111"; --X
        end case;
    end process;
end Behavioral;
