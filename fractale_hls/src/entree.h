#include "systemc.h"

#define IMAGE_WIDTH  1280
#define IMAGE_HEIGHT 800
#define MAX_IT 256

SC_MODULE(entree)
{
public:
  sc_in<bool> clk;
  sc_in<bool> reset;
  sc_out<sc_uint<8> > zoom;
  sc_out<float> offset_Y;
  sc_out<float> offset_X;

	SC_CTOR(entree)
	{
		SC_CTHREAD(do_entree,clk.pos());
        reset_signal_is(reset, true);
	}
void do_entree();
 };
