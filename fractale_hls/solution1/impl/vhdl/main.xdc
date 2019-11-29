create_clock -name clk -period 10.000 -waveform {0.000 5.000} [get_ports clk]

#set_input_delay 0 -clock CLK  [all_inputs]
#set_output_delay 0 -clock CLK [all_outputs]


