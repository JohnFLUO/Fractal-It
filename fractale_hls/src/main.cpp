
#include <iostream>
#include <math.h>
#include "convergence.h"
#include "image.h"
#include "entree.h"
#include "systemc.h"


using namespace std;


int main (int argc, char * argv []){

	//cout << "Initialisation des composants..." << endl;
	entree      		entree ("entree");
	convergence	    convergence("calcul");
	image           image("image");

	//cout << "Creation des signaux d'interconnexion..." << endl;

	sc_fifo<sc_uint<32> >  addr("addr", 128);
	sc_signal<bool>					s_in1("entree");
	sc_fifo<sc_uint<8> >  couleur("couleur", 128);

	sc_fifo<sc_uint<8> >  counter;
	sc_in <sc_uint<8> > zoom;
	sc_signal <float> offset_X;
	sc_signal <float> offset_Y;
	sc_signal<int> x;
	sc_signal<int> y;

	sc_signal<bool> reset;

	//sc_signal<bool> clk;
	sc_clock clk("clk",10,SC_NS);

	//cout << "Mapping des composants..." << endl;
	entree.clk(clk);
	convergence.clk(clk);
	image.clk(clk);

	convergence.reset(reset);
	image.reset(reset);
	entree.reset(reset);

	image.counter(counter);
	image.couleur(couleur);
	image.addr(addr);
	image.x(x);
	image.y(y);

	convergence.zoom(zoom);
	convergence.offset_X(offset_X);
	convergence.offset_Y(offset_Y);
	convergence.s_out(counter);
	convergence.out_x(x);
	convergence.out_y(y);

	/*sc_trace_file* ma_trace = sc_create_vcd_trace_file("trace.vcd");
	sc_trace(ma_trace, clk, "signal_clk");
	sc_trace(ma_trace, counter, "counter");
	sc_trace(ma_trace, couleur, "couleur");
	cout << "Lancement de la simulation du circuit..." << endl;
	sc_start(100,SC_MS);
	cout << "TIME : "<< sc_time_stamp()<< endl;
	cout << "Fin de la simulation du circuit..." << endl;
	//sc_start(200, SC_NS);
	sc_close_vcd_trace_file(ma_trace);*/

    return 0;
}
