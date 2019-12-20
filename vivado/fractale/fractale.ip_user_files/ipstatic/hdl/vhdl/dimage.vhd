-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dimage is
port (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    counter_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    counter_empty_n : IN STD_LOGIC;
    counter_read : OUT STD_LOGIC;
    couleur : OUT STD_LOGIC_VECTOR (11 downto 0) );
end;


architecture behav of dimage is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "dimage,hls_ip_2018_2,{HLS_INPUT_TYPE=sc,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100tcsg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.165000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=26,HLS_SYN_LUT=34,HLS_VERSION=2018_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal grp_dimage_do_image_fu_58_counter_read : STD_LOGIC;
    signal grp_dimage_do_image_fu_58_couleur : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_dimage_do_image_fu_58_couleur_ap_vld : STD_LOGIC;

    component dimage_do_image IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        counter_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        counter_empty_n : IN STD_LOGIC;
        counter_read : OUT STD_LOGIC;
        couleur : OUT STD_LOGIC_VECTOR (11 downto 0);
        couleur_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_dimage_do_image_fu_58 : component dimage_do_image
    port map (
        ap_clk => clk,
        ap_rst => reset,
        counter_dout => counter_dout,
        counter_empty_n => counter_empty_n,
        counter_read => grp_dimage_do_image_fu_58_counter_read,
        couleur => grp_dimage_do_image_fu_58_couleur,
        couleur_ap_vld => grp_dimage_do_image_fu_58_couleur_ap_vld);





    couleur_assign_proc : process(clk)
    begin
        if (clk'event and clk =  '1') then
            if ((grp_dimage_do_image_fu_58_couleur_ap_vld = ap_const_logic_1)) then 
                couleur <= grp_dimage_do_image_fu_58_couleur;
            end if; 
        end if;
    end process;

    counter_read <= grp_dimage_do_image_fu_58_counter_read;
end behav;
