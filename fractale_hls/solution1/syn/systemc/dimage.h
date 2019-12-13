// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _dimage_HH_
#define _dimage_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "dimage_do_image.h"

namespace ap_rtl {

struct dimage : public sc_module {
    // Port declarations 6
    sc_in_clk clk;
    sc_in< sc_logic > reset;
    sc_in< sc_lv<8> > counter_dout;
    sc_in< sc_logic > counter_empty_n;
    sc_out< sc_logic > counter_read;
    sc_out< sc_lv<12> > couleur;


    // Module declarations
    dimage(sc_module_name name);
    SC_HAS_PROCESS(dimage);

    ~dimage();

    sc_trace_file* mVcdFile;

    dimage_do_image* grp_dimage_do_image_fu_58;
    sc_signal< sc_logic > grp_dimage_do_image_fu_58_counter_read;
    sc_signal< sc_lv<12> > grp_dimage_do_image_fu_58_couleur;
    sc_signal< sc_logic > grp_dimage_do_image_fu_58_couleur_ap_vld;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_couleur();
    void thread_counter_read();
};

}

using namespace ap_rtl;

#endif
