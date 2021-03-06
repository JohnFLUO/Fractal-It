// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dimage_do_image (
        ap_clk,
        ap_rst,
        counter_dout,
        counter_empty_n,
        counter_read,
        couleur,
        couleur_ap_vld
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input  [7:0] counter_dout;
input   counter_empty_n;
output   counter_read;
output  [11:0] couleur;
output   couleur_ap_vld;

reg counter_read;
reg couleur_ap_vld;

wire   [5:0] color_address0;
reg    color_ce0;
wire   [11:0] color_q0;
reg    counter_blk_n;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [63:0] tmp_fu_85_p1;
wire    ap_CS_fsm_state2;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

dimage_do_image_cbkb #(
    .DataWidth( 12 ),
    .AddressRange( 51 ),
    .AddressWidth( 6 ))
color_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(color_address0),
    .ce0(color_ce0),
    .q0(color_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (*) begin
    if (((counter_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        color_ce0 = 1'b1;
    end else begin
        color_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        couleur_ap_vld = 1'b1;
    end else begin
        couleur_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        counter_blk_n = counter_empty_n;
    end else begin
        counter_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((counter_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        counter_read = 1'b1;
    end else begin
        counter_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((counter_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign color_address0 = tmp_fu_85_p1;

assign couleur = color_q0;

assign tmp_fu_85_p1 = counter_dout;

endmodule //dimage_do_image
