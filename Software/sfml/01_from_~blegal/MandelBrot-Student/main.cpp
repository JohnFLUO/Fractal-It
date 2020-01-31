#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>
#include <iostream>
#include <unistd.h>

//
// Les differentes techniques de coloriage de l'image
//
#include "Color/ColorSmooth/ColorSmooth.hpp"

#include "Convergence/double/Convergence_dp_x86.hpp"

#include "immintrin.h"

//enum t_color     = { TABLE_256, TABLE_SMOOTH, UNKNOW };

enum t_format    { f_double, f_float, f_int };
enum t_processor { x86, sse, avx, cuda };

template <
    class processor,
    class render
>
class Mandelbrot {
private:
    render* colors;
    processor* c;
    int IMAGE_WIDTH;
    int IMAGE_HEIGHT;
    unsigned int max_iters;

public:
    Mandelbrot(int _IMAGE_WIDTH, int _IMAGE_HEIGHT, unsigned int iters)//: colors( _max ), c(&colors, _max)
    {
      IMAGE_WIDTH  = _IMAGE_WIDTH;
      IMAGE_HEIGHT = _IMAGE_HEIGHT;
      max_iters    = iters;
      allocRessources( );
    }

    ~Mandelbrot(){
      freeRessources( );
    }

    void freeRessources( ){
      delete c;
      delete colors;
    }

    void allocRessources( ){
      colors = new render   ( max_iters );
      c      = new processor( colors, max_iters );
    }

    void setIterations(unsigned short iters){
      printf("(II) Number of decoding iterations = %d\n", iters);
      freeRessources( );
      max_iters = iters;
      allocRessources( );
    }

    void updateImage(double zoom, double offsetX, double offsetY, sf::Image& image)
    {
        c->updateImage(zoom, offsetX, offsetY, IMAGE_WIDTH, IMAGE_HEIGHT, image);
        sf::Color white(255, 255, 255);
        image.setPixel(IMAGE_WIDTH/2-1, IMAGE_HEIGHT/2,   white);
        image.setPixel(IMAGE_WIDTH/2+1, IMAGE_HEIGHT/2,   white);
        image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2,   white);
        image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2-1, white);
        image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2+1, white);
    }

private:
    int MAX;
    void updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY);
};

/*
void Mandelbrot::updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY)
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


/*
void Mandelbrot::updateImage(double zoom, double offsetX, double offsetY, sf::Image& image)
{
    const int STEP = IMAGE_HEIGHT / 1;//std::thread::hardware_concurrency();
    std::vector<std::thread> threads;
    for (int i = 0; i < IMAGE_HEIGHT; i += STEP) {
        //std::cout << "B" << std::endl;
        threads.push_back(std::thread(&Mandelbrot::updateImageSlice, *this, zoom, offsetX, offsetY, std::ref(image), i, std::min(i+STEP, IMAGE_HEIGHT)));
    }
    for (auto &t : threads) {
        t.join();
    }

    sf::Color white(255, 255, 255);
    image.setPixel(IMAGE_WIDTH/2-1, IMAGE_HEIGHT/2,   white);
    image.setPixel(IMAGE_WIDTH/2+1, IMAGE_HEIGHT/2,   white);
    image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2,   white);
    image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2-1, white);
    image.setPixel(IMAGE_WIDTH/2,   IMAGE_HEIGHT/2+1, white);

}
*/
#if 0
#else
#endif

int main(int argc, char* argv[]) {
    double offsetX =  -0.7; // and move around
    double offsetY =   0.0;
    double zoom    = 0.004; // allow the user to zoom in and out...
    int max_iters  = 256;

    int IMAGE_WIDTH  = 1280;
    int IMAGE_HEIGHT = 800;

//    enum t_format    = { f_double, f_float, f_int };
//    enum t_processor = { x86, sse, avx, cuda };

    enum t_format    f_data = f_double;
    enum t_processor t_proc = x86;

    int opt = 0;
    while ((opt = getopt(argc, argv, "i:x:y:w:h:")) != -1) {
      switch(opt) {

        case 'w':
          IMAGE_WIDTH = atoi( optarg );
          printf("(II) IMAGE_WIDTH = %d\n", IMAGE_WIDTH);
          break;

          case 'h':
            IMAGE_HEIGHT = atoi( optarg );
            printf("(II) IMAGE_HEIGHT = %d\n", IMAGE_HEIGHT);
            break;

            case 'i':
              max_iters = atoi( optarg );
              printf("(II) Iteration option value = %d\n", max_iters);
              break;

        case 'x':
          offsetX = atof( optarg );
          printf("(II) X option value = %lf\n", offsetX);
          break;

        case 'y':
          offsetY = atof( optarg );
          printf("(II) Y option value = %lf\n", offsetY);
          break;

        default:
         printf("(EE) Invalid option received\n");
         exit( -1 );
         break;
     }
   }

    printf("(II) Dimension de la fenetre (%d, %d)\n", IMAGE_WIDTH, IMAGE_HEIGHT);


    Mandelbrot<Convergence_dp_x86, ColorSmooth> mb(IMAGE_WIDTH, IMAGE_HEIGHT, max_iters);

    sf::RenderWindow window(sf::VideoMode(IMAGE_WIDTH, IMAGE_HEIGHT), "Mandelbrot");
    window.setFramerateLimit(0);



    sf::Image image;
    image.create(IMAGE_WIDTH, IMAGE_HEIGHT, sf::Color(0, 0, 0));
    sf::Texture texture;
    sf::Sprite sprite;

    unsigned short iterations = 256;

    bool stateChanged = true; // track whether the image needs to be regenerated

    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            switch (event.type) {
                case sf::Event::Closed:
                    window.close();
                    break;
                case sf::Event::KeyPressed:
                    stateChanged = true; // image needs to be recreated when the user changes zoom or offset
                    switch (event.key.code) {
                        case sf::Keyboard::Escape :
                            window.close();
                            break;
                        case sf::Keyboard::A :
                            zoom *= 0.75;
                            break;
                        case sf::Keyboard::Z :
                            zoom /= 0.75;
                            break;

                        case sf::Keyboard::O :
                          iterations /= 2;
                          iterations  = (iterations == 0) ? 1 : iterations;
                          mb.setIterations( iterations );
                          break;

                        case sf::Keyboard::P :
                          iterations *= 2;
                          mb.setIterations( iterations );
                          break;

                        case sf::Keyboard::Up:
                            offsetY -= 10 * zoom;
                            break;
                        case sf::Keyboard::Down:
                            offsetY += 10 * zoom;
                            break;
                        case sf::Keyboard::Left:
                            offsetX -= 10 * zoom;
                            break;
                        case sf::Keyboard::Right:
                            offsetX += 10 * zoom;
                            break;

                        default:
                            stateChanged = false;
                            break;
                    }
                default:
                    break;
            }
        }

        if (stateChanged) {
            std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
            mb.updateImage(zoom, offsetX, offsetY, image);
            std::chrono::steady_clock::time_point end= std::chrono::steady_clock::now();
            std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() <<std::endl;
            texture.loadFromImage(image);
            sprite.setTexture(texture);
            stateChanged = false;
        }
        window.draw(sprite);
        window.display();
    }
}
