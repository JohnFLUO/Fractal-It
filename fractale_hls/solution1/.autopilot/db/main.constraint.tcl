set clock_constraint { \
    name clk \
    module main::main \
    port ap_clk \
    period 10 \
    uncertainty 1.25 \
}

set MultiClock_number 1

set MultiClock_constraint {  clk 10 }

set all_path {}

set false_path {}

