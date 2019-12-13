// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "dimage_do_image.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic dimage_do_image::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic dimage_do_image::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<2> dimage_do_image::ap_ST_fsm_state1 = "1";
const sc_lv<2> dimage_do_image::ap_ST_fsm_state2 = "10";
const sc_lv<32> dimage_do_image::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> dimage_do_image::ap_const_lv32_1 = "1";
const bool dimage_do_image::ap_const_boolean_1 = true;

dimage_do_image::dimage_do_image(sc_module_name name) : sc_module(name), mVcdFile(0) {
    color_U = new dimage_do_image_cbkb("color_U");
    color_U->clk(ap_clk);
    color_U->reset(ap_rst);
    color_U->address0(color_address0);
    color_U->ce0(color_ce0);
    color_U->q0(color_q0);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_color_address0);
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( tmp_fu_85_p1 );

    SC_METHOD(thread_color_ce0);
    sensitive << ( counter_empty_n );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_couleur);
    sensitive << ( color_q0 );
    sensitive << ( ap_CS_fsm_state2 );

    SC_METHOD(thread_couleur_ap_vld);
    sensitive << ( ap_CS_fsm_state2 );

    SC_METHOD(thread_counter_blk_n);
    sensitive << ( counter_empty_n );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_counter_read);
    sensitive << ( counter_empty_n );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_tmp_fu_85_p1);
    sensitive << ( counter_dout );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( counter_empty_n );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );

    ap_CS_fsm = "01";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "dimage_do_image_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, counter_dout, "(port)counter_dout");
    sc_trace(mVcdFile, counter_empty_n, "(port)counter_empty_n");
    sc_trace(mVcdFile, counter_read, "(port)counter_read");
    sc_trace(mVcdFile, couleur, "(port)couleur");
    sc_trace(mVcdFile, couleur_ap_vld, "(port)couleur_ap_vld");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, color_address0, "color_address0");
    sc_trace(mVcdFile, color_ce0, "color_ce0");
    sc_trace(mVcdFile, color_q0, "color_q0");
    sc_trace(mVcdFile, counter_blk_n, "counter_blk_n");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, tmp_fu_85_p1, "tmp_fu_85_p1");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

dimage_do_image::~dimage_do_image() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    delete color_U;
}

void dimage_do_image::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
}

void dimage_do_image::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void dimage_do_image::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void dimage_do_image::thread_color_address0() {
    color_address0 =  (sc_lv<6>) (tmp_fu_85_p1.read());
}

void dimage_do_image::thread_color_ce0() {
    if ((esl_seteq<1,1,1>(counter_empty_n.read(), ap_const_logic_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        color_ce0 = ap_const_logic_1;
    } else {
        color_ce0 = ap_const_logic_0;
    }
}

void dimage_do_image::thread_couleur() {
    couleur = color_q0.read();
}

void dimage_do_image::thread_couleur_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        couleur_ap_vld = ap_const_logic_1;
    } else {
        couleur_ap_vld = ap_const_logic_0;
    }
}

void dimage_do_image::thread_counter_blk_n() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) {
        counter_blk_n = counter_empty_n.read();
    } else {
        counter_blk_n = ap_const_logic_1;
    }
}

void dimage_do_image::thread_counter_read() {
    if ((esl_seteq<1,1,1>(counter_empty_n.read(), ap_const_logic_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        counter_read = ap_const_logic_1;
    } else {
        counter_read = ap_const_logic_0;
    }
}

void dimage_do_image::thread_tmp_fu_85_p1() {
    tmp_fu_85_p1 = esl_zext<64,8>(counter_dout.read());
}

void dimage_do_image::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(counter_empty_n.read(), ap_const_logic_1) && esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            ap_NS_fsm = ap_ST_fsm_state1;
            break;
        default : 
            ap_NS_fsm = "XX";
            break;
    }
}

}

