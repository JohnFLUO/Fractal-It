#include "convergence.h"

/// zoom offset_X offset_Y => counter




void convergence::do_convergence()  {
    int buff_counter = 0;
    int max_it = 0;

    for (int y = 0; y < IMAGE_HEIGHT; y++) {
      sc_uint<8> zooom = zoom.read();
      float off_Y = offset_Y.read();
      float off_X = offset_X.read();
      double zimag = off_Y - IMAGE_HEIGHT / 2.0f * zooom + (y * zooom);
      double zreal = off_X - IMAGE_WIDTH / 2.0f * zooom;
      double startimag = zimag;
      double startreal = zreal;

      for (int x = 0; x < IMAGE_WIDTH;  x++) {
#pragma HLS PIPELINE II=1
        max_it = 0;
        unsigned int counter = 0;
        bool end = false;
        while( (counter < MAX_IT) && end) {
          double r2 = zreal * zreal;
          double i2 = zimag * zimag;
          zimag = 2.0f * zreal * zimag + startimag;
          zreal = r2 - i2 + startreal;
          if ( (r2 + i2) > 4.0f) {
            buff_counter = counter;
            max_it = 1;
            end = true;
          }
          counter++;
        }
        if (max_it == 0) buff_counter = MAX_IT - 1;
        s_out.write(buff_counter);
        out_x.write(x);
        out_y.write(y);
      }

    }
}
