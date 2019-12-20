// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="convergence,hls_ip_2018_2,{HLS_INPUT_TYPE=sc,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100tcsg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.908000,HLS_SYN_LAT=51,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=119,HLS_SYN_LUT=554,HLS_VERSION=2018_2}" *)

module convergence (
        clk,
        reset,
        zoom,
        offset_X,
        offset_Y,
        s_out_din,
        s_out_full_n,
        s_out_write,
        out_x,
        out_y
);


input   clk;
input   reset;
input  [9:0] zoom;
input  [31:0] offset_X;
input  [31:0] offset_Y;
output  [7:0] s_out_din;
input   s_out_full_n;
output   s_out_write;
output  [9:0] out_x;
output  [8:0] out_y;

reg[9:0] out_x;
reg[8:0] out_y;

wire   [0:0] convergence_ssdm_s_load_fu_96_p1;
wire   [1:0] ap_CS_fsm;
wire   [7:0] grp_convergence_do_convergence_fu_76_s_out_din;
wire    grp_convergence_do_convergence_fu_76_s_out_write;
wire   [9:0] grp_convergence_do_convergence_fu_76_out_x;
wire    grp_convergence_do_convergence_fu_76_out_x_ap_vld;
wire   [8:0] grp_convergence_do_convergence_fu_76_out_y;
wire    grp_convergence_do_convergence_fu_76_out_y_ap_vld;
wire    ap_CS_fsm_state2;

convergence_do_convergence grp_convergence_do_convergence_fu_76(
    .ap_clk(clk),
    .ap_rst(reset),
    .zoom(zoom),
    .offset_X(offset_X),
    .offset_Y(offset_Y),
    .s_out_din(grp_convergence_do_convergence_fu_76_s_out_din),
    .s_out_full_n(s_out_full_n),
    .s_out_write(grp_convergence_do_convergence_fu_76_s_out_write),
    .out_x(grp_convergence_do_convergence_fu_76_out_x),
    .out_x_ap_vld(grp_convergence_do_convergence_fu_76_out_x_ap_vld),
    .out_y(grp_convergence_do_convergence_fu_76_out_y),
    .out_y_ap_vld(grp_convergence_do_convergence_fu_76_out_y_ap_vld)
);

always @ (posedge clk) begin
    if ((grp_convergence_do_convergence_fu_76_out_x_ap_vld == 1'b1)) begin
        out_x <= grp_convergence_do_convergence_fu_76_out_x;
    end
end

always @ (posedge clk) begin
    if ((grp_convergence_do_convergence_fu_76_out_y_ap_vld == 1'b1)) begin
        out_y <= grp_convergence_do_convergence_fu_76_out_y;
    end
end

assign ap_CS_fsm = 2'd0;

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign convergence_ssdm_s_load_fu_96_p1 = 1'd0;

assign s_out_din = grp_convergence_do_convergence_fu_76_s_out_din;

assign s_out_write = grp_convergence_do_convergence_fu_76_s_out_write;

endmodule //convergence
