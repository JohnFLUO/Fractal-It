#include "systemc.h"

#define IMAGE_WIDTH  1280
#define IMAGE_HEIGHT 800
#define MAX_IT 256

SC_MODULE(convergence)
{
public:
  sc_in<bool> clk;
  sc_in<bool> reset;
  sc_in <sc_uint<8> > zoom;
  sc_in <float > offset_X;
  sc_in <float > offset_Y;
  sc_fifo_out<sc_uint<8> >  s_out;
  sc_out<int> out_x;
  sc_out<int> out_y;

	SC_CTOR(convergence)
	{
		SC_CTHREAD(do_convergence,clk.pos());
        reset_signal_is(reset, true);
	}

    void do_convergence();
 };
