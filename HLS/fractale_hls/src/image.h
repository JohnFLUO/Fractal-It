#include "systemc.h"

#define IMAGE_WIDTH  100
#define IMAGE_HEIGHT 100
#define MAX_IT 50

SC_MODULE(dimage)
{
public:
  sc_in<bool> clk;
  sc_in<bool> reset;
  sc_fifo_in<sc_uint<8> >  counter;
  sc_out<sc_uint<12> > couleur;

	SC_CTOR(dimage)
	{
		SC_CTHREAD(do_image,clk.pos());
        reset_signal_is(reset, true);
	}

void do_image();
 };
