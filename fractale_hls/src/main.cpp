

#include "systemc.h"

#include "convergence.h"
#include "image.h"

SC_MODULE(main)
{
public:
    sc_in<bool> clk;
    sc_in<bool> reset;
	sc_out <sc_uint<10> >  x;
	sc_out <sc_uint<9> >   y;
	sc_out <sc_uint<12> >  couleur;
	sc_fifo<sc_uint<8> >  counter;
	sc_in <sc_uint<10> > zoom;
	sc_in <float> offset_X;
	sc_in <float> offset_Y;

	SC_CTOR(main):
		convergence ("convergence"),
		dimage ("image")
	{
		convergence.clk(clk);
		dimage.clk(clk);

		convergence.reset(reset);
		dimage.reset(reset);

		dimage.counter(counter);
		dimage.couleur(couleur);

		convergence.zoom(zoom);
		convergence.offset_X(offset_X);
		convergence.offset_Y(offset_Y);
		convergence.s_out(counter);
		convergence.out_x(x);
		convergence.out_y(y);
	}

private :
	convergence	    convergence;
	dimage           dimage;


};
