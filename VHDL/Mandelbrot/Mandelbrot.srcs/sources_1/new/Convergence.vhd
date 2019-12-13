-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Convergence  is
port (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    x : OUT STD_LOGIC_VECTOR (9 downto 0);
    y : OUT STD_LOGIC_VECTOR (8 downto 0);
    couleur : OUT STD_LOGIC_VECTOR (11 downto 0);

    zoom :     in STD_LOGIC_VECTOR (9 downto 0);
    offset_X : in STD_LOGIC_VECTOR (31 downto 0);
    offset_Y : in STD_LOGIC_VECTOR (31 downto 0));
    
end;


architecture behav of Convergence  is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "main,hls_ip_2018_2,{HLS_INPUT_TYPE=sc,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100tcsg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.165000,HLS_SYN_LAT=52,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=150,HLS_SYN_LUT=606,HLS_VERSION=2018_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal grp_convergence_fu_102_s_out_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_convergence_fu_102_s_out_write : STD_LOGIC;
    signal grp_convergence_fu_102_out_x : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_convergence_fu_102_out_y : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_dimage_fu_124_counter_read : STD_LOGIC;
    signal grp_dimage_fu_124_couleur : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal sc_fifo_chn_1_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal sc_fifo_chn_1_empty_n : STD_LOGIC;
    signal sc_fifo_chn_1_full_n : STD_LOGIC;
    
  

    component conv IS
    port (
        zoom : IN STD_LOGIC_VECTOR (9 downto 0);
        offset_X : IN STD_LOGIC_VECTOR (31 downto 0);
        offset_Y : IN STD_LOGIC_VECTOR (31 downto 0);
        s_out_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        s_out_full_n : IN STD_LOGIC;
        s_out_write : OUT STD_LOGIC;
        out_x : OUT STD_LOGIC_VECTOR (9 downto 0);
        out_y : OUT STD_LOGIC_VECTOR (8 downto 0);
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC );
    end component;


    component dimage IS
    port (
        counter_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        counter_empty_n : IN STD_LOGIC;
        counter_read : OUT STD_LOGIC;
        couleur : OUT STD_LOGIC_VECTOR (11 downto 0);
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC );
    end component;


    component fifo_w8_d1_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (7 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (7 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin


    grp_convergence_fu_102 : component conv
    port map (
        zoom => zoom,
        offset_X => offset_X,
        offset_Y => offset_Y,
        s_out_din => grp_convergence_fu_102_s_out_din,
        s_out_full_n => sc_fifo_chn_1_full_n,
        s_out_write => grp_convergence_fu_102_s_out_write,
        out_x => grp_convergence_fu_102_out_x,
        out_y => grp_convergence_fu_102_out_y,
        clk => clk,
        reset => reset);

    grp_dimage_fu_124 : component dimage
    port map (
        counter_dout => sc_fifo_chn_1_dout,
        counter_empty_n => sc_fifo_chn_1_empty_n,
        counter_read => grp_dimage_fu_124_counter_read,
        couleur => grp_dimage_fu_124_couleur,
        clk => clk,
        reset => reset);

    sc_fifo_chn_1_fifo_U : component fifo_w8_d1_A
    port map (
        clk => clk,
        reset => reset,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => grp_convergence_fu_102_s_out_din,
        if_full_n => sc_fifo_chn_1_full_n,
        if_write => grp_convergence_fu_102_s_out_write,
        if_dout => sc_fifo_chn_1_dout,
        if_empty_n => sc_fifo_chn_1_empty_n,
        if_read => grp_dimage_fu_124_counter_read);




    ap_CS_fsm <= ap_const_lv2_0;
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    couleur <= grp_dimage_fu_124_couleur;
    x <= grp_convergence_fu_102_out_x;
    y <= grp_convergence_fu_102_out_y;
end behav;
