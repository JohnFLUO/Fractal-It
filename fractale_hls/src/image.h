#include "systemc.h"

#define IMAGE_WIDTH  1280
#define IMAGE_HEIGHT 800
#define MAX_IT 256

SC_MODULE(image)
{
public:
  sc_in<bool> clk;
  sc_in<bool> reset;
  sc_fifo_in<sc_uint<8> >  counter;
  sc_fifo_out<sc_uint<8> > couleur;
  sc_fifo_out<sc_uint<32> >  addr;
  sc_in<int> x;
  sc_in<int> y;

	SC_CTOR(image)
	{
		SC_CTHREAD(do_image,clk.pos());
        reset_signal_is(reset, true);
	}

void do_image();
 };
