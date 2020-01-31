/*
 *  Adder.h
 *  SystemC_SimpleAdder
 *
 *  Created by Le Gal on 07/05/07.
 *  Copyright 2007 __MyCompanyName__. All rights reserved.
 *
 */
#include "Conversion.h"
#include<math.h>


#define SIZEINT 8
#define SIZEFRACT 6

#define SIZEDATA SIZEINT+SIZEFRACT
#define PARTENT SIZEINT

void ConversionCouleurs(int rvb[3], int ycbcr[3]){

	sc_uint< 8 > R = rvb[0] ;
	sc_uint< 8 > V = rvb[1] ;
	sc_uint< 8 > B = rvb[2] ;

	sc_uint<SIZEINT + SIZEFRACT> Y ;
	sc_uint<SIZEINT + SIZEFRACT> Cb ;
	sc_uint<SIZEINT + SIZEFRACT> Cr ;

	sc_uint<SIZEFRACT > CY1;
	CY1 = 0.30078125 * pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CY2;
	CY2 = 0.5859375* pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CY3;
	CY3 = 0.11328125* pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CCb1;
	CCb1 = 0.16796875* pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CCb2;
	CCb2 = 0.33203125* pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CCb3 ;
	CCb3 = 0.5 * pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CCr1;
	CCr1 = 0.5* pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CCr2;
	CCr2 = 0.41796875* pow(2,SIZEFRACT);
	sc_uint<SIZEFRACT> CCr3 ;
	CCr3 = 0.08203125* pow(2,SIZEFRACT);

	sc_uint<SIZEINT> coef = 128;

	Y = CY1 * R + CY2 *V + CY3*B;
	ycbcr[0] = (int)(Y >> SIZEFRACT);

	Cb = -CCb1*R - CCb2*V + CCb3*B ;
	ycbcr[1]= (int)((Cb >> SIZEFRACT) + coef);


	Cr = CCr1*R - CCr2*V - CCr3*B ;
	ycbcr[2]= (int)((Cr >> SIZEFRACT) + coef);

}


void Conversion::do_conversion(){

	int t[3];
//  char t2[3];

sc_uint<32>  t0;
sc_uint<32>  t1;
sc_uint<32>  t2;

	sc_uint<24> din ;
	int d[3];
	while( true ){
					din = e.read();
					d[0] = (int) din.range(7,0);
					d[1] = (int) din.range(15,8);
					d[2] = (int) din.range(23,16);
					ConversionCouleurs(d,t);
					t0 = t[0];
					t1 = t[1];
					t2 = t[2];

					sc_uint<8> a;
					sc_uint<8> b;
					sc_uint<8> c;

					a = t0.range(7,0);

					b = t1.range(7,0);

					c = t2.range(7,0);

					sc_uint<24> res = (c, b, a);
					s.write(res);

	}
}
