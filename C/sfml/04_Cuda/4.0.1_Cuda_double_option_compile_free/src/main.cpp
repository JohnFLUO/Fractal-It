#include <SFML/Graphics.hpp>
//#include <Mouse.hpp>
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
#include "Mandelbrot.hpp"
#include "Mandelbrot.cpp"

//enum t_color     = { TABLE_256, TABLE_SMOOTH, UNKNOW };


int main(int argc, char* argv[]) {
    double offsetX =  -1.7864343; // and move around / default: -0.7
    double offsetY =   0.0; // default : 0.0
    double zoom    = 2.0e-08; // allow the user to zoom in and out... /default : 0.004
    int max_iters  = 4096; // default 256

    double wheelZoomFactor = 0.05;

    int IMAGE_WIDTH  = 1920; //1280
    int IMAGE_HEIGHT = 1080; //800

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
        /*if (sf::Mouse::isButtonPressed(sf::Mouse::Left)) {
          sf::Vector2i position = sf::Mouse::getPosition(window);
          std::cout << "position : " << position.x << ", " << position.y << std::endl;
        }*/

        sf::Event event;
        sf::Vector2i position;
        sf::Vector2f worldPosition;
        sf::Vector2i distanceToCenter;

        while (window.pollEvent(event)) {
            switch (event.type) {
              case sf::Event::MouseWheelScrolled:
                  stateChanged = true;
                  position = sf::Mouse::getPosition(window);

                  // Positionnement sur la souris
                  /*offsetX += (position.x - (float)(IMAGE_WIDTH)/2.0)*zoom;
                  offsetY += (position.y - (float)(IMAGE_HEIGHT)/2.0)*zoom;*/

                  //Positionnement plus agréable :
                  worldPosition.x = (position.x - (float)(IMAGE_WIDTH)/2.0)*zoom + offsetX;
                  worldPosition.y = (position.y - (float)(IMAGE_HEIGHT)/2.0)*zoom + offsetY;

                  if (event.mouseWheelScroll.delta > 0) {
                    for (int i = 0 ; i < event.mouseWheelScroll.delta ; i++) {
                      offsetX += (worldPosition.x - offsetX)*wheelZoomFactor;
                      offsetY += (worldPosition.y - offsetY)*wheelZoomFactor;
                      zoom /= wheelZoomFactor+1;
                    }
                  } else {
                    for (int i = 0 ; i < -event.mouseWheelScroll.delta ; i++) {
                      offsetX += (offsetX - worldPosition.x)*wheelZoomFactor;
                      offsetY += (offsetY - worldPosition.y)*wheelZoomFactor;
                      zoom *= wheelZoomFactor+1;
                    }
                  }
              break;

              case sf::Event::MouseButtonPressed:
                  if (event.mouseButton.button == sf::Mouse::Left) {
                      stateChanged = true;
                      position = sf::Mouse::getPosition(window);
                      //std::cout << "offsetX = " << offsetX << ", position : " << worldPosition.x << ", " << worldPosition.y << std::endl;
                      offsetX += (position.x - IMAGE_WIDTH/2) * zoom;
                      offsetY += (position.y - IMAGE_HEIGHT/2) * zoom;
                    }
                break;

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
                          iterations /= 1.5;
                          iterations  = (iterations == 0) ? 1 : iterations;
                          mb.setIterations( iterations );
                          break;

                        case sf::Keyboard::P :
                          iterations *= 1.5;
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
/*
            std::cout << "Zoom = " << zoom <<std::endl;
            std::cout << "OffsetX = " << offsetX <<std::endl;
            std::cout << "OffsetY = " << offsetY <<std::endl;
*/
            texture.loadFromImage(image);
            sprite.setTexture(texture);
            stateChanged = false;
        }
        window.draw(sprite);
        window.display();
    }
}
