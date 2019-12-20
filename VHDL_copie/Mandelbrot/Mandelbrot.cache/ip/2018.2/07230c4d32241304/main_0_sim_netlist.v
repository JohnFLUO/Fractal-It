// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Fri Nov 29 11:42:21 2019
// Host        : heliamphoria running 64-bit CentOS Linux release 7.6.1810 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ main_0_sim_netlist.v
// Design      : main_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence
   (ap_CS_fsm_state93,
    grp_convergence_fu_104_s_out_write,
    x,
    y,
    sc_fifo_chn_1_full_n,
    internal_full_n_reg,
    reset,
    clk);
  output ap_CS_fsm_state93;
  output grp_convergence_fu_104_s_out_write;
  output [3:0]x;
  output [3:0]y;
  input sc_fifo_chn_1_full_n;
  input internal_full_n_reg;
  input reset;
  input clk;

  wire ap_CS_fsm_state93;
  wire clk;
  wire grp_convergence_do_convergence_fu_76_n_0;
  wire grp_convergence_do_convergence_fu_76_n_1;
  wire grp_convergence_do_convergence_fu_76_n_2;
  wire grp_convergence_do_convergence_fu_76_n_3;
  wire grp_convergence_do_convergence_fu_76_n_4;
  wire grp_convergence_do_convergence_fu_76_n_5;
  wire grp_convergence_do_convergence_fu_76_n_6;
  wire grp_convergence_do_convergence_fu_76_n_7;
  wire grp_convergence_fu_104_s_out_write;
  wire internal_full_n_reg;
  wire reset;
  wire sc_fifo_chn_1_full_n;
  wire [3:0]x;
  wire [3:0]y;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence_do_convergence grp_convergence_do_convergence_fu_76
       (.D({grp_convergence_do_convergence_fu_76_n_0,grp_convergence_do_convergence_fu_76_n_1,grp_convergence_do_convergence_fu_76_n_2,grp_convergence_do_convergence_fu_76_n_3}),
        .E(grp_convergence_fu_104_s_out_write),
        .\ap_CS_fsm_reg[93]_0 (ap_CS_fsm_state93),
        .clk(clk),
        .internal_full_n_reg(internal_full_n_reg),
        .\out_x_reg[3] ({grp_convergence_do_convergence_fu_76_n_4,grp_convergence_do_convergence_fu_76_n_5,grp_convergence_do_convergence_fu_76_n_6,grp_convergence_do_convergence_fu_76_n_7}),
        .reset(reset),
        .sc_fifo_chn_1_full_n(sc_fifo_chn_1_full_n));
  FDRE \out_x_reg[0] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_7),
        .Q(x[0]),
        .R(1'b0));
  FDRE \out_x_reg[1] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_6),
        .Q(x[1]),
        .R(1'b0));
  FDRE \out_x_reg[2] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_5),
        .Q(x[2]),
        .R(1'b0));
  FDRE \out_x_reg[3] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_4),
        .Q(x[3]),
        .R(1'b0));
  FDRE \out_y_reg[0] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_3),
        .Q(y[0]),
        .R(1'b0));
  FDRE \out_y_reg[1] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_2),
        .Q(y[1]),
        .R(1'b0));
  FDRE \out_y_reg[2] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_1),
        .Q(y[2]),
        .R(1'b0));
  FDRE \out_y_reg[3] 
       (.C(clk),
        .CE(grp_convergence_fu_104_s_out_write),
        .D(grp_convergence_do_convergence_fu_76_n_0),
        .Q(y[3]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence_do_convergence
   (D,
    \out_x_reg[3] ,
    \ap_CS_fsm_reg[93]_0 ,
    E,
    sc_fifo_chn_1_full_n,
    internal_full_n_reg,
    reset,
    clk);
  output [3:0]D;
  output [3:0]\out_x_reg[3] ;
  output \ap_CS_fsm_reg[93]_0 ;
  output [0:0]E;
  input sc_fifo_chn_1_full_n;
  input internal_full_n_reg;
  input reset;
  input clk;

  wire [3:0]D;
  wire [0:0]E;
  wire \ap_CS_fsm_reg[93]_0 ;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire ap_CS_fsm_state10;
  wire ap_CS_fsm_state100;
  wire ap_CS_fsm_state11;
  wire ap_CS_fsm_state12;
  wire ap_CS_fsm_state13;
  wire ap_CS_fsm_state14;
  wire ap_CS_fsm_state15;
  wire ap_CS_fsm_state16;
  wire ap_CS_fsm_state17;
  wire ap_CS_fsm_state18;
  wire ap_CS_fsm_state19;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state20;
  wire ap_CS_fsm_state21;
  wire ap_CS_fsm_state22;
  wire ap_CS_fsm_state23;
  wire ap_CS_fsm_state24;
  wire ap_CS_fsm_state25;
  wire ap_CS_fsm_state26;
  wire ap_CS_fsm_state27;
  wire ap_CS_fsm_state28;
  wire ap_CS_fsm_state29;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state30;
  wire ap_CS_fsm_state31;
  wire ap_CS_fsm_state32;
  wire ap_CS_fsm_state33;
  wire ap_CS_fsm_state34;
  wire ap_CS_fsm_state35;
  wire ap_CS_fsm_state36;
  wire ap_CS_fsm_state37;
  wire ap_CS_fsm_state38;
  wire ap_CS_fsm_state39;
  wire ap_CS_fsm_state4;
  wire ap_CS_fsm_state40;
  wire ap_CS_fsm_state41;
  wire ap_CS_fsm_state42;
  wire ap_CS_fsm_state43;
  wire ap_CS_fsm_state44;
  wire ap_CS_fsm_state45;
  wire ap_CS_fsm_state46;
  wire ap_CS_fsm_state47;
  wire ap_CS_fsm_state48;
  wire ap_CS_fsm_state49;
  wire ap_CS_fsm_state5;
  wire ap_CS_fsm_state50;
  wire ap_CS_fsm_state51;
  wire ap_CS_fsm_state52;
  wire ap_CS_fsm_state53;
  wire ap_CS_fsm_state54;
  wire ap_CS_fsm_state55;
  wire ap_CS_fsm_state56;
  wire ap_CS_fsm_state57;
  wire ap_CS_fsm_state58;
  wire ap_CS_fsm_state59;
  wire ap_CS_fsm_state6;
  wire ap_CS_fsm_state60;
  wire ap_CS_fsm_state61;
  wire ap_CS_fsm_state62;
  wire ap_CS_fsm_state63;
  wire ap_CS_fsm_state64;
  wire ap_CS_fsm_state65;
  wire ap_CS_fsm_state66;
  wire ap_CS_fsm_state67;
  wire ap_CS_fsm_state68;
  wire ap_CS_fsm_state69;
  wire ap_CS_fsm_state7;
  wire ap_CS_fsm_state70;
  wire ap_CS_fsm_state71;
  wire ap_CS_fsm_state72;
  wire ap_CS_fsm_state73;
  wire ap_CS_fsm_state74;
  wire ap_CS_fsm_state75;
  wire ap_CS_fsm_state76;
  wire ap_CS_fsm_state77;
  wire ap_CS_fsm_state78;
  wire ap_CS_fsm_state79;
  wire ap_CS_fsm_state8;
  wire ap_CS_fsm_state80;
  wire ap_CS_fsm_state81;
  wire ap_CS_fsm_state82;
  wire ap_CS_fsm_state83;
  wire ap_CS_fsm_state84;
  wire ap_CS_fsm_state85;
  wire ap_CS_fsm_state86;
  wire ap_CS_fsm_state87;
  wire ap_CS_fsm_state88;
  wire ap_CS_fsm_state89;
  wire ap_CS_fsm_state9;
  wire ap_CS_fsm_state90;
  wire ap_CS_fsm_state91;
  wire ap_CS_fsm_state92;
  wire ap_CS_fsm_state94;
  wire ap_CS_fsm_state95;
  wire ap_CS_fsm_state96;
  wire ap_CS_fsm_state97;
  wire ap_CS_fsm_state98;
  wire ap_CS_fsm_state99;
  wire clk;
  wire internal_full_n_reg;
  wire \out_x[0]_i_2_n_0 ;
  wire \out_x[0]_i_3_n_0 ;
  wire \out_x[0]_i_4_n_0 ;
  wire \out_x[0]_i_5_n_0 ;
  wire \out_x[0]_i_6_n_0 ;
  wire \out_x[0]_i_7_n_0 ;
  wire \out_x[1]_i_2_n_0 ;
  wire \out_x[2]_i_2_n_0 ;
  wire \out_x[2]_i_3_n_0 ;
  wire \out_x[2]_i_4_n_0 ;
  wire \out_x[3]_i_10_n_0 ;
  wire \out_x[3]_i_11_n_0 ;
  wire \out_x[3]_i_12_n_0 ;
  wire \out_x[3]_i_13_n_0 ;
  wire \out_x[3]_i_14_n_0 ;
  wire \out_x[3]_i_15_n_0 ;
  wire \out_x[3]_i_16_n_0 ;
  wire \out_x[3]_i_17_n_0 ;
  wire \out_x[3]_i_18_n_0 ;
  wire \out_x[3]_i_19_n_0 ;
  wire \out_x[3]_i_20_n_0 ;
  wire \out_x[3]_i_21_n_0 ;
  wire \out_x[3]_i_22_n_0 ;
  wire \out_x[3]_i_23_n_0 ;
  wire \out_x[3]_i_24_n_0 ;
  wire \out_x[3]_i_25_n_0 ;
  wire \out_x[3]_i_26_n_0 ;
  wire \out_x[3]_i_27_n_0 ;
  wire \out_x[3]_i_28_n_0 ;
  wire \out_x[3]_i_29_n_0 ;
  wire \out_x[3]_i_3_n_0 ;
  wire \out_x[3]_i_4_n_0 ;
  wire \out_x[3]_i_5_n_0 ;
  wire \out_x[3]_i_6_n_0 ;
  wire \out_x[3]_i_7_n_0 ;
  wire \out_x[3]_i_8_n_0 ;
  wire \out_x[3]_i_9_n_0 ;
  wire [3:0]\out_x_reg[3] ;
  wire \out_y[0]_i_10_n_0 ;
  wire \out_y[0]_i_11_n_0 ;
  wire \out_y[0]_i_2_n_0 ;
  wire \out_y[0]_i_3_n_0 ;
  wire \out_y[0]_i_4_n_0 ;
  wire \out_y[0]_i_5_n_0 ;
  wire \out_y[0]_i_6_n_0 ;
  wire \out_y[0]_i_7_n_0 ;
  wire \out_y[0]_i_8_n_0 ;
  wire \out_y[0]_i_9_n_0 ;
  wire \out_y[1]_i_2_n_0 ;
  wire \out_y[1]_i_3_n_0 ;
  wire \out_y[1]_i_4_n_0 ;
  wire \out_y[1]_i_5_n_0 ;
  wire \out_y[1]_i_6_n_0 ;
  wire \out_y[2]_i_10_n_0 ;
  wire \out_y[2]_i_11_n_0 ;
  wire \out_y[2]_i_2_n_0 ;
  wire \out_y[2]_i_3_n_0 ;
  wire \out_y[2]_i_4_n_0 ;
  wire \out_y[2]_i_5_n_0 ;
  wire \out_y[2]_i_6_n_0 ;
  wire \out_y[2]_i_7_n_0 ;
  wire \out_y[2]_i_8_n_0 ;
  wire \out_y[2]_i_9_n_0 ;
  wire \out_y[3]_i_2_n_0 ;
  wire reset;
  wire sc_fifo_chn_1_full_n;

  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state100),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .S(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[10] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state10),
        .Q(ap_CS_fsm_state11),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[11] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state11),
        .Q(ap_CS_fsm_state12),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[12] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state12),
        .Q(ap_CS_fsm_state13),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[13] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state13),
        .Q(ap_CS_fsm_state14),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[14] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state14),
        .Q(ap_CS_fsm_state15),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[15] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state15),
        .Q(ap_CS_fsm_state16),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[16] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state16),
        .Q(ap_CS_fsm_state17),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[17] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state17),
        .Q(ap_CS_fsm_state18),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[18] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state18),
        .Q(ap_CS_fsm_state19),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[19] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state19),
        .Q(ap_CS_fsm_state20),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(\ap_CS_fsm_reg_n_0_[0] ),
        .Q(ap_CS_fsm_state2),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[20] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state20),
        .Q(ap_CS_fsm_state21),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[21] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state21),
        .Q(ap_CS_fsm_state22),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[22] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state22),
        .Q(ap_CS_fsm_state23),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[23] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state23),
        .Q(ap_CS_fsm_state24),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[24] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state24),
        .Q(ap_CS_fsm_state25),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[25] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state25),
        .Q(ap_CS_fsm_state26),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[26] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state26),
        .Q(ap_CS_fsm_state27),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[27] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state27),
        .Q(ap_CS_fsm_state28),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[28] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state28),
        .Q(ap_CS_fsm_state29),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[29] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state29),
        .Q(ap_CS_fsm_state30),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state2),
        .Q(ap_CS_fsm_state3),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[30] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state30),
        .Q(ap_CS_fsm_state31),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[31] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state31),
        .Q(ap_CS_fsm_state32),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[32] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state32),
        .Q(ap_CS_fsm_state33),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[33] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state33),
        .Q(ap_CS_fsm_state34),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[34] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state34),
        .Q(ap_CS_fsm_state35),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[35] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state35),
        .Q(ap_CS_fsm_state36),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[36] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state36),
        .Q(ap_CS_fsm_state37),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[37] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state37),
        .Q(ap_CS_fsm_state38),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[38] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state38),
        .Q(ap_CS_fsm_state39),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[39] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state39),
        .Q(ap_CS_fsm_state40),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state3),
        .Q(ap_CS_fsm_state4),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[40] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state40),
        .Q(ap_CS_fsm_state41),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[41] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state41),
        .Q(ap_CS_fsm_state42),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[42] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state42),
        .Q(ap_CS_fsm_state43),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[43] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state43),
        .Q(ap_CS_fsm_state44),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[44] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state44),
        .Q(ap_CS_fsm_state45),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[45] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state45),
        .Q(ap_CS_fsm_state46),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[46] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state46),
        .Q(ap_CS_fsm_state47),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[47] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state47),
        .Q(ap_CS_fsm_state48),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[48] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state48),
        .Q(ap_CS_fsm_state49),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[49] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state49),
        .Q(ap_CS_fsm_state50),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[4] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state4),
        .Q(ap_CS_fsm_state5),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[50] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state50),
        .Q(ap_CS_fsm_state51),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[51] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state51),
        .Q(ap_CS_fsm_state52),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[52] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state52),
        .Q(ap_CS_fsm_state53),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[53] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state53),
        .Q(ap_CS_fsm_state54),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[54] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state54),
        .Q(ap_CS_fsm_state55),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[55] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state55),
        .Q(ap_CS_fsm_state56),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[56] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state56),
        .Q(ap_CS_fsm_state57),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[57] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state57),
        .Q(ap_CS_fsm_state58),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[58] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state58),
        .Q(ap_CS_fsm_state59),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[59] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state59),
        .Q(ap_CS_fsm_state60),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[5] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state5),
        .Q(ap_CS_fsm_state6),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[60] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state60),
        .Q(ap_CS_fsm_state61),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[61] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state61),
        .Q(ap_CS_fsm_state62),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[62] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state62),
        .Q(ap_CS_fsm_state63),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[63] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state63),
        .Q(ap_CS_fsm_state64),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[64] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state64),
        .Q(ap_CS_fsm_state65),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[65] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state65),
        .Q(ap_CS_fsm_state66),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[66] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state66),
        .Q(ap_CS_fsm_state67),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[67] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state67),
        .Q(ap_CS_fsm_state68),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[68] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state68),
        .Q(ap_CS_fsm_state69),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[69] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state69),
        .Q(ap_CS_fsm_state70),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[6] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state6),
        .Q(ap_CS_fsm_state7),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[70] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state70),
        .Q(ap_CS_fsm_state71),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[71] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state71),
        .Q(ap_CS_fsm_state72),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[72] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state72),
        .Q(ap_CS_fsm_state73),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[73] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state73),
        .Q(ap_CS_fsm_state74),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[74] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state74),
        .Q(ap_CS_fsm_state75),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[75] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state75),
        .Q(ap_CS_fsm_state76),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[76] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state76),
        .Q(ap_CS_fsm_state77),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[77] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state77),
        .Q(ap_CS_fsm_state78),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[78] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state78),
        .Q(ap_CS_fsm_state79),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[79] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state79),
        .Q(ap_CS_fsm_state80),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[7] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state7),
        .Q(ap_CS_fsm_state8),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[80] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state80),
        .Q(ap_CS_fsm_state81),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[81] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state81),
        .Q(ap_CS_fsm_state82),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[82] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state82),
        .Q(ap_CS_fsm_state83),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[83] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state83),
        .Q(ap_CS_fsm_state84),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[84] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state84),
        .Q(ap_CS_fsm_state85),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[85] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state85),
        .Q(ap_CS_fsm_state86),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[86] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state86),
        .Q(ap_CS_fsm_state87),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[87] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state87),
        .Q(ap_CS_fsm_state88),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[88] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state88),
        .Q(ap_CS_fsm_state89),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[89] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state89),
        .Q(ap_CS_fsm_state90),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[8] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state8),
        .Q(ap_CS_fsm_state9),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[90] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state90),
        .Q(ap_CS_fsm_state91),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[91] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state91),
        .Q(ap_CS_fsm_state92),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[92] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state92),
        .Q(\ap_CS_fsm_reg[93]_0 ),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[93] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(\ap_CS_fsm_reg[93]_0 ),
        .Q(ap_CS_fsm_state94),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[94] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state94),
        .Q(ap_CS_fsm_state95),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[95] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state95),
        .Q(ap_CS_fsm_state96),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[96] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state96),
        .Q(ap_CS_fsm_state97),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[97] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state97),
        .Q(ap_CS_fsm_state98),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[98] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state98),
        .Q(ap_CS_fsm_state99),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[99] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state99),
        .Q(ap_CS_fsm_state100),
        .R(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[9] 
       (.C(clk),
        .CE(sc_fifo_chn_1_full_n),
        .D(ap_CS_fsm_state9),
        .Q(ap_CS_fsm_state10),
        .R(reset));
  LUT6 #(
    .INIT(64'hFFFFFFFF00CC00CE)) 
    \out_x[0]_i_1 
       (.I0(\out_x[0]_i_2_n_0 ),
        .I1(\out_x[0]_i_3_n_0 ),
        .I2(\out_x[0]_i_4_n_0 ),
        .I3(\out_x[0]_i_5_n_0 ),
        .I4(\out_x[0]_i_6_n_0 ),
        .I5(\out_x[0]_i_7_n_0 ),
        .O(\out_x_reg[3] [0]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00A8A0A0)) 
    \out_x[0]_i_2 
       (.I0(\out_x[3]_i_7_n_0 ),
        .I1(ap_CS_fsm_state92),
        .I2(\out_x[3]_i_6_n_0 ),
        .I3(\ap_CS_fsm_reg[93]_0 ),
        .I4(sc_fifo_chn_1_full_n),
        .I5(\out_x[1]_i_2_n_0 ),
        .O(\out_x[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000FFA8)) 
    \out_x[0]_i_3 
       (.I0(sc_fifo_chn_1_full_n),
        .I1(ap_CS_fsm_state16),
        .I2(ap_CS_fsm_state96),
        .I3(\out_x[3]_i_16_n_0 ),
        .I4(\out_x[0]_i_6_n_0 ),
        .I5(\out_x[2]_i_4_n_0 ),
        .O(\out_x[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \out_x[0]_i_4 
       (.I0(ap_CS_fsm_state95),
        .I1(sc_fifo_chn_1_full_n),
        .I2(\out_x[3]_i_12_n_0 ),
        .O(\out_x[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \out_x[0]_i_5 
       (.I0(ap_CS_fsm_state99),
        .I1(sc_fifo_chn_1_full_n),
        .I2(\out_x[3]_i_5_n_0 ),
        .O(\out_x[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \out_x[0]_i_6 
       (.I0(ap_CS_fsm_state97),
        .I1(sc_fifo_chn_1_full_n),
        .I2(\out_x[3]_i_13_n_0 ),
        .O(\out_x[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFA8)) 
    \out_x[0]_i_7 
       (.I0(sc_fifo_chn_1_full_n),
        .I1(ap_CS_fsm_state80),
        .I2(ap_CS_fsm_state100),
        .I3(\out_x[3]_i_18_n_0 ),
        .O(\out_x[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h88888088AAAAAAAA)) 
    \out_x[1]_i_1 
       (.I0(\out_x[3]_i_9_n_0 ),
        .I1(\out_x[2]_i_2_n_0 ),
        .I2(\out_x[1]_i_2_n_0 ),
        .I3(\out_x[3]_i_7_n_0 ),
        .I4(internal_full_n_reg),
        .I5(\out_x[2]_i_3_n_0 ),
        .O(\out_x_reg[3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFF0E0)) 
    \out_x[1]_i_2 
       (.I0(ap_CS_fsm_state14),
        .I1(ap_CS_fsm_state64),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state94),
        .I4(\out_x[3]_i_15_n_0 ),
        .O(\out_x[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \out_x[2]_i_1 
       (.I0(\out_x[3]_i_9_n_0 ),
        .I1(\out_x[2]_i_2_n_0 ),
        .I2(\out_x[2]_i_3_n_0 ),
        .O(\out_x_reg[3] [2]));
  LUT6 #(
    .INIT(64'h0000000105050505)) 
    \out_x[2]_i_2 
       (.I0(\out_x[3]_i_12_n_0 ),
        .I1(ap_CS_fsm_state95),
        .I2(\out_x[3]_i_16_n_0 ),
        .I3(ap_CS_fsm_state96),
        .I4(ap_CS_fsm_state16),
        .I5(sc_fifo_chn_1_full_n),
        .O(\out_x[2]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \out_x[2]_i_3 
       (.I0(\out_x[2]_i_4_n_0 ),
        .I1(\out_x[0]_i_6_n_0 ),
        .O(\out_x[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \out_x[2]_i_4 
       (.I0(ap_CS_fsm_state98),
        .I1(sc_fifo_chn_1_full_n),
        .I2(\out_x[3]_i_11_n_0 ),
        .O(\out_x[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \out_x[3]_i_1 
       (.I0(\out_x[3]_i_3_n_0 ),
        .I1(\out_x[3]_i_4_n_0 ),
        .I2(\out_x[3]_i_5_n_0 ),
        .I3(\out_x[3]_i_6_n_0 ),
        .I4(\out_x[3]_i_7_n_0 ),
        .I5(\out_x[3]_i_8_n_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_x[3]_i_10 
       (.I0(ap_CS_fsm_state61),
        .I1(ap_CS_fsm_state81),
        .I2(ap_CS_fsm_state11),
        .I3(\ap_CS_fsm_reg_n_0_[0] ),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state31),
        .O(\out_x[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAFAFAFAFAFAEA)) 
    \out_x[3]_i_11 
       (.I0(\out_x[3]_i_24_n_0 ),
        .I1(ap_CS_fsm_state8),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state68),
        .I4(ap_CS_fsm_state78),
        .I5(ap_CS_fsm_state18),
        .O(\out_x[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAFAFAFAFAFAEA)) 
    \out_x[3]_i_12 
       (.I0(\out_x[3]_i_25_n_0 ),
        .I1(ap_CS_fsm_state75),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state55),
        .I4(ap_CS_fsm_state45),
        .I5(ap_CS_fsm_state15),
        .O(\out_x[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAFAFAFAFAFAEA)) 
    \out_x[3]_i_13 
       (.I0(\out_x[3]_i_26_n_0 ),
        .I1(ap_CS_fsm_state17),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state67),
        .I4(ap_CS_fsm_state37),
        .I5(ap_CS_fsm_state87),
        .O(\out_x[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_x[3]_i_14 
       (.I0(ap_CS_fsm_state51),
        .I1(ap_CS_fsm_state21),
        .I2(ap_CS_fsm_state71),
        .I3(ap_CS_fsm_state80),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state16),
        .O(\out_x[3]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hFAFAFAEA)) 
    \out_x[3]_i_15 
       (.I0(\out_x[3]_i_27_n_0 ),
        .I1(ap_CS_fsm_state44),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state84),
        .I4(ap_CS_fsm_state24),
        .O(\out_x[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFCCCCCCC8)) 
    \out_x[3]_i_16 
       (.I0(ap_CS_fsm_state56),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state6),
        .I3(ap_CS_fsm_state66),
        .I4(ap_CS_fsm_state86),
        .I5(\out_x[3]_i_28_n_0 ),
        .O(\out_x[3]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \out_x[3]_i_17 
       (.I0(ap_CS_fsm_state14),
        .I1(ap_CS_fsm_state64),
        .I2(sc_fifo_chn_1_full_n),
        .O(\out_x[3]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFCCCCCCC8)) 
    \out_x[3]_i_18 
       (.I0(ap_CS_fsm_state60),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state30),
        .I3(ap_CS_fsm_state20),
        .I4(ap_CS_fsm_state10),
        .I5(\out_x[3]_i_29_n_0 ),
        .O(\out_x[3]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_x[3]_i_19 
       (.I0(ap_CS_fsm_state49),
        .I1(ap_CS_fsm_state29),
        .I2(ap_CS_fsm_state19),
        .I3(ap_CS_fsm_state89),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state39),
        .O(\out_x[3]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \out_x[3]_i_2 
       (.I0(\out_x[3]_i_9_n_0 ),
        .O(\out_x_reg[3] [3]));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_x[3]_i_20 
       (.I0(ap_CS_fsm_state52),
        .I1(ap_CS_fsm_state12),
        .I2(ap_CS_fsm_state2),
        .I3(ap_CS_fsm_state72),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state32),
        .O(\out_x[3]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \out_x[3]_i_21 
       (.I0(ap_CS_fsm_state53),
        .I1(ap_CS_fsm_state63),
        .I2(ap_CS_fsm_state3),
        .I3(ap_CS_fsm_state23),
        .I4(ap_CS_fsm_state83),
        .I5(ap_CS_fsm_state73),
        .O(\out_x[3]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_x[3]_i_22 
       (.I0(ap_CS_fsm_state100),
        .I1(ap_CS_fsm_state91),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state92),
        .I4(\ap_CS_fsm_reg[93]_0 ),
        .O(\out_x[3]_i_22_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \out_x[3]_i_23 
       (.I0(ap_CS_fsm_state95),
        .I1(ap_CS_fsm_state99),
        .I2(ap_CS_fsm_state97),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state94),
        .O(\out_x[3]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_x[3]_i_24 
       (.I0(ap_CS_fsm_state38),
        .I1(ap_CS_fsm_state88),
        .I2(ap_CS_fsm_state48),
        .I3(ap_CS_fsm_state58),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state28),
        .O(\out_x[3]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_x[3]_i_25 
       (.I0(ap_CS_fsm_state5),
        .I1(ap_CS_fsm_state25),
        .I2(ap_CS_fsm_state35),
        .I3(ap_CS_fsm_state85),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state65),
        .O(\out_x[3]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_x[3]_i_26 
       (.I0(ap_CS_fsm_state27),
        .I1(ap_CS_fsm_state57),
        .I2(ap_CS_fsm_state47),
        .I3(ap_CS_fsm_state7),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state77),
        .O(\out_x[3]_i_26_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \out_x[3]_i_27 
       (.I0(ap_CS_fsm_state4),
        .I1(ap_CS_fsm_state74),
        .I2(ap_CS_fsm_state54),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state34),
        .O(\out_x[3]_i_27_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_x[3]_i_28 
       (.I0(ap_CS_fsm_state76),
        .I1(ap_CS_fsm_state36),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state26),
        .I4(ap_CS_fsm_state46),
        .O(\out_x[3]_i_28_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_x[3]_i_29 
       (.I0(ap_CS_fsm_state50),
        .I1(ap_CS_fsm_state70),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state40),
        .I4(ap_CS_fsm_state90),
        .O(\out_x[3]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFEFE)) 
    \out_x[3]_i_3 
       (.I0(\out_x[3]_i_10_n_0 ),
        .I1(\out_x[3]_i_11_n_0 ),
        .I2(\out_x[3]_i_12_n_0 ),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state41),
        .I5(\out_x[3]_i_13_n_0 ),
        .O(\out_x[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out_x[3]_i_4 
       (.I0(\out_x[3]_i_14_n_0 ),
        .I1(\out_x[3]_i_15_n_0 ),
        .I2(\out_x[3]_i_16_n_0 ),
        .I3(\out_x[3]_i_17_n_0 ),
        .I4(\out_x[3]_i_18_n_0 ),
        .O(\out_x[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAFAFAFAFAFAEA)) 
    \out_x[3]_i_5 
       (.I0(\out_x[3]_i_19_n_0 ),
        .I1(ap_CS_fsm_state9),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state59),
        .I4(ap_CS_fsm_state79),
        .I5(ap_CS_fsm_state69),
        .O(\out_x[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAFAFAFAFAFAEA)) 
    \out_x[3]_i_6 
       (.I0(\out_x[3]_i_20_n_0 ),
        .I1(ap_CS_fsm_state22),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state82),
        .I4(ap_CS_fsm_state42),
        .I5(ap_CS_fsm_state62),
        .O(\out_x[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h3333333B)) 
    \out_x[3]_i_7 
       (.I0(\out_x[3]_i_21_n_0 ),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state13),
        .I3(ap_CS_fsm_state43),
        .I4(ap_CS_fsm_state33),
        .O(\out_x[3]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFC8)) 
    \out_x[3]_i_8 
       (.I0(ap_CS_fsm_state96),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state98),
        .I3(\out_x[3]_i_22_n_0 ),
        .I4(\out_x[3]_i_23_n_0 ),
        .O(\out_x[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000005500010055)) 
    \out_x[3]_i_9 
       (.I0(\out_x[3]_i_18_n_0 ),
        .I1(ap_CS_fsm_state100),
        .I2(ap_CS_fsm_state80),
        .I3(\out_x[3]_i_5_n_0 ),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state99),
        .O(\out_x[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00CC00CE)) 
    \out_y[0]_i_1 
       (.I0(\out_y[0]_i_2_n_0 ),
        .I1(\out_y[0]_i_3_n_0 ),
        .I2(\out_y[2]_i_2_n_0 ),
        .I3(\out_y[0]_i_4_n_0 ),
        .I4(\out_y[0]_i_5_n_0 ),
        .I5(\out_x[3]_i_8_n_0 ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_y[0]_i_10 
       (.I0(ap_CS_fsm_state62),
        .I1(ap_CS_fsm_state67),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state70),
        .I4(ap_CS_fsm_state66),
        .O(\out_y[0]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \out_y[0]_i_11 
       (.I0(ap_CS_fsm_state64),
        .I1(ap_CS_fsm_state68),
        .I2(ap_CS_fsm_state69),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state63),
        .O(\out_y[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFF70)) 
    \out_y[0]_i_2 
       (.I0(\out_y[0]_i_6_n_0 ),
        .I1(\out_y[0]_i_7_n_0 ),
        .I2(\out_y[1]_i_2_n_0 ),
        .I3(\out_y[1]_i_3_n_0 ),
        .O(\out_y[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \out_y[0]_i_3 
       (.I0(\out_y[0]_i_5_n_0 ),
        .I1(\out_y[2]_i_3_n_0 ),
        .I2(\out_y[2]_i_9_n_0 ),
        .O(\out_y[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFC8)) 
    \out_y[0]_i_4 
       (.I0(ap_CS_fsm_state88),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state90),
        .I3(\out_y[0]_i_8_n_0 ),
        .I4(\out_y[0]_i_9_n_0 ),
        .O(\out_y[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFC8)) 
    \out_y[0]_i_5 
       (.I0(ap_CS_fsm_state65),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state61),
        .I3(\out_y[0]_i_10_n_0 ),
        .I4(\out_y[0]_i_11_n_0 ),
        .O(\out_y[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \out_y[0]_i_6 
       (.I0(ap_CS_fsm_state12),
        .I1(ap_CS_fsm_state17),
        .I2(ap_CS_fsm_state19),
        .I3(ap_CS_fsm_state11),
        .I4(ap_CS_fsm_state16),
        .I5(sc_fifo_chn_1_full_n),
        .O(\out_y[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \out_y[0]_i_7 
       (.I0(ap_CS_fsm_state18),
        .I1(ap_CS_fsm_state20),
        .I2(ap_CS_fsm_state15),
        .I3(ap_CS_fsm_state14),
        .I4(ap_CS_fsm_state13),
        .I5(sc_fifo_chn_1_full_n),
        .O(\out_y[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_y[0]_i_8 
       (.I0(ap_CS_fsm_state83),
        .I1(ap_CS_fsm_state87),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state84),
        .I4(ap_CS_fsm_state82),
        .O(\out_y[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \out_y[0]_i_9 
       (.I0(ap_CS_fsm_state86),
        .I1(ap_CS_fsm_state85),
        .I2(ap_CS_fsm_state89),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state81),
        .O(\out_y[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AAAAAAAA)) 
    \out_y[1]_i_1 
       (.I0(\out_y[3]_i_2_n_0 ),
        .I1(\out_y[1]_i_2_n_0 ),
        .I2(\out_y[1]_i_3_n_0 ),
        .I3(\out_y[2]_i_3_n_0 ),
        .I4(\out_y[2]_i_2_n_0 ),
        .I5(\out_y[2]_i_4_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h333333333333333B)) 
    \out_y[1]_i_2 
       (.I0(\out_y[1]_i_4_n_0 ),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state26),
        .I3(ap_CS_fsm_state24),
        .I4(ap_CS_fsm_state27),
        .I5(ap_CS_fsm_state30),
        .O(\out_y[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFC8)) 
    \out_y[1]_i_3 
       (.I0(ap_CS_fsm_state36),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state35),
        .I3(\out_y[1]_i_5_n_0 ),
        .I4(\out_y[1]_i_6_n_0 ),
        .O(\out_y[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \out_y[1]_i_4 
       (.I0(ap_CS_fsm_state23),
        .I1(ap_CS_fsm_state25),
        .I2(ap_CS_fsm_state21),
        .I3(ap_CS_fsm_state22),
        .I4(ap_CS_fsm_state29),
        .I5(ap_CS_fsm_state28),
        .O(\out_y[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_y[1]_i_5 
       (.I0(ap_CS_fsm_state38),
        .I1(ap_CS_fsm_state39),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state33),
        .I4(ap_CS_fsm_state40),
        .O(\out_y[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \out_y[1]_i_6 
       (.I0(ap_CS_fsm_state31),
        .I1(ap_CS_fsm_state34),
        .I2(ap_CS_fsm_state37),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state32),
        .O(\out_y[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hA8AA)) 
    \out_y[2]_i_1 
       (.I0(\out_y[3]_i_2_n_0 ),
        .I1(\out_y[2]_i_2_n_0 ),
        .I2(\out_y[2]_i_3_n_0 ),
        .I3(\out_y[2]_i_4_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFF0000FFFE0000)) 
    \out_y[2]_i_10 
       (.I0(ap_CS_fsm_state75),
        .I1(ap_CS_fsm_state78),
        .I2(ap_CS_fsm_state74),
        .I3(ap_CS_fsm_state72),
        .I4(sc_fifo_chn_1_full_n),
        .I5(ap_CS_fsm_state76),
        .O(\out_y[2]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \out_y[2]_i_11 
       (.I0(ap_CS_fsm_state71),
        .I1(ap_CS_fsm_state80),
        .I2(sc_fifo_chn_1_full_n),
        .O(\out_y[2]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFC8)) 
    \out_y[2]_i_2 
       (.I0(ap_CS_fsm_state48),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state43),
        .I3(\out_y[2]_i_5_n_0 ),
        .I4(\out_y[2]_i_6_n_0 ),
        .O(\out_y[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFC8)) 
    \out_y[2]_i_3 
       (.I0(ap_CS_fsm_state58),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state59),
        .I3(\out_y[2]_i_7_n_0 ),
        .I4(\out_y[2]_i_8_n_0 ),
        .O(\out_y[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \out_y[2]_i_4 
       (.I0(\out_y[2]_i_9_n_0 ),
        .I1(\out_y[0]_i_5_n_0 ),
        .O(\out_y[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_y[2]_i_5 
       (.I0(ap_CS_fsm_state50),
        .I1(ap_CS_fsm_state41),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state47),
        .I4(ap_CS_fsm_state46),
        .O(\out_y[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \out_y[2]_i_6 
       (.I0(ap_CS_fsm_state49),
        .I1(ap_CS_fsm_state42),
        .I2(ap_CS_fsm_state44),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state45),
        .O(\out_y[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0F0E0)) 
    \out_y[2]_i_7 
       (.I0(ap_CS_fsm_state55),
        .I1(ap_CS_fsm_state56),
        .I2(sc_fifo_chn_1_full_n),
        .I3(ap_CS_fsm_state54),
        .I4(ap_CS_fsm_state60),
        .O(\out_y[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \out_y[2]_i_8 
       (.I0(ap_CS_fsm_state53),
        .I1(ap_CS_fsm_state57),
        .I2(ap_CS_fsm_state51),
        .I3(sc_fifo_chn_1_full_n),
        .I4(ap_CS_fsm_state52),
        .O(\out_y[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFEEFFEEFFEEFFEA)) 
    \out_y[2]_i_9 
       (.I0(\out_y[2]_i_10_n_0 ),
        .I1(sc_fifo_chn_1_full_n),
        .I2(ap_CS_fsm_state77),
        .I3(\out_y[2]_i_11_n_0 ),
        .I4(ap_CS_fsm_state73),
        .I5(ap_CS_fsm_state79),
        .O(\out_y[2]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \out_y[3]_i_1 
       (.I0(\out_y[3]_i_2_n_0 ),
        .O(D[3]));
  LUT2 #(
    .INIT(4'h1)) 
    \out_y[3]_i_2 
       (.I0(\out_x[3]_i_8_n_0 ),
        .I1(\out_y[0]_i_4_n_0 ),
        .O(\out_y[3]_i_2_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage
   (couleur,
    grp_dimage_fu_126_counter_read,
    Q,
    clk,
    sc_fifo_chn_1_empty_n,
    reset,
    D);
  output [0:0]couleur;
  output grp_dimage_fu_126_counter_read;
  output [0:0]Q;
  input clk;
  input sc_fifo_chn_1_empty_n;
  input reset;
  input [0:0]D;

  wire [0:0]D;
  wire [0:0]Q;
  wire clk;
  wire [0:0]couleur;
  wire grp_dimage_do_image_fu_58_n_2;
  wire grp_dimage_fu_126_counter_read;
  wire reset;
  wire sc_fifo_chn_1_empty_n;

  FDRE \couleur_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(grp_dimage_do_image_fu_58_n_2),
        .Q(couleur),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image grp_dimage_do_image_fu_58
       (.D(D),
        .Q(Q),
        .clk(clk),
        .couleur(couleur),
        .\couleur_reg[11] (grp_dimage_do_image_fu_58_n_2),
        .grp_dimage_fu_126_counter_read(grp_dimage_fu_126_counter_read),
        .reset(reset),
        .sc_fifo_chn_1_empty_n(sc_fifo_chn_1_empty_n));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image
   (grp_dimage_fu_126_counter_read,
    Q,
    \couleur_reg[11] ,
    clk,
    sc_fifo_chn_1_empty_n,
    couleur,
    reset,
    D);
  output grp_dimage_fu_126_counter_read;
  output [0:0]Q;
  output \couleur_reg[11] ;
  input clk;
  input sc_fifo_chn_1_empty_n;
  input [0:0]couleur;
  input reset;
  input [0:0]D;

  wire [0:0]D;
  wire [0:0]Q;
  wire \ap_CS_fsm[1]_i_1_n_0 ;
  wire clk;
  wire [0:0]couleur;
  wire \couleur_reg[11] ;
  wire grp_dimage_do_image_fu_58_couleur_ap_vld;
  wire grp_dimage_fu_126_counter_read;
  wire reset;
  wire sc_fifo_chn_1_empty_n;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(grp_dimage_do_image_fu_58_couleur_ap_vld),
        .I1(Q),
        .I2(sc_fifo_chn_1_empty_n),
        .I3(reset),
        .O(\ap_CS_fsm[1]_i_1_n_0 ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(D),
        .Q(Q),
        .S(reset));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\ap_CS_fsm[1]_i_1_n_0 ),
        .Q(grp_dimage_do_image_fu_58_couleur_ap_vld),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb color_U
       (.Q(Q),
        .clk(clk),
        .couleur(couleur),
        .\couleur_reg[11] (\couleur_reg[11] ),
        .grp_dimage_do_image_fu_58_couleur_ap_vld(grp_dimage_do_image_fu_58_couleur_ap_vld),
        .sc_fifo_chn_1_empty_n(sc_fifo_chn_1_empty_n));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    internal_full_n_i_2
       (.I0(Q),
        .I1(sc_fifo_chn_1_empty_n),
        .O(grp_dimage_fu_126_counter_read));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb
   (\couleur_reg[11] ,
    clk,
    grp_dimage_do_image_fu_58_couleur_ap_vld,
    couleur,
    sc_fifo_chn_1_empty_n,
    Q);
  output \couleur_reg[11] ;
  input clk;
  input grp_dimage_do_image_fu_58_couleur_ap_vld;
  input [0:0]couleur;
  input sc_fifo_chn_1_empty_n;
  input [0:0]Q;

  wire [0:0]Q;
  wire clk;
  wire [0:0]couleur;
  wire \couleur_reg[11] ;
  wire grp_dimage_do_image_fu_58_couleur_ap_vld;
  wire sc_fifo_chn_1_empty_n;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb_rom dimage_do_image_cbkb_rom_U
       (.Q(Q),
        .clk(clk),
        .couleur(couleur),
        .\couleur_reg[11] (\couleur_reg[11] ),
        .grp_dimage_do_image_fu_58_couleur_ap_vld(grp_dimage_do_image_fu_58_couleur_ap_vld),
        .sc_fifo_chn_1_empty_n(sc_fifo_chn_1_empty_n));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage_do_image_cbkb_rom
   (\couleur_reg[11] ,
    clk,
    grp_dimage_do_image_fu_58_couleur_ap_vld,
    couleur,
    sc_fifo_chn_1_empty_n,
    Q);
  output \couleur_reg[11] ;
  input clk;
  input grp_dimage_do_image_fu_58_couleur_ap_vld;
  input [0:0]couleur;
  input sc_fifo_chn_1_empty_n;
  input [0:0]Q;

  wire [0:0]Q;
  wire clk;
  wire [0:0]couleur;
  wire \couleur_reg[11] ;
  wire grp_dimage_do_image_fu_58_couleur_ap_vld;
  wire [11:11]q0;
  wire \q0[11]_i_1_n_0 ;
  wire sc_fifo_chn_1_empty_n;

  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \couleur[11]_i_1 
       (.I0(q0),
        .I1(grp_dimage_do_image_fu_58_couleur_ap_vld),
        .I2(couleur),
        .O(\couleur_reg[11] ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \q0[11]_i_1 
       (.I0(q0),
        .I1(sc_fifo_chn_1_empty_n),
        .I2(Q),
        .O(\q0[11]_i_1_n_0 ));
  FDRE \q0_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\q0[11]_i_1_n_0 ),
        .Q(q0),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w8_d1_A
   (sc_fifo_chn_1_full_n,
    sc_fifo_chn_1_empty_n,
    D,
    \out_x_reg[1] ,
    clk,
    reset,
    Q,
    grp_convergence_fu_104_s_out_write,
    grp_dimage_fu_126_counter_read,
    ap_CS_fsm_state93);
  output sc_fifo_chn_1_full_n;
  output sc_fifo_chn_1_empty_n;
  output [0:0]D;
  output \out_x_reg[1] ;
  input clk;
  input reset;
  input [0:0]Q;
  input grp_convergence_fu_104_s_out_write;
  input grp_dimage_fu_126_counter_read;
  input ap_CS_fsm_state93;

  wire [0:0]D;
  wire [0:0]Q;
  wire ap_CS_fsm_state93;
  wire clk;
  wire grp_convergence_fu_104_s_out_write;
  wire grp_dimage_fu_126_counter_read;
  wire internal_empty_n_i_1_n_0;
  wire internal_full_n_i_1_n_0;
  wire \mOutPtr[0]_i_1_n_0 ;
  wire \mOutPtr[1]_i_1_n_0 ;
  wire \mOutPtr_reg_n_0_[0] ;
  wire \mOutPtr_reg_n_0_[1] ;
  wire \out_x_reg[1] ;
  wire reset;
  wire sc_fifo_chn_1_empty_n;
  wire sc_fifo_chn_1_full_n;

  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(sc_fifo_chn_1_empty_n),
        .I1(Q),
        .O(D));
  LUT6 #(
    .INIT(64'h5544554455445504)) 
    internal_empty_n_i_1
       (.I0(reset),
        .I1(sc_fifo_chn_1_empty_n),
        .I2(Q),
        .I3(grp_convergence_fu_104_s_out_write),
        .I4(\mOutPtr_reg_n_0_[1] ),
        .I5(\mOutPtr_reg_n_0_[0] ),
        .O(internal_empty_n_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    internal_empty_n_reg
       (.C(clk),
        .CE(1'b1),
        .D(internal_empty_n_i_1_n_0),
        .Q(sc_fifo_chn_1_empty_n),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFAAFFFFFF2AFFAA)) 
    internal_full_n_i_1
       (.I0(sc_fifo_chn_1_full_n),
        .I1(\mOutPtr_reg_n_0_[1] ),
        .I2(\mOutPtr_reg_n_0_[0] ),
        .I3(reset),
        .I4(grp_convergence_fu_104_s_out_write),
        .I5(grp_dimage_fu_126_counter_read),
        .O(internal_full_n_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    internal_full_n_reg
       (.C(clk),
        .CE(1'b1),
        .D(internal_full_n_i_1_n_0),
        .Q(sc_fifo_chn_1_full_n),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hFFFF956A)) 
    \mOutPtr[0]_i_1 
       (.I0(\mOutPtr_reg_n_0_[0] ),
        .I1(sc_fifo_chn_1_empty_n),
        .I2(Q),
        .I3(grp_convergence_fu_104_s_out_write),
        .I4(reset),
        .O(\mOutPtr[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFA6669AAA)) 
    \mOutPtr[1]_i_1 
       (.I0(\mOutPtr_reg_n_0_[1] ),
        .I1(grp_convergence_fu_104_s_out_write),
        .I2(Q),
        .I3(sc_fifo_chn_1_empty_n),
        .I4(\mOutPtr_reg_n_0_[0] ),
        .I5(reset),
        .O(\mOutPtr[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \mOutPtr_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\mOutPtr[0]_i_1_n_0 ),
        .Q(\mOutPtr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \mOutPtr_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\mOutPtr[1]_i_1_n_0 ),
        .Q(\mOutPtr_reg_n_0_[1] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \out_x[1]_i_3 
       (.I0(sc_fifo_chn_1_full_n),
        .I1(ap_CS_fsm_state93),
        .O(\out_x_reg[1] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_main
   (clk,
    reset,
    x,
    y,
    couleur,
    zoom,
    offset_X,
    offset_Y);
  input clk;
  input reset;
  output [9:0]x;
  output [8:0]y;
  output [11:0]couleur;
  input [7:0]zoom;
  input [31:0]offset_X;
  input [31:0]offset_Y;

  wire \<const0> ;
  wire clk;
  wire [10:10]\^couleur ;
  wire \grp_convergence_do_convergence_fu_76/ap_CS_fsm_state93 ;
  wire grp_convergence_fu_104_s_out_write;
  wire [0:0]\grp_dimage_do_image_fu_58/ap_CS_fsm ;
  wire [0:0]\grp_dimage_do_image_fu_58/ap_NS_fsm ;
  wire grp_dimage_fu_126_counter_read;
  wire reset;
  wire sc_fifo_chn_1_empty_n;
  wire sc_fifo_chn_1_fifo_U_n_3;
  wire sc_fifo_chn_1_full_n;
  wire [3:0]\^x ;
  wire [3:0]\^y ;

  assign couleur[11] = \^couleur [10];
  assign couleur[10] = \^couleur [10];
  assign couleur[9] = \^couleur [10];
  assign couleur[8] = \^couleur [10];
  assign couleur[7] = \^couleur [10];
  assign couleur[6] = \^couleur [10];
  assign couleur[5] = \^couleur [10];
  assign couleur[4] = \^couleur [10];
  assign couleur[3] = \^couleur [10];
  assign couleur[2] = \^couleur [10];
  assign couleur[1] = \^couleur [10];
  assign couleur[0] = \^couleur [10];
  assign x[9] = \<const0> ;
  assign x[8] = \<const0> ;
  assign x[7] = \<const0> ;
  assign x[6] = \<const0> ;
  assign x[5] = \<const0> ;
  assign x[4] = \<const0> ;
  assign x[3:0] = \^x [3:0];
  assign y[8] = \<const0> ;
  assign y[7] = \<const0> ;
  assign y[6] = \<const0> ;
  assign y[5] = \<const0> ;
  assign y[4] = \<const0> ;
  assign y[3:0] = \^y [3:0];
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_convergence grp_convergence_fu_104
       (.ap_CS_fsm_state93(\grp_convergence_do_convergence_fu_76/ap_CS_fsm_state93 ),
        .clk(clk),
        .grp_convergence_fu_104_s_out_write(grp_convergence_fu_104_s_out_write),
        .internal_full_n_reg(sc_fifo_chn_1_fifo_U_n_3),
        .reset(reset),
        .sc_fifo_chn_1_full_n(sc_fifo_chn_1_full_n),
        .x(\^x ),
        .y(\^y ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dimage grp_dimage_fu_126
       (.D(\grp_dimage_do_image_fu_58/ap_NS_fsm ),
        .Q(\grp_dimage_do_image_fu_58/ap_CS_fsm ),
        .clk(clk),
        .couleur(\^couleur ),
        .grp_dimage_fu_126_counter_read(grp_dimage_fu_126_counter_read),
        .reset(reset),
        .sc_fifo_chn_1_empty_n(sc_fifo_chn_1_empty_n));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_w8_d1_A sc_fifo_chn_1_fifo_U
       (.D(\grp_dimage_do_image_fu_58/ap_NS_fsm ),
        .Q(\grp_dimage_do_image_fu_58/ap_CS_fsm ),
        .ap_CS_fsm_state93(\grp_convergence_do_convergence_fu_76/ap_CS_fsm_state93 ),
        .clk(clk),
        .grp_convergence_fu_104_s_out_write(grp_convergence_fu_104_s_out_write),
        .grp_dimage_fu_126_counter_read(grp_dimage_fu_126_counter_read),
        .\out_x_reg[1] (sc_fifo_chn_1_fifo_U_n_3),
        .reset(reset),
        .sc_fifo_chn_1_empty_n(sc_fifo_chn_1_empty_n),
        .sc_fifo_chn_1_full_n(sc_fifo_chn_1_full_n));
endmodule

(* CHECK_LICENSE_TYPE = "main_0,main,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *) 
(* x_core_info = "main,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    reset,
    x,
    y,
    couleur,
    zoom,
    offset_X,
    offset_Y);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input reset;
  (* x_interface_info = "xilinx.com:signal:data:1.0 x DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME x, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 10} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) output [9:0]x;
  (* x_interface_info = "xilinx.com:signal:data:1.0 y DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME y, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 9} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) output [8:0]y;
  (* x_interface_info = "xilinx.com:signal:data:1.0 couleur DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME couleur, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 12} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) output [11:0]couleur;
  (* x_interface_info = "xilinx.com:signal:data:1.0 zoom DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME zoom, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input [7:0]zoom;
  (* x_interface_info = "xilinx.com:signal:data:1.0 offset_X DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME offset_X, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input [31:0]offset_X;
  (* x_interface_info = "xilinx.com:signal:data:1.0 offset_Y DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME offset_Y, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input [31:0]offset_Y;

  wire clk;
  wire [11:0]couleur;
  wire [31:0]offset_X;
  wire [31:0]offset_Y;
  wire reset;
  wire [9:0]x;
  wire [8:0]y;
  wire [7:0]zoom;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_main U0
       (.clk(clk),
        .couleur(couleur),
        .offset_X(offset_X),
        .offset_Y(offset_Y),
        .reset(reset),
        .x(x),
        .y(y),
        .zoom(zoom));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
