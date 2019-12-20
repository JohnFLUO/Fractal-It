-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Fri Nov 29 11:42:21 2019
-- Host        : heliamphoria running 64-bit CentOS Linux release 7.6.1810 (Core)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ main_0_sim_netlist.vhdl
-- Design      : main_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence_do_convergence is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \out_x_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \ap_CS_fsm_reg[93]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    sc_fifo_chn_1_full_n : in STD_LOGIC;
    internal_full_n_reg : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence_do_convergence;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence_do_convergence is
  signal \^ap_cs_fsm_reg[93]_0\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state10 : STD_LOGIC;
  signal ap_CS_fsm_state100 : STD_LOGIC;
  signal ap_CS_fsm_state11 : STD_LOGIC;
  signal ap_CS_fsm_state12 : STD_LOGIC;
  signal ap_CS_fsm_state13 : STD_LOGIC;
  signal ap_CS_fsm_state14 : STD_LOGIC;
  signal ap_CS_fsm_state15 : STD_LOGIC;
  signal ap_CS_fsm_state16 : STD_LOGIC;
  signal ap_CS_fsm_state17 : STD_LOGIC;
  signal ap_CS_fsm_state18 : STD_LOGIC;
  signal ap_CS_fsm_state19 : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_CS_fsm_state20 : STD_LOGIC;
  signal ap_CS_fsm_state21 : STD_LOGIC;
  signal ap_CS_fsm_state22 : STD_LOGIC;
  signal ap_CS_fsm_state23 : STD_LOGIC;
  signal ap_CS_fsm_state24 : STD_LOGIC;
  signal ap_CS_fsm_state25 : STD_LOGIC;
  signal ap_CS_fsm_state26 : STD_LOGIC;
  signal ap_CS_fsm_state27 : STD_LOGIC;
  signal ap_CS_fsm_state28 : STD_LOGIC;
  signal ap_CS_fsm_state29 : STD_LOGIC;
  signal ap_CS_fsm_state3 : STD_LOGIC;
  signal ap_CS_fsm_state30 : STD_LOGIC;
  signal ap_CS_fsm_state31 : STD_LOGIC;
  signal ap_CS_fsm_state32 : STD_LOGIC;
  signal ap_CS_fsm_state33 : STD_LOGIC;
  signal ap_CS_fsm_state34 : STD_LOGIC;
  signal ap_CS_fsm_state35 : STD_LOGIC;
  signal ap_CS_fsm_state36 : STD_LOGIC;
  signal ap_CS_fsm_state37 : STD_LOGIC;
  signal ap_CS_fsm_state38 : STD_LOGIC;
  signal ap_CS_fsm_state39 : STD_LOGIC;
  signal ap_CS_fsm_state4 : STD_LOGIC;
  signal ap_CS_fsm_state40 : STD_LOGIC;
  signal ap_CS_fsm_state41 : STD_LOGIC;
  signal ap_CS_fsm_state42 : STD_LOGIC;
  signal ap_CS_fsm_state43 : STD_LOGIC;
  signal ap_CS_fsm_state44 : STD_LOGIC;
  signal ap_CS_fsm_state45 : STD_LOGIC;
  signal ap_CS_fsm_state46 : STD_LOGIC;
  signal ap_CS_fsm_state47 : STD_LOGIC;
  signal ap_CS_fsm_state48 : STD_LOGIC;
  signal ap_CS_fsm_state49 : STD_LOGIC;
  signal ap_CS_fsm_state5 : STD_LOGIC;
  signal ap_CS_fsm_state50 : STD_LOGIC;
  signal ap_CS_fsm_state51 : STD_LOGIC;
  signal ap_CS_fsm_state52 : STD_LOGIC;
  signal ap_CS_fsm_state53 : STD_LOGIC;
  signal ap_CS_fsm_state54 : STD_LOGIC;
  signal ap_CS_fsm_state55 : STD_LOGIC;
  signal ap_CS_fsm_state56 : STD_LOGIC;
  signal ap_CS_fsm_state57 : STD_LOGIC;
  signal ap_CS_fsm_state58 : STD_LOGIC;
  signal ap_CS_fsm_state59 : STD_LOGIC;
  signal ap_CS_fsm_state6 : STD_LOGIC;
  signal ap_CS_fsm_state60 : STD_LOGIC;
  signal ap_CS_fsm_state61 : STD_LOGIC;
  signal ap_CS_fsm_state62 : STD_LOGIC;
  signal ap_CS_fsm_state63 : STD_LOGIC;
  signal ap_CS_fsm_state64 : STD_LOGIC;
  signal ap_CS_fsm_state65 : STD_LOGIC;
  signal ap_CS_fsm_state66 : STD_LOGIC;
  signal ap_CS_fsm_state67 : STD_LOGIC;
  signal ap_CS_fsm_state68 : STD_LOGIC;
  signal ap_CS_fsm_state69 : STD_LOGIC;
  signal ap_CS_fsm_state7 : STD_LOGIC;
  signal ap_CS_fsm_state70 : STD_LOGIC;
  signal ap_CS_fsm_state71 : STD_LOGIC;
  signal ap_CS_fsm_state72 : STD_LOGIC;
  signal ap_CS_fsm_state73 : STD_LOGIC;
  signal ap_CS_fsm_state74 : STD_LOGIC;
  signal ap_CS_fsm_state75 : STD_LOGIC;
  signal ap_CS_fsm_state76 : STD_LOGIC;
  signal ap_CS_fsm_state77 : STD_LOGIC;
  signal ap_CS_fsm_state78 : STD_LOGIC;
  signal ap_CS_fsm_state79 : STD_LOGIC;
  signal ap_CS_fsm_state8 : STD_LOGIC;
  signal ap_CS_fsm_state80 : STD_LOGIC;
  signal ap_CS_fsm_state81 : STD_LOGIC;
  signal ap_CS_fsm_state82 : STD_LOGIC;
  signal ap_CS_fsm_state83 : STD_LOGIC;
  signal ap_CS_fsm_state84 : STD_LOGIC;
  signal ap_CS_fsm_state85 : STD_LOGIC;
  signal ap_CS_fsm_state86 : STD_LOGIC;
  signal ap_CS_fsm_state87 : STD_LOGIC;
  signal ap_CS_fsm_state88 : STD_LOGIC;
  signal ap_CS_fsm_state89 : STD_LOGIC;
  signal ap_CS_fsm_state9 : STD_LOGIC;
  signal ap_CS_fsm_state90 : STD_LOGIC;
  signal ap_CS_fsm_state91 : STD_LOGIC;
  signal ap_CS_fsm_state92 : STD_LOGIC;
  signal ap_CS_fsm_state94 : STD_LOGIC;
  signal ap_CS_fsm_state95 : STD_LOGIC;
  signal ap_CS_fsm_state96 : STD_LOGIC;
  signal ap_CS_fsm_state97 : STD_LOGIC;
  signal ap_CS_fsm_state98 : STD_LOGIC;
  signal ap_CS_fsm_state99 : STD_LOGIC;
  signal \out_x[0]_i_2_n_0\ : STD_LOGIC;
  signal \out_x[0]_i_3_n_0\ : STD_LOGIC;
  signal \out_x[0]_i_4_n_0\ : STD_LOGIC;
  signal \out_x[0]_i_5_n_0\ : STD_LOGIC;
  signal \out_x[0]_i_6_n_0\ : STD_LOGIC;
  signal \out_x[0]_i_7_n_0\ : STD_LOGIC;
  signal \out_x[1]_i_2_n_0\ : STD_LOGIC;
  signal \out_x[2]_i_2_n_0\ : STD_LOGIC;
  signal \out_x[2]_i_3_n_0\ : STD_LOGIC;
  signal \out_x[2]_i_4_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_10_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_11_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_12_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_13_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_14_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_15_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_16_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_17_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_18_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_19_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_20_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_21_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_22_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_23_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_24_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_25_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_26_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_27_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_28_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_29_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_3_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_4_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_5_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_6_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_7_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_8_n_0\ : STD_LOGIC;
  signal \out_x[3]_i_9_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_10_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_11_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_2_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_3_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_4_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_5_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_6_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_7_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_8_n_0\ : STD_LOGIC;
  signal \out_y[0]_i_9_n_0\ : STD_LOGIC;
  signal \out_y[1]_i_2_n_0\ : STD_LOGIC;
  signal \out_y[1]_i_3_n_0\ : STD_LOGIC;
  signal \out_y[1]_i_4_n_0\ : STD_LOGIC;
  signal \out_y[1]_i_5_n_0\ : STD_LOGIC;
  signal \out_y[1]_i_6_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_10_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_11_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_2_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_3_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_4_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_5_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_6_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_7_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_8_n_0\ : STD_LOGIC;
  signal \out_y[2]_i_9_n_0\ : STD_LOGIC;
  signal \out_y[3]_i_2_n_0\ : STD_LOGIC;
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[10]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[11]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[12]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[13]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[14]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[15]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[16]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[17]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[18]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[19]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[20]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[21]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[22]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[23]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[24]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[25]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[26]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[27]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[28]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[29]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[30]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[31]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[32]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[33]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[34]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[35]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[36]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[37]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[38]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[39]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[3]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[40]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[41]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[42]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[43]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[44]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[45]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[46]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[47]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[48]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[49]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[4]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[50]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[51]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[52]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[53]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[54]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[55]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[56]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[57]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[58]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[59]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[5]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[60]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[61]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[62]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[63]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[64]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[65]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[66]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[67]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[68]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[69]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[6]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[70]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[71]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[72]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[73]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[74]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[75]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[76]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[77]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[78]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[79]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[7]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[80]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[81]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[82]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[83]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[84]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[85]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[86]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[87]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[88]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[89]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[8]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[90]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[91]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[92]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[93]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[94]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[95]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[96]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[97]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[98]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[99]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[9]\ : label is "none";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_x[0]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \out_x[0]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \out_x[0]_i_6\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \out_x[0]_i_7\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \out_x[1]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \out_x[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \out_x[2]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \out_x[3]_i_17\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \out_x[3]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \out_y[0]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \out_y[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \out_y[2]_i_11\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \out_y[2]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \out_y[3]_i_1\ : label is "soft_lutpair2";
begin
  \ap_CS_fsm_reg[93]_0\ <= \^ap_cs_fsm_reg[93]_0\;
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state100,
      Q => \ap_CS_fsm_reg_n_0_[0]\,
      S => reset
    );
\ap_CS_fsm_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state10,
      Q => ap_CS_fsm_state11,
      R => reset
    );
\ap_CS_fsm_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state11,
      Q => ap_CS_fsm_state12,
      R => reset
    );
\ap_CS_fsm_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state12,
      Q => ap_CS_fsm_state13,
      R => reset
    );
\ap_CS_fsm_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state13,
      Q => ap_CS_fsm_state14,
      R => reset
    );
\ap_CS_fsm_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state14,
      Q => ap_CS_fsm_state15,
      R => reset
    );
\ap_CS_fsm_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state15,
      Q => ap_CS_fsm_state16,
      R => reset
    );
\ap_CS_fsm_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state16,
      Q => ap_CS_fsm_state17,
      R => reset
    );
\ap_CS_fsm_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state17,
      Q => ap_CS_fsm_state18,
      R => reset
    );
\ap_CS_fsm_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state18,
      Q => ap_CS_fsm_state19,
      R => reset
    );
\ap_CS_fsm_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state19,
      Q => ap_CS_fsm_state20,
      R => reset
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => \ap_CS_fsm_reg_n_0_[0]\,
      Q => ap_CS_fsm_state2,
      R => reset
    );
\ap_CS_fsm_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state20,
      Q => ap_CS_fsm_state21,
      R => reset
    );
\ap_CS_fsm_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state21,
      Q => ap_CS_fsm_state22,
      R => reset
    );
\ap_CS_fsm_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state22,
      Q => ap_CS_fsm_state23,
      R => reset
    );
\ap_CS_fsm_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state23,
      Q => ap_CS_fsm_state24,
      R => reset
    );
\ap_CS_fsm_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state24,
      Q => ap_CS_fsm_state25,
      R => reset
    );
\ap_CS_fsm_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state25,
      Q => ap_CS_fsm_state26,
      R => reset
    );
\ap_CS_fsm_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state26,
      Q => ap_CS_fsm_state27,
      R => reset
    );
\ap_CS_fsm_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state27,
      Q => ap_CS_fsm_state28,
      R => reset
    );
\ap_CS_fsm_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state28,
      Q => ap_CS_fsm_state29,
      R => reset
    );
\ap_CS_fsm_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state29,
      Q => ap_CS_fsm_state30,
      R => reset
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state2,
      Q => ap_CS_fsm_state3,
      R => reset
    );
\ap_CS_fsm_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state30,
      Q => ap_CS_fsm_state31,
      R => reset
    );
\ap_CS_fsm_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state31,
      Q => ap_CS_fsm_state32,
      R => reset
    );
\ap_CS_fsm_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state32,
      Q => ap_CS_fsm_state33,
      R => reset
    );
\ap_CS_fsm_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state33,
      Q => ap_CS_fsm_state34,
      R => reset
    );
\ap_CS_fsm_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state34,
      Q => ap_CS_fsm_state35,
      R => reset
    );
\ap_CS_fsm_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state35,
      Q => ap_CS_fsm_state36,
      R => reset
    );
\ap_CS_fsm_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state36,
      Q => ap_CS_fsm_state37,
      R => reset
    );
\ap_CS_fsm_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state37,
      Q => ap_CS_fsm_state38,
      R => reset
    );
\ap_CS_fsm_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state38,
      Q => ap_CS_fsm_state39,
      R => reset
    );
\ap_CS_fsm_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state39,
      Q => ap_CS_fsm_state40,
      R => reset
    );
\ap_CS_fsm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state3,
      Q => ap_CS_fsm_state4,
      R => reset
    );
\ap_CS_fsm_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state40,
      Q => ap_CS_fsm_state41,
      R => reset
    );
\ap_CS_fsm_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state41,
      Q => ap_CS_fsm_state42,
      R => reset
    );
\ap_CS_fsm_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state42,
      Q => ap_CS_fsm_state43,
      R => reset
    );
\ap_CS_fsm_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state43,
      Q => ap_CS_fsm_state44,
      R => reset
    );
\ap_CS_fsm_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state44,
      Q => ap_CS_fsm_state45,
      R => reset
    );
\ap_CS_fsm_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state45,
      Q => ap_CS_fsm_state46,
      R => reset
    );
\ap_CS_fsm_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state46,
      Q => ap_CS_fsm_state47,
      R => reset
    );
\ap_CS_fsm_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state47,
      Q => ap_CS_fsm_state48,
      R => reset
    );
\ap_CS_fsm_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state48,
      Q => ap_CS_fsm_state49,
      R => reset
    );
\ap_CS_fsm_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state49,
      Q => ap_CS_fsm_state50,
      R => reset
    );
\ap_CS_fsm_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state4,
      Q => ap_CS_fsm_state5,
      R => reset
    );
\ap_CS_fsm_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state50,
      Q => ap_CS_fsm_state51,
      R => reset
    );
\ap_CS_fsm_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state51,
      Q => ap_CS_fsm_state52,
      R => reset
    );
\ap_CS_fsm_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state52,
      Q => ap_CS_fsm_state53,
      R => reset
    );
\ap_CS_fsm_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state53,
      Q => ap_CS_fsm_state54,
      R => reset
    );
\ap_CS_fsm_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state54,
      Q => ap_CS_fsm_state55,
      R => reset
    );
\ap_CS_fsm_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state55,
      Q => ap_CS_fsm_state56,
      R => reset
    );
\ap_CS_fsm_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state56,
      Q => ap_CS_fsm_state57,
      R => reset
    );
\ap_CS_fsm_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state57,
      Q => ap_CS_fsm_state58,
      R => reset
    );
\ap_CS_fsm_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state58,
      Q => ap_CS_fsm_state59,
      R => reset
    );
\ap_CS_fsm_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state59,
      Q => ap_CS_fsm_state60,
      R => reset
    );
\ap_CS_fsm_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state5,
      Q => ap_CS_fsm_state6,
      R => reset
    );
\ap_CS_fsm_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state60,
      Q => ap_CS_fsm_state61,
      R => reset
    );
\ap_CS_fsm_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state61,
      Q => ap_CS_fsm_state62,
      R => reset
    );
\ap_CS_fsm_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state62,
      Q => ap_CS_fsm_state63,
      R => reset
    );
\ap_CS_fsm_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state63,
      Q => ap_CS_fsm_state64,
      R => reset
    );
\ap_CS_fsm_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state64,
      Q => ap_CS_fsm_state65,
      R => reset
    );
\ap_CS_fsm_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state65,
      Q => ap_CS_fsm_state66,
      R => reset
    );
\ap_CS_fsm_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state66,
      Q => ap_CS_fsm_state67,
      R => reset
    );
\ap_CS_fsm_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state67,
      Q => ap_CS_fsm_state68,
      R => reset
    );
\ap_CS_fsm_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state68,
      Q => ap_CS_fsm_state69,
      R => reset
    );
\ap_CS_fsm_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state69,
      Q => ap_CS_fsm_state70,
      R => reset
    );
\ap_CS_fsm_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state6,
      Q => ap_CS_fsm_state7,
      R => reset
    );
\ap_CS_fsm_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state70,
      Q => ap_CS_fsm_state71,
      R => reset
    );
\ap_CS_fsm_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state71,
      Q => ap_CS_fsm_state72,
      R => reset
    );
\ap_CS_fsm_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state72,
      Q => ap_CS_fsm_state73,
      R => reset
    );
\ap_CS_fsm_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state73,
      Q => ap_CS_fsm_state74,
      R => reset
    );
\ap_CS_fsm_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state74,
      Q => ap_CS_fsm_state75,
      R => reset
    );
\ap_CS_fsm_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state75,
      Q => ap_CS_fsm_state76,
      R => reset
    );
\ap_CS_fsm_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state76,
      Q => ap_CS_fsm_state77,
      R => reset
    );
\ap_CS_fsm_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state77,
      Q => ap_CS_fsm_state78,
      R => reset
    );
\ap_CS_fsm_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state78,
      Q => ap_CS_fsm_state79,
      R => reset
    );
\ap_CS_fsm_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state79,
      Q => ap_CS_fsm_state80,
      R => reset
    );
\ap_CS_fsm_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state7,
      Q => ap_CS_fsm_state8,
      R => reset
    );
\ap_CS_fsm_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state80,
      Q => ap_CS_fsm_state81,
      R => reset
    );
\ap_CS_fsm_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state81,
      Q => ap_CS_fsm_state82,
      R => reset
    );
\ap_CS_fsm_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state82,
      Q => ap_CS_fsm_state83,
      R => reset
    );
\ap_CS_fsm_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state83,
      Q => ap_CS_fsm_state84,
      R => reset
    );
\ap_CS_fsm_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state84,
      Q => ap_CS_fsm_state85,
      R => reset
    );
\ap_CS_fsm_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state85,
      Q => ap_CS_fsm_state86,
      R => reset
    );
\ap_CS_fsm_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state86,
      Q => ap_CS_fsm_state87,
      R => reset
    );
\ap_CS_fsm_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state87,
      Q => ap_CS_fsm_state88,
      R => reset
    );
\ap_CS_fsm_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state88,
      Q => ap_CS_fsm_state89,
      R => reset
    );
\ap_CS_fsm_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state89,
      Q => ap_CS_fsm_state90,
      R => reset
    );
\ap_CS_fsm_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state8,
      Q => ap_CS_fsm_state9,
      R => reset
    );
\ap_CS_fsm_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state90,
      Q => ap_CS_fsm_state91,
      R => reset
    );
\ap_CS_fsm_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state91,
      Q => ap_CS_fsm_state92,
      R => reset
    );
\ap_CS_fsm_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state92,
      Q => \^ap_cs_fsm_reg[93]_0\,
      R => reset
    );
\ap_CS_fsm_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => \^ap_cs_fsm_reg[93]_0\,
      Q => ap_CS_fsm_state94,
      R => reset
    );
\ap_CS_fsm_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state94,
      Q => ap_CS_fsm_state95,
      R => reset
    );
\ap_CS_fsm_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state95,
      Q => ap_CS_fsm_state96,
      R => reset
    );
\ap_CS_fsm_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state96,
      Q => ap_CS_fsm_state97,
      R => reset
    );
\ap_CS_fsm_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state97,
      Q => ap_CS_fsm_state98,
      R => reset
    );
\ap_CS_fsm_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state98,
      Q => ap_CS_fsm_state99,
      R => reset
    );
\ap_CS_fsm_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state99,
      Q => ap_CS_fsm_state100,
      R => reset
    );
\ap_CS_fsm_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sc_fifo_chn_1_full_n,
      D => ap_CS_fsm_state9,
      Q => ap_CS_fsm_state10,
      R => reset
    );
\out_x[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00CC00CE"
    )
        port map (
      I0 => \out_x[0]_i_2_n_0\,
      I1 => \out_x[0]_i_3_n_0\,
      I2 => \out_x[0]_i_4_n_0\,
      I3 => \out_x[0]_i_5_n_0\,
      I4 => \out_x[0]_i_6_n_0\,
      I5 => \out_x[0]_i_7_n_0\,
      O => \out_x_reg[3]\(0)
    );
\out_x[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00A8A0A0"
    )
        port map (
      I0 => \out_x[3]_i_7_n_0\,
      I1 => ap_CS_fsm_state92,
      I2 => \out_x[3]_i_6_n_0\,
      I3 => \^ap_cs_fsm_reg[93]_0\,
      I4 => sc_fifo_chn_1_full_n,
      I5 => \out_x[1]_i_2_n_0\,
      O => \out_x[0]_i_2_n_0\
    );
\out_x[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000FFA8"
    )
        port map (
      I0 => sc_fifo_chn_1_full_n,
      I1 => ap_CS_fsm_state16,
      I2 => ap_CS_fsm_state96,
      I3 => \out_x[3]_i_16_n_0\,
      I4 => \out_x[0]_i_6_n_0\,
      I5 => \out_x[2]_i_4_n_0\,
      O => \out_x[0]_i_3_n_0\
    );
\out_x[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ap_CS_fsm_state95,
      I1 => sc_fifo_chn_1_full_n,
      I2 => \out_x[3]_i_12_n_0\,
      O => \out_x[0]_i_4_n_0\
    );
\out_x[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ap_CS_fsm_state99,
      I1 => sc_fifo_chn_1_full_n,
      I2 => \out_x[3]_i_5_n_0\,
      O => \out_x[0]_i_5_n_0\
    );
\out_x[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ap_CS_fsm_state97,
      I1 => sc_fifo_chn_1_full_n,
      I2 => \out_x[3]_i_13_n_0\,
      O => \out_x[0]_i_6_n_0\
    );
\out_x[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA8"
    )
        port map (
      I0 => sc_fifo_chn_1_full_n,
      I1 => ap_CS_fsm_state80,
      I2 => ap_CS_fsm_state100,
      I3 => \out_x[3]_i_18_n_0\,
      O => \out_x[0]_i_7_n_0\
    );
\out_x[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888088AAAAAAAA"
    )
        port map (
      I0 => \out_x[3]_i_9_n_0\,
      I1 => \out_x[2]_i_2_n_0\,
      I2 => \out_x[1]_i_2_n_0\,
      I3 => \out_x[3]_i_7_n_0\,
      I4 => internal_full_n_reg,
      I5 => \out_x[2]_i_3_n_0\,
      O => \out_x_reg[3]\(1)
    );
\out_x[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF0E0"
    )
        port map (
      I0 => ap_CS_fsm_state14,
      I1 => ap_CS_fsm_state64,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state94,
      I4 => \out_x[3]_i_15_n_0\,
      O => \out_x[1]_i_2_n_0\
    );
\out_x[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => \out_x[3]_i_9_n_0\,
      I1 => \out_x[2]_i_2_n_0\,
      I2 => \out_x[2]_i_3_n_0\,
      O => \out_x_reg[3]\(2)
    );
\out_x[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000105050505"
    )
        port map (
      I0 => \out_x[3]_i_12_n_0\,
      I1 => ap_CS_fsm_state95,
      I2 => \out_x[3]_i_16_n_0\,
      I3 => ap_CS_fsm_state96,
      I4 => ap_CS_fsm_state16,
      I5 => sc_fifo_chn_1_full_n,
      O => \out_x[2]_i_2_n_0\
    );
\out_x[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \out_x[2]_i_4_n_0\,
      I1 => \out_x[0]_i_6_n_0\,
      O => \out_x[2]_i_3_n_0\
    );
\out_x[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ap_CS_fsm_state98,
      I1 => sc_fifo_chn_1_full_n,
      I2 => \out_x[3]_i_11_n_0\,
      O => \out_x[2]_i_4_n_0\
    );
\out_x[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => \out_x[3]_i_3_n_0\,
      I1 => \out_x[3]_i_4_n_0\,
      I2 => \out_x[3]_i_5_n_0\,
      I3 => \out_x[3]_i_6_n_0\,
      I4 => \out_x[3]_i_7_n_0\,
      I5 => \out_x[3]_i_8_n_0\,
      O => E(0)
    );
\out_x[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state61,
      I1 => ap_CS_fsm_state81,
      I2 => ap_CS_fsm_state11,
      I3 => \ap_CS_fsm_reg_n_0_[0]\,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state31,
      O => \out_x[3]_i_10_n_0\
    );
\out_x[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAFAFAFAFAEA"
    )
        port map (
      I0 => \out_x[3]_i_24_n_0\,
      I1 => ap_CS_fsm_state8,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state68,
      I4 => ap_CS_fsm_state78,
      I5 => ap_CS_fsm_state18,
      O => \out_x[3]_i_11_n_0\
    );
\out_x[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAFAFAFAFAEA"
    )
        port map (
      I0 => \out_x[3]_i_25_n_0\,
      I1 => ap_CS_fsm_state75,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state55,
      I4 => ap_CS_fsm_state45,
      I5 => ap_CS_fsm_state15,
      O => \out_x[3]_i_12_n_0\
    );
\out_x[3]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAFAFAFAFAEA"
    )
        port map (
      I0 => \out_x[3]_i_26_n_0\,
      I1 => ap_CS_fsm_state17,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state67,
      I4 => ap_CS_fsm_state37,
      I5 => ap_CS_fsm_state87,
      O => \out_x[3]_i_13_n_0\
    );
\out_x[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state51,
      I1 => ap_CS_fsm_state21,
      I2 => ap_CS_fsm_state71,
      I3 => ap_CS_fsm_state80,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state16,
      O => \out_x[3]_i_14_n_0\
    );
\out_x[3]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FAFAFAEA"
    )
        port map (
      I0 => \out_x[3]_i_27_n_0\,
      I1 => ap_CS_fsm_state44,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state84,
      I4 => ap_CS_fsm_state24,
      O => \out_x[3]_i_15_n_0\
    );
\out_x[3]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCCCCCCC8"
    )
        port map (
      I0 => ap_CS_fsm_state56,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state6,
      I3 => ap_CS_fsm_state66,
      I4 => ap_CS_fsm_state86,
      I5 => \out_x[3]_i_28_n_0\,
      O => \out_x[3]_i_16_n_0\
    );
\out_x[3]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => ap_CS_fsm_state14,
      I1 => ap_CS_fsm_state64,
      I2 => sc_fifo_chn_1_full_n,
      O => \out_x[3]_i_17_n_0\
    );
\out_x[3]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCCCCCCC8"
    )
        port map (
      I0 => ap_CS_fsm_state60,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state30,
      I3 => ap_CS_fsm_state20,
      I4 => ap_CS_fsm_state10,
      I5 => \out_x[3]_i_29_n_0\,
      O => \out_x[3]_i_18_n_0\
    );
\out_x[3]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state49,
      I1 => ap_CS_fsm_state29,
      I2 => ap_CS_fsm_state19,
      I3 => ap_CS_fsm_state89,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state39,
      O => \out_x[3]_i_19_n_0\
    );
\out_x[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \out_x[3]_i_9_n_0\,
      O => \out_x_reg[3]\(3)
    );
\out_x[3]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state52,
      I1 => ap_CS_fsm_state12,
      I2 => ap_CS_fsm_state2,
      I3 => ap_CS_fsm_state72,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state32,
      O => \out_x[3]_i_20_n_0\
    );
\out_x[3]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => ap_CS_fsm_state53,
      I1 => ap_CS_fsm_state63,
      I2 => ap_CS_fsm_state3,
      I3 => ap_CS_fsm_state23,
      I4 => ap_CS_fsm_state83,
      I5 => ap_CS_fsm_state73,
      O => \out_x[3]_i_21_n_0\
    );
\out_x[3]_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state100,
      I1 => ap_CS_fsm_state91,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state92,
      I4 => \^ap_cs_fsm_reg[93]_0\,
      O => \out_x[3]_i_22_n_0\
    );
\out_x[3]_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => ap_CS_fsm_state95,
      I1 => ap_CS_fsm_state99,
      I2 => ap_CS_fsm_state97,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state94,
      O => \out_x[3]_i_23_n_0\
    );
\out_x[3]_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state38,
      I1 => ap_CS_fsm_state88,
      I2 => ap_CS_fsm_state48,
      I3 => ap_CS_fsm_state58,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state28,
      O => \out_x[3]_i_24_n_0\
    );
\out_x[3]_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state5,
      I1 => ap_CS_fsm_state25,
      I2 => ap_CS_fsm_state35,
      I3 => ap_CS_fsm_state85,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state65,
      O => \out_x[3]_i_25_n_0\
    );
\out_x[3]_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state27,
      I1 => ap_CS_fsm_state57,
      I2 => ap_CS_fsm_state47,
      I3 => ap_CS_fsm_state7,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state77,
      O => \out_x[3]_i_26_n_0\
    );
\out_x[3]_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => ap_CS_fsm_state4,
      I1 => ap_CS_fsm_state74,
      I2 => ap_CS_fsm_state54,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state34,
      O => \out_x[3]_i_27_n_0\
    );
\out_x[3]_i_28\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state76,
      I1 => ap_CS_fsm_state36,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state26,
      I4 => ap_CS_fsm_state46,
      O => \out_x[3]_i_28_n_0\
    );
\out_x[3]_i_29\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state50,
      I1 => ap_CS_fsm_state70,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state40,
      I4 => ap_CS_fsm_state90,
      O => \out_x[3]_i_29_n_0\
    );
\out_x[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFEFE"
    )
        port map (
      I0 => \out_x[3]_i_10_n_0\,
      I1 => \out_x[3]_i_11_n_0\,
      I2 => \out_x[3]_i_12_n_0\,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state41,
      I5 => \out_x[3]_i_13_n_0\,
      O => \out_x[3]_i_3_n_0\
    );
\out_x[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \out_x[3]_i_14_n_0\,
      I1 => \out_x[3]_i_15_n_0\,
      I2 => \out_x[3]_i_16_n_0\,
      I3 => \out_x[3]_i_17_n_0\,
      I4 => \out_x[3]_i_18_n_0\,
      O => \out_x[3]_i_4_n_0\
    );
\out_x[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAFAFAFAFAEA"
    )
        port map (
      I0 => \out_x[3]_i_19_n_0\,
      I1 => ap_CS_fsm_state9,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state59,
      I4 => ap_CS_fsm_state79,
      I5 => ap_CS_fsm_state69,
      O => \out_x[3]_i_5_n_0\
    );
\out_x[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAFAFAFAFAEA"
    )
        port map (
      I0 => \out_x[3]_i_20_n_0\,
      I1 => ap_CS_fsm_state22,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state82,
      I4 => ap_CS_fsm_state42,
      I5 => ap_CS_fsm_state62,
      O => \out_x[3]_i_6_n_0\
    );
\out_x[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3333333B"
    )
        port map (
      I0 => \out_x[3]_i_21_n_0\,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state13,
      I3 => ap_CS_fsm_state43,
      I4 => ap_CS_fsm_state33,
      O => \out_x[3]_i_7_n_0\
    );
\out_x[3]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFC8"
    )
        port map (
      I0 => ap_CS_fsm_state96,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state98,
      I3 => \out_x[3]_i_22_n_0\,
      I4 => \out_x[3]_i_23_n_0\,
      O => \out_x[3]_i_8_n_0\
    );
\out_x[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000005500010055"
    )
        port map (
      I0 => \out_x[3]_i_18_n_0\,
      I1 => ap_CS_fsm_state100,
      I2 => ap_CS_fsm_state80,
      I3 => \out_x[3]_i_5_n_0\,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state99,
      O => \out_x[3]_i_9_n_0\
    );
\out_y[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00CC00CE"
    )
        port map (
      I0 => \out_y[0]_i_2_n_0\,
      I1 => \out_y[0]_i_3_n_0\,
      I2 => \out_y[2]_i_2_n_0\,
      I3 => \out_y[0]_i_4_n_0\,
      I4 => \out_y[0]_i_5_n_0\,
      I5 => \out_x[3]_i_8_n_0\,
      O => D(0)
    );
\out_y[0]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state62,
      I1 => ap_CS_fsm_state67,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state70,
      I4 => ap_CS_fsm_state66,
      O => \out_y[0]_i_10_n_0\
    );
\out_y[0]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => ap_CS_fsm_state64,
      I1 => ap_CS_fsm_state68,
      I2 => ap_CS_fsm_state69,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state63,
      O => \out_y[0]_i_11_n_0\
    );
\out_y[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF70"
    )
        port map (
      I0 => \out_y[0]_i_6_n_0\,
      I1 => \out_y[0]_i_7_n_0\,
      I2 => \out_y[1]_i_2_n_0\,
      I3 => \out_y[1]_i_3_n_0\,
      O => \out_y[0]_i_2_n_0\
    );
\out_y[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \out_y[0]_i_5_n_0\,
      I1 => \out_y[2]_i_3_n_0\,
      I2 => \out_y[2]_i_9_n_0\,
      O => \out_y[0]_i_3_n_0\
    );
\out_y[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFC8"
    )
        port map (
      I0 => ap_CS_fsm_state88,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state90,
      I3 => \out_y[0]_i_8_n_0\,
      I4 => \out_y[0]_i_9_n_0\,
      O => \out_y[0]_i_4_n_0\
    );
\out_y[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFC8"
    )
        port map (
      I0 => ap_CS_fsm_state65,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state61,
      I3 => \out_y[0]_i_10_n_0\,
      I4 => \out_y[0]_i_11_n_0\,
      O => \out_y[0]_i_5_n_0\
    );
\out_y[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000001FFFFFFFF"
    )
        port map (
      I0 => ap_CS_fsm_state12,
      I1 => ap_CS_fsm_state17,
      I2 => ap_CS_fsm_state19,
      I3 => ap_CS_fsm_state11,
      I4 => ap_CS_fsm_state16,
      I5 => sc_fifo_chn_1_full_n,
      O => \out_y[0]_i_6_n_0\
    );
\out_y[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000001FFFFFFFF"
    )
        port map (
      I0 => ap_CS_fsm_state18,
      I1 => ap_CS_fsm_state20,
      I2 => ap_CS_fsm_state15,
      I3 => ap_CS_fsm_state14,
      I4 => ap_CS_fsm_state13,
      I5 => sc_fifo_chn_1_full_n,
      O => \out_y[0]_i_7_n_0\
    );
\out_y[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state83,
      I1 => ap_CS_fsm_state87,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state84,
      I4 => ap_CS_fsm_state82,
      O => \out_y[0]_i_8_n_0\
    );
\out_y[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => ap_CS_fsm_state86,
      I1 => ap_CS_fsm_state85,
      I2 => ap_CS_fsm_state89,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state81,
      O => \out_y[0]_i_9_n_0\
    );
\out_y[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AAAAAAAA"
    )
        port map (
      I0 => \out_y[3]_i_2_n_0\,
      I1 => \out_y[1]_i_2_n_0\,
      I2 => \out_y[1]_i_3_n_0\,
      I3 => \out_y[2]_i_3_n_0\,
      I4 => \out_y[2]_i_2_n_0\,
      I5 => \out_y[2]_i_4_n_0\,
      O => D(1)
    );
\out_y[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"333333333333333B"
    )
        port map (
      I0 => \out_y[1]_i_4_n_0\,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state26,
      I3 => ap_CS_fsm_state24,
      I4 => ap_CS_fsm_state27,
      I5 => ap_CS_fsm_state30,
      O => \out_y[1]_i_2_n_0\
    );
\out_y[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFC8"
    )
        port map (
      I0 => ap_CS_fsm_state36,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state35,
      I3 => \out_y[1]_i_5_n_0\,
      I4 => \out_y[1]_i_6_n_0\,
      O => \out_y[1]_i_3_n_0\
    );
\out_y[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => ap_CS_fsm_state23,
      I1 => ap_CS_fsm_state25,
      I2 => ap_CS_fsm_state21,
      I3 => ap_CS_fsm_state22,
      I4 => ap_CS_fsm_state29,
      I5 => ap_CS_fsm_state28,
      O => \out_y[1]_i_4_n_0\
    );
\out_y[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state38,
      I1 => ap_CS_fsm_state39,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state33,
      I4 => ap_CS_fsm_state40,
      O => \out_y[1]_i_5_n_0\
    );
\out_y[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => ap_CS_fsm_state31,
      I1 => ap_CS_fsm_state34,
      I2 => ap_CS_fsm_state37,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state32,
      O => \out_y[1]_i_6_n_0\
    );
\out_y[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => \out_y[3]_i_2_n_0\,
      I1 => \out_y[2]_i_2_n_0\,
      I2 => \out_y[2]_i_3_n_0\,
      I3 => \out_y[2]_i_4_n_0\,
      O => D(2)
    );
\out_y[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFE0000"
    )
        port map (
      I0 => ap_CS_fsm_state75,
      I1 => ap_CS_fsm_state78,
      I2 => ap_CS_fsm_state74,
      I3 => ap_CS_fsm_state72,
      I4 => sc_fifo_chn_1_full_n,
      I5 => ap_CS_fsm_state76,
      O => \out_y[2]_i_10_n_0\
    );
\out_y[2]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => ap_CS_fsm_state71,
      I1 => ap_CS_fsm_state80,
      I2 => sc_fifo_chn_1_full_n,
      O => \out_y[2]_i_11_n_0\
    );
\out_y[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFC8"
    )
        port map (
      I0 => ap_CS_fsm_state48,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state43,
      I3 => \out_y[2]_i_5_n_0\,
      I4 => \out_y[2]_i_6_n_0\,
      O => \out_y[2]_i_2_n_0\
    );
\out_y[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFC8"
    )
        port map (
      I0 => ap_CS_fsm_state58,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state59,
      I3 => \out_y[2]_i_7_n_0\,
      I4 => \out_y[2]_i_8_n_0\,
      O => \out_y[2]_i_3_n_0\
    );
\out_y[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \out_y[2]_i_9_n_0\,
      I1 => \out_y[0]_i_5_n_0\,
      O => \out_y[2]_i_4_n_0\
    );
\out_y[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state50,
      I1 => ap_CS_fsm_state41,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state47,
      I4 => ap_CS_fsm_state46,
      O => \out_y[2]_i_5_n_0\
    );
\out_y[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => ap_CS_fsm_state49,
      I1 => ap_CS_fsm_state42,
      I2 => ap_CS_fsm_state44,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state45,
      O => \out_y[2]_i_6_n_0\
    );
\out_y[2]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => ap_CS_fsm_state55,
      I1 => ap_CS_fsm_state56,
      I2 => sc_fifo_chn_1_full_n,
      I3 => ap_CS_fsm_state54,
      I4 => ap_CS_fsm_state60,
      O => \out_y[2]_i_7_n_0\
    );
\out_y[2]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => ap_CS_fsm_state53,
      I1 => ap_CS_fsm_state57,
      I2 => ap_CS_fsm_state51,
      I3 => sc_fifo_chn_1_full_n,
      I4 => ap_CS_fsm_state52,
      O => \out_y[2]_i_8_n_0\
    );
\out_y[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEEFFEEFFEEFFEA"
    )
        port map (
      I0 => \out_y[2]_i_10_n_0\,
      I1 => sc_fifo_chn_1_full_n,
      I2 => ap_CS_fsm_state77,
      I3 => \out_y[2]_i_11_n_0\,
      I4 => ap_CS_fsm_state73,
      I5 => ap_CS_fsm_state79,
      O => \out_y[2]_i_9_n_0\
    );
\out_y[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \out_y[3]_i_2_n_0\,
      O => D(3)
    );
\out_y[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \out_x[3]_i_8_n_0\,
      I1 => \out_y[0]_i_4_n_0\,
      O => \out_y[3]_i_2_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb_rom is
  port (
    \couleur_reg[11]\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    grp_dimage_do_image_fu_58_couleur_ap_vld : in STD_LOGIC;
    couleur : in STD_LOGIC_VECTOR ( 0 to 0 );
    sc_fifo_chn_1_empty_n : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb_rom;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb_rom is
  signal q0 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal \q0[11]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \couleur[11]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \q0[11]_i_1\ : label is "soft_lutpair7";
begin
\couleur[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => q0(11),
      I1 => grp_dimage_do_image_fu_58_couleur_ap_vld,
      I2 => couleur(0),
      O => \couleur_reg[11]\
    );
\q0[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => q0(11),
      I1 => sc_fifo_chn_1_empty_n,
      I2 => Q(0),
      O => \q0[11]_i_1_n_0\
    );
\q0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \q0[11]_i_1_n_0\,
      Q => q0(11),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w8_d1_A is
  port (
    sc_fifo_chn_1_full_n : out STD_LOGIC;
    sc_fifo_chn_1_empty_n : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \out_x_reg[1]\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    grp_convergence_fu_104_s_out_write : in STD_LOGIC;
    grp_dimage_fu_126_counter_read : in STD_LOGIC;
    ap_CS_fsm_state93 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w8_d1_A;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w8_d1_A is
  signal internal_empty_n_i_1_n_0 : STD_LOGIC;
  signal internal_full_n_i_1_n_0 : STD_LOGIC;
  signal \mOutPtr[0]_i_1_n_0\ : STD_LOGIC;
  signal \mOutPtr[1]_i_1_n_0\ : STD_LOGIC;
  signal \mOutPtr_reg_n_0_[0]\ : STD_LOGIC;
  signal \mOutPtr_reg_n_0_[1]\ : STD_LOGIC;
  signal \^sc_fifo_chn_1_empty_n\ : STD_LOGIC;
  signal \^sc_fifo_chn_1_full_n\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \mOutPtr[0]_i_1\ : label is "soft_lutpair9";
begin
  sc_fifo_chn_1_empty_n <= \^sc_fifo_chn_1_empty_n\;
  sc_fifo_chn_1_full_n <= \^sc_fifo_chn_1_full_n\;
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^sc_fifo_chn_1_empty_n\,
      I1 => Q(0),
      O => D(0)
    );
internal_empty_n_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5544554455445504"
    )
        port map (
      I0 => reset,
      I1 => \^sc_fifo_chn_1_empty_n\,
      I2 => Q(0),
      I3 => grp_convergence_fu_104_s_out_write,
      I4 => \mOutPtr_reg_n_0_[1]\,
      I5 => \mOutPtr_reg_n_0_[0]\,
      O => internal_empty_n_i_1_n_0
    );
internal_empty_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => internal_empty_n_i_1_n_0,
      Q => \^sc_fifo_chn_1_empty_n\,
      R => '0'
    );
internal_full_n_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAAFFFFFF2AFFAA"
    )
        port map (
      I0 => \^sc_fifo_chn_1_full_n\,
      I1 => \mOutPtr_reg_n_0_[1]\,
      I2 => \mOutPtr_reg_n_0_[0]\,
      I3 => reset,
      I4 => grp_convergence_fu_104_s_out_write,
      I5 => grp_dimage_fu_126_counter_read,
      O => internal_full_n_i_1_n_0
    );
internal_full_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => internal_full_n_i_1_n_0,
      Q => \^sc_fifo_chn_1_full_n\,
      R => '0'
    );
\mOutPtr[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF956A"
    )
        port map (
      I0 => \mOutPtr_reg_n_0_[0]\,
      I1 => \^sc_fifo_chn_1_empty_n\,
      I2 => Q(0),
      I3 => grp_convergence_fu_104_s_out_write,
      I4 => reset,
      O => \mOutPtr[0]_i_1_n_0\
    );
\mOutPtr[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFA6669AAA"
    )
        port map (
      I0 => \mOutPtr_reg_n_0_[1]\,
      I1 => grp_convergence_fu_104_s_out_write,
      I2 => Q(0),
      I3 => \^sc_fifo_chn_1_empty_n\,
      I4 => \mOutPtr_reg_n_0_[0]\,
      I5 => reset,
      O => \mOutPtr[1]_i_1_n_0\
    );
\mOutPtr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \mOutPtr[0]_i_1_n_0\,
      Q => \mOutPtr_reg_n_0_[0]\,
      R => '0'
    );
\mOutPtr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \mOutPtr[1]_i_1_n_0\,
      Q => \mOutPtr_reg_n_0_[1]\,
      R => '0'
    );
\out_x[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^sc_fifo_chn_1_full_n\,
      I1 => ap_CS_fsm_state93,
      O => \out_x_reg[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence is
  port (
    ap_CS_fsm_state93 : out STD_LOGIC;
    grp_convergence_fu_104_s_out_write : out STD_LOGIC;
    x : out STD_LOGIC_VECTOR ( 3 downto 0 );
    y : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sc_fifo_chn_1_full_n : in STD_LOGIC;
    internal_full_n_reg : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence is
  signal grp_convergence_do_convergence_fu_76_n_0 : STD_LOGIC;
  signal grp_convergence_do_convergence_fu_76_n_1 : STD_LOGIC;
  signal grp_convergence_do_convergence_fu_76_n_2 : STD_LOGIC;
  signal grp_convergence_do_convergence_fu_76_n_3 : STD_LOGIC;
  signal grp_convergence_do_convergence_fu_76_n_4 : STD_LOGIC;
  signal grp_convergence_do_convergence_fu_76_n_5 : STD_LOGIC;
  signal grp_convergence_do_convergence_fu_76_n_6 : STD_LOGIC;
  signal grp_convergence_do_convergence_fu_76_n_7 : STD_LOGIC;
  signal \^grp_convergence_fu_104_s_out_write\ : STD_LOGIC;
begin
  grp_convergence_fu_104_s_out_write <= \^grp_convergence_fu_104_s_out_write\;
grp_convergence_do_convergence_fu_76: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence_do_convergence
     port map (
      D(3) => grp_convergence_do_convergence_fu_76_n_0,
      D(2) => grp_convergence_do_convergence_fu_76_n_1,
      D(1) => grp_convergence_do_convergence_fu_76_n_2,
      D(0) => grp_convergence_do_convergence_fu_76_n_3,
      E(0) => \^grp_convergence_fu_104_s_out_write\,
      \ap_CS_fsm_reg[93]_0\ => ap_CS_fsm_state93,
      clk => clk,
      internal_full_n_reg => internal_full_n_reg,
      \out_x_reg[3]\(3) => grp_convergence_do_convergence_fu_76_n_4,
      \out_x_reg[3]\(2) => grp_convergence_do_convergence_fu_76_n_5,
      \out_x_reg[3]\(1) => grp_convergence_do_convergence_fu_76_n_6,
      \out_x_reg[3]\(0) => grp_convergence_do_convergence_fu_76_n_7,
      reset => reset,
      sc_fifo_chn_1_full_n => sc_fifo_chn_1_full_n
    );
\out_x_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_7,
      Q => x(0),
      R => '0'
    );
\out_x_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_6,
      Q => x(1),
      R => '0'
    );
\out_x_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_5,
      Q => x(2),
      R => '0'
    );
\out_x_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_4,
      Q => x(3),
      R => '0'
    );
\out_y_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_3,
      Q => y(0),
      R => '0'
    );
\out_y_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_2,
      Q => y(1),
      R => '0'
    );
\out_y_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_1,
      Q => y(2),
      R => '0'
    );
\out_y_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \^grp_convergence_fu_104_s_out_write\,
      D => grp_convergence_do_convergence_fu_76_n_0,
      Q => y(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb is
  port (
    \couleur_reg[11]\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    grp_dimage_do_image_fu_58_couleur_ap_vld : in STD_LOGIC;
    couleur : in STD_LOGIC_VECTOR ( 0 to 0 );
    sc_fifo_chn_1_empty_n : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb is
begin
dimage_do_image_cbkb_rom_U: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb_rom
     port map (
      Q(0) => Q(0),
      clk => clk,
      couleur(0) => couleur(0),
      \couleur_reg[11]\ => \couleur_reg[11]\,
      grp_dimage_do_image_fu_58_couleur_ap_vld => grp_dimage_do_image_fu_58_couleur_ap_vld,
      sc_fifo_chn_1_empty_n => sc_fifo_chn_1_empty_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image is
  port (
    grp_dimage_fu_126_counter_read : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \couleur_reg[11]\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    sc_fifo_chn_1_empty_n : in STD_LOGIC;
    couleur : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \ap_CS_fsm[1]_i_1_n_0\ : STD_LOGIC;
  signal grp_dimage_do_image_fu_58_couleur_ap_vld : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_1\ : label is "soft_lutpair8";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute SOFT_HLUTNM of internal_full_n_i_2 : label is "soft_lutpair8";
begin
  Q(0) <= \^q\(0);
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => grp_dimage_do_image_fu_58_couleur_ap_vld,
      I1 => \^q\(0),
      I2 => sc_fifo_chn_1_empty_n,
      I3 => reset,
      O => \ap_CS_fsm[1]_i_1_n_0\
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => D(0),
      Q => \^q\(0),
      S => reset
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \ap_CS_fsm[1]_i_1_n_0\,
      Q => grp_dimage_do_image_fu_58_couleur_ap_vld,
      R => '0'
    );
color_U: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb
     port map (
      Q(0) => \^q\(0),
      clk => clk,
      couleur(0) => couleur(0),
      \couleur_reg[11]\ => \couleur_reg[11]\,
      grp_dimage_do_image_fu_58_couleur_ap_vld => grp_dimage_do_image_fu_58_couleur_ap_vld,
      sc_fifo_chn_1_empty_n => sc_fifo_chn_1_empty_n
    );
internal_full_n_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(0),
      I1 => sc_fifo_chn_1_empty_n,
      O => grp_dimage_fu_126_counter_read
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage is
  port (
    couleur : out STD_LOGIC_VECTOR ( 0 to 0 );
    grp_dimage_fu_126_counter_read : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    sc_fifo_chn_1_empty_n : in STD_LOGIC;
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage is
  signal \^couleur\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal grp_dimage_do_image_fu_58_n_2 : STD_LOGIC;
begin
  couleur(0) <= \^couleur\(0);
\couleur_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => grp_dimage_do_image_fu_58_n_2,
      Q => \^couleur\(0),
      R => '0'
    );
grp_dimage_do_image_fu_58: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image
     port map (
      D(0) => D(0),
      Q(0) => Q(0),
      clk => clk,
      couleur(0) => \^couleur\(0),
      \couleur_reg[11]\ => grp_dimage_do_image_fu_58_n_2,
      grp_dimage_fu_126_counter_read => grp_dimage_fu_126_counter_read,
      reset => reset,
      sc_fifo_chn_1_empty_n => sc_fifo_chn_1_empty_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_main is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    x : out STD_LOGIC_VECTOR ( 9 downto 0 );
    y : out STD_LOGIC_VECTOR ( 8 downto 0 );
    couleur : out STD_LOGIC_VECTOR ( 11 downto 0 );
    zoom : in STD_LOGIC_VECTOR ( 7 downto 0 );
    offset_X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    offset_Y : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_main;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_main is
  signal \<const0>\ : STD_LOGIC;
  signal \^couleur\ : STD_LOGIC_VECTOR ( 10 to 10 );
  signal \grp_convergence_do_convergence_fu_76/ap_CS_fsm_state93\ : STD_LOGIC;
  signal grp_convergence_fu_104_s_out_write : STD_LOGIC;
  signal \grp_dimage_do_image_fu_58/ap_CS_fsm\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \grp_dimage_do_image_fu_58/ap_NS_fsm\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal grp_dimage_fu_126_counter_read : STD_LOGIC;
  signal sc_fifo_chn_1_empty_n : STD_LOGIC;
  signal sc_fifo_chn_1_fifo_U_n_3 : STD_LOGIC;
  signal sc_fifo_chn_1_full_n : STD_LOGIC;
  signal \^x\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^y\ : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  couleur(11) <= \^couleur\(10);
  couleur(10) <= \^couleur\(10);
  couleur(9) <= \^couleur\(10);
  couleur(8) <= \^couleur\(10);
  couleur(7) <= \^couleur\(10);
  couleur(6) <= \^couleur\(10);
  couleur(5) <= \^couleur\(10);
  couleur(4) <= \^couleur\(10);
  couleur(3) <= \^couleur\(10);
  couleur(2) <= \^couleur\(10);
  couleur(1) <= \^couleur\(10);
  couleur(0) <= \^couleur\(10);
  x(9) <= \<const0>\;
  x(8) <= \<const0>\;
  x(7) <= \<const0>\;
  x(6) <= \<const0>\;
  x(5) <= \<const0>\;
  x(4) <= \<const0>\;
  x(3 downto 0) <= \^x\(3 downto 0);
  y(8) <= \<const0>\;
  y(7) <= \<const0>\;
  y(6) <= \<const0>\;
  y(5) <= \<const0>\;
  y(4) <= \<const0>\;
  y(3 downto 0) <= \^y\(3 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
grp_convergence_fu_104: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence
     port map (
      ap_CS_fsm_state93 => \grp_convergence_do_convergence_fu_76/ap_CS_fsm_state93\,
      clk => clk,
      grp_convergence_fu_104_s_out_write => grp_convergence_fu_104_s_out_write,
      internal_full_n_reg => sc_fifo_chn_1_fifo_U_n_3,
      reset => reset,
      sc_fifo_chn_1_full_n => sc_fifo_chn_1_full_n,
      x(3 downto 0) => \^x\(3 downto 0),
      y(3 downto 0) => \^y\(3 downto 0)
    );
grp_dimage_fu_126: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage
     port map (
      D(0) => \grp_dimage_do_image_fu_58/ap_NS_fsm\(0),
      Q(0) => \grp_dimage_do_image_fu_58/ap_CS_fsm\(0),
      clk => clk,
      couleur(0) => \^couleur\(10),
      grp_dimage_fu_126_counter_read => grp_dimage_fu_126_counter_read,
      reset => reset,
      sc_fifo_chn_1_empty_n => sc_fifo_chn_1_empty_n
    );
sc_fifo_chn_1_fifo_U: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w8_d1_A
     port map (
      D(0) => \grp_dimage_do_image_fu_58/ap_NS_fsm\(0),
      Q(0) => \grp_dimage_do_image_fu_58/ap_CS_fsm\(0),
      ap_CS_fsm_state93 => \grp_convergence_do_convergence_fu_76/ap_CS_fsm_state93\,
      clk => clk,
      grp_convergence_fu_104_s_out_write => grp_convergence_fu_104_s_out_write,
      grp_dimage_fu_126_counter_read => grp_dimage_fu_126_counter_read,
      \out_x_reg[1]\ => sc_fifo_chn_1_fifo_U_n_3,
      reset => reset,
      sc_fifo_chn_1_empty_n => sc_fifo_chn_1_empty_n,
      sc_fifo_chn_1_full_n => sc_fifo_chn_1_full_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    x : out STD_LOGIC_VECTOR ( 9 downto 0 );
    y : out STD_LOGIC_VECTOR ( 8 downto 0 );
    couleur : out STD_LOGIC_VECTOR ( 11 downto 0 );
    zoom : in STD_LOGIC_VECTOR ( 7 downto 0 );
    offset_X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    offset_Y : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "main_0,main,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "HLS";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "main,Vivado 2018.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000";
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of couleur : signal is "xilinx.com:signal:data:1.0 couleur DATA";
  attribute x_interface_parameter of couleur : signal is "XIL_INTERFACENAME couleur, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 12} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of offset_X : signal is "xilinx.com:signal:data:1.0 offset_X DATA";
  attribute x_interface_parameter of offset_X : signal is "XIL_INTERFACENAME offset_X, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of offset_Y : signal is "xilinx.com:signal:data:1.0 offset_Y DATA";
  attribute x_interface_parameter of offset_Y : signal is "XIL_INTERFACENAME offset_Y, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of x : signal is "xilinx.com:signal:data:1.0 x DATA";
  attribute x_interface_parameter of x : signal is "XIL_INTERFACENAME x, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 10} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of y : signal is "xilinx.com:signal:data:1.0 y DATA";
  attribute x_interface_parameter of y : signal is "XIL_INTERFACENAME y, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 9} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of zoom : signal is "xilinx.com:signal:data:1.0 zoom DATA";
  attribute x_interface_parameter of zoom : signal is "XIL_INTERFACENAME zoom, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_main
     port map (
      clk => clk,
      couleur(11 downto 0) => couleur(11 downto 0),
      offset_X(31 downto 0) => offset_X(31 downto 0),
      offset_Y(31 downto 0) => offset_Y(31 downto 0),
      reset => reset,
      x(9 downto 0) => x(9 downto 0),
      y(8 downto 0) => y(8 downto 0),
      zoom(7 downto 0) => zoom(7 downto 0)
    );
end STRUCTURE;
