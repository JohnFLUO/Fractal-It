#include "Mandelbrot.hpp"

template <class processor, class render>
Mandelbrot<processor, render>::Mandelbrot(int _IMAGE_WIDTH, int _IMAGE_HEIGHT, unsigned int iters) {
  IMAGE_WIDTH  = _IMAGE_WIDTH;
  IMAGE_HEIGHT = _IMAGE_HEIGHT;
  max_iters    = iters;
  allocRessources( );
}

template <class processor, class render>
Mandelbrot<processor, render>::~Mandelbrot(){
  freeRessources( );
}

template <class processor, class render>
void Mandelbrot<processor, render>::allocRessources( ){
  colors = new render   ( max_iters );
  c      = new processor( colors, max_iters );
}

template <class processor, class render>
void Mandelbrot<processor, render>::freeRessources( ){
  delete c;
  delete colors;
}

template <class processor, class render>
void Mandelbrot<processor, render>::setIterations(unsigned short iters){
  printf("(II) Number of decoding iterations = %d\n", iters);
  freeRessources( );
  max_iters = iters;
  allocRessources( );
}

template <class processor, class render>
void Mandelbrot<processor, render>::updateImage(double zoom, double offsetX, double offsetY, sf::Image& image) {
    c->updateImage(zoom, offsetX, offsetY, IMAGE_WIDTH, IMAGE_HEIGHT, image);
    sf::Color white(255, 255, 255);
    image.setPixel(IMAGE_WIDTH/2-1, IMAGE_HEIGHT/2,   white);
    image.setPixel(IMAGE_WIDTH/2+1, IMAGE_HEIGHT/2,   white);
    image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2,   white);
    image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2-1, white);
    image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2+1, white);
}


/*
template <class processor, class render>
void Mandelbrot<processor, render>::updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY)
{
    double real = 0 * zoom - IMAGE_WIDTH / 2.0 * zoom + offsetX;
    double imagstart = minY * zoom - IMAGE_HEIGHT / 2.0 * zoom + offsetY;
    for (int x = 0; x < IMAGE_WIDTH; x++, real += zoom) {
        double imag = imagstart;
        for (int y = minY; y < maxY; y++, imag += zoom) {
            assert( c != nullptr );
            int value = c->process(real, imag, MAX);
            image.setPixel(x, y, colors.getColor(value));
        }
    }
}
*/
