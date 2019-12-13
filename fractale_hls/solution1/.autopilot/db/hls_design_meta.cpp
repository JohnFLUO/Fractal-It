#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("clk", 1, hls_in, -1, "", "", 1),
	Port_Property("reset", 1, hls_in, -1, "", "", 1),
	Port_Property("x", 10, hls_out, 2, "ap_vld", "out_data", 1),
	Port_Property("y", 9, hls_out, 3, "ap_vld", "out_data", 1),
	Port_Property("couleur", 12, hls_out, 4, "ap_vld", "out_data", 1),
	Port_Property("zoom", 32, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("offset_X", 32, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("offset_Y", 32, hls_in, 7, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "main::main";
