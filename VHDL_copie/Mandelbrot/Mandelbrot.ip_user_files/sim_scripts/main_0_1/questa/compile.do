vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../ipstatic/hdl/vhdl/convergence.vhd" \
"../../../ipstatic/hdl/vhdl/convergence_do_convergence.vhd" \
"../../../ipstatic/hdl/vhdl/dimage.vhd" \
"../../../ipstatic/hdl/vhdl/dimage_do_image.vhd" \
"../../../ipstatic/hdl/vhdl/dimage_do_image_cbkb.vhd" \
"../../../ipstatic/hdl/vhdl/fifo_w8_d1_A.vhd" \
"../../../ipstatic/hdl/vhdl/main.vhd" \
"../../../../../../../../../ok/EN325-Advanced-digital-design/6_HLS/RGB_2_YUV/solution1/impl/ip/main_0_1/sim/main_0.vhd" \


