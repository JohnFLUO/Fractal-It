
#include <iostream>
#include <string>
#include <cmath>
#include <unistd.h>


using namespace std;

int main(int argc, char* argv[]) {

	int max_iters;

	printf("Nombre d'itérations : ");

	if (argc > 1) {
	    max_iters = atoi(argv[1]);
	} else {
		printf("Pas assez d'arguments\n");
	}
	
	if (max_iters < 0 || max_iters > 255) {
		printf("La valeur doit être comprise entre 0 et 255\n");
	}
	
	printf("\n\n\n");

	printf("case next_pixel is\n");

	for (int i=0; i <= max_iters; ++i) {
		float t = (float)i/(float)max_iters;
		int r   = (int)std::round( 9.f * (1.0f-t) * t * t * t               * 255.0f);
		int g   = (int)std::round(15.f * (1.0f-t) * (1.0f-t) * t * t        * 255.0f);
		int b   = (int)std::round(8.5f * (1.0f-t) * (1.0f-t) * (1.0f-t) * t * 255.0f);
		printf("\twhen x\"%0.2x\" =>\n", i);
		printf("\t\tVGA_RED <= ");
		printf("x\"%1x\";\n", r/16);
		printf("\t\tVGA_GREEN <= ");
		printf("x\"%1x\";\n", g/16);
		printf("\t\tVGA_BLUE <= ");
		printf("x\"%1x\";\n", b/16);
	}

	printf("end case\n");

}
