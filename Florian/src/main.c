#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_IT 100
#define PAS 0.005
#define ZOOM 0.1
#define DECALAGE_Y 0
#define DECALAGE_X 0



int main( int argc, char ** argv ) {

	int boucle;
	float zoom = 2;
	float pas = 0.1;
	for ( boucle = 0; boucle <4; boucle ++){

					int nbelmt = 2*zoom/pas;
					int i;
					int j;
					for (i=0; i<nbelmt; i++){
						for (j=0; j<nbelmt; j++){
								float x0 = j*pas - zoom + DECALAGE_X ;
								float y0 = i*pas - zoom + DECALAGE_Y;
								float x = 0;
								float y = 0;
								if ((x0+1)*(x0+1) + y0*y0  < 1/16){
									printf("* ");
								} else {
												float p = sqrt( (x0-1/4)*(x0-1/4) + y0*y0 );
												if ( x < p - 2*p*p + 1/4){
													printf("* ");
												} else {
														int iteration = 0;
														while ((x*x+y*y < 4) && (iteration < MAX_IT) ){
															float temp = x;
															x = x*x -y*y + j*pas - zoom + DECALAGE_X;
															y = 2*temp*y + i*pas - zoom + DECALAGE_Y;
															iteration++;
														}
														if (iteration == MAX_IT) {
															printf("* ");
														} else {
															printf("_ ");
														}

								}}
						}
						printf("\n");
					}

					zoom = zoom/2;
					pas = pas/2;
					printf("\n\n");
			}
	return 1;
}





// TEST ALGOx*x+y*y

/*
int main( int argc, char ** argv ) {

	int nbelmt = 2*ZOOM/PAS;
	int delta;
	int deltai;
	int i = 0;
	int j = 0;
	int a[100];
	int b[100];
	int c[100];
	int ai[100];
	int bi[100];
	int ci[100];
	a[0] = 1;
	ai[0] = 0;
	b[0] = 0;
	bi[0] = 0;
	c[0] = 0;
	ci[0] = 0;
	float z[100];
	float zi[100];
	z[0] = -2; // pt de references
	zi[0] = 1; // idem
	// calcul des zn, an ,bn, cn au pt de references
	int ii;
	for (ii = 1; ii < MAX_IT; ii++){
		z[ii] = z[ii-1]*z[ii-1] - zi[ii-1]*zi[ii-1] + z[0];
		zi[ii] = 2*z[ii-1]*zi[ii-1] + zi[0];
		a[ii]  = 2*(a[ii-1]*z[ii-1] - ai[ii-1]*zi[ii-1]) + 1;
		ai[ii] = 2*( ai[ii-1]*z[ii-1] + a[ii-1]*zi[ii-1]);
		b[ii] = a[ii-1]*a[ii-1] - ai[ii- 1]*ai[ii-1] + 2*(b[ii-1]*z[ii-1] - bi[ii-1]*zi[ii-1]);
		bi[ii] = 2*a[ii-1]*ai[ii-1] + 2*(b[ii-1]*zi[ii-1] + bi[ii-1]*z[ii-1]);
		c[ii] = 2*(a[ii-1]*b[ii-1] - ai[ii-1]*bi[ii-1]) + 2*(c[ii-1]*z[ii-1] - ci[ii-1]*zi[ii-1]);
		ci[ii] = 2*(a[ii-1]*bi[ii-1] + ai[ii-1]*b[ii-1]) + 2*(c[ii-1]*zi[ii-1] + ci[ii-1]*z[ii-1]);
	}
	for (i=0; i<nbelmt; i++){
		for (j=0; j<nbelmt; j++){
			float x0 = i*PAS - ZOOM + DECALAGE_X;
			float y0 = i*PAS - ZOOM + DECALAGE_Y;
				// deltan = an*delta0 + bn*delta0**2 + cn*delta0**3
				// z'n (=delta ici) = deltan + zn
				delta = a[99]*x0 + b[99]*(x0*x0 - y0*y0) +c[99]*(x0*x0*x0 - 3*x0*y0*y0) + z[99];
				deltai = ai[99]*y0 + bi[99]*(2*x0*y0) +ci[99]*(-y0*y0*y0 + 3*x0*x0*y0) + zi[99];
			if (delta*delta + deltai*deltai < 4) {
				printf("* ");
			} else {
				printf("_ ");
			}
		}
		printf("\n");
	}

	return 1;
}
*/
