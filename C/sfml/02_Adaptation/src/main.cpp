#include <SFML/Graphics.hpp>
//#include <Mouse.hpp>
#include <array>
#include <vector>
#include <thread>
#include <iostream>
#include <unistd.h>
#include <sstream>

//
// Les differentes techniques de coloriage de l'image
//
#include "Color/ColorSmooth/ColorSmooth.hpp"
#include "Color/ColorSmooth/ColorSmoothShifted.hpp"
#include "Color/ColorSmooth/ColorSmoothLoop.hpp"
#include "Color/ColorHSV/ColorHSV.hpp"
#include "Color/ColorHSV/ColorHSVLoop.hpp"
#include "Color/ColorLSD/ColorLSD.hpp"
#include "Color/ColorTest/ColorTest.hpp"
#include "Color/ColorGreyScale/ColorGreyScale.hpp"

#include "Convergence/double/Convergence_dp_x86.hpp"
#include "Convergence/double/Convergence_dp_x86_omp.hpp"
#include "Convergence/double/Convergence_dp_x86_omp_AVX.hpp"
#include "immintrin.h"


#include "Mandelbrot.hpp"
#include "Mandelbrot.cpp"

//enum t_color     = { TABLE_256, TABLE_SMOOTH, UNKNOW };


int main(int argc, char* argv[]) {
    double offsetX =  -0.7; // and move around
    double offsetY =   0.0;
    double zoom    = 0.004; // allow the user to zoom in and out...
    int max_iters  = 256;

    double wheelZoomFactor = 0.05;

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


    Mandelbrot<Convergence_dp_x86_omp_AVX, ColorSmoothLoop> mb(IMAGE_WIDTH, IMAGE_HEIGHT, max_iters);

    sf::RenderWindow window(sf::VideoMode(IMAGE_WIDTH, IMAGE_HEIGHT), "Mandelbrot");
    window.setFramerateLimit(0);


    sf::Image image;
    image.create(IMAGE_WIDTH, IMAGE_HEIGHT, sf::Color(0, 0, 0));
    sf::Texture texture;
    sf::Sprite sprite;

    unsigned short iterations = 256;

    bool stateChanged = true; // track whether the image needs to be regenerated
    sf::Clock clicTime;

    while (window.isOpen()) {
        /*if (sf::Mouse::isButtonPressed(sf::Mouse::Left)) {
          sf::Vector2i position = sf::Mouse::getPosition(window);
          std::cout << "position : " << position.x << ", " << position.y << std::endl;
        }*/

        sf::Event event;
        sf::Vector2i position;
        sf::Vector2<double> worldPosition;
        sf::Vector2i distanceToCenter;

        std::string dateString;
        time_t now;
        tm *ltm;

        while (window.pollEvent(event)) {
            switch (event.type) {
              case sf::Event::MouseWheelScrolled:
                  stateChanged = true;
                  position = sf::Mouse::getPosition(window);

                  //Positionnement plus agréable :
                  worldPosition.x = (position.x - (double)(IMAGE_WIDTH)/2.0)*zoom + offsetX;
                  worldPosition.y = (position.y - (double)(IMAGE_HEIGHT)/2.0)*zoom + offsetY;

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
                    if (clicTime.getElapsedTime() <= sf::seconds(0.2)) { //double clic
                      stateChanged = true;
                      position = sf::Mouse::getPosition(window);
                      offsetX += (position.x - IMAGE_WIDTH/2) * zoom;
                      offsetY += (position.y - IMAGE_HEIGHT/2) * zoom;
                    } else {
                      clicTime.restart();
                    }
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
                        case sf::Keyboard::F12 :
                            now = time(0); //Number of seconds since January 1st,1970
                            ltm = localtime(&now);

                            char buff[16];
                            snprintf(buff, sizeof(buff), "%4d%02d%02d_%02d%02d%02d",
                              (1900 + ltm->tm_year), (1 + ltm->tm_mon), (ltm->tm_mday),
                              (ltm->tm_hour), (ltm->tm_min), (ltm->tm_sec));
                            dateString = buff;
                            image.saveToFile("img/Mandelbrot_"+dateString+".png");
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
            texture.loadFromImage(image);
            sprite.setTexture(texture);
            stateChanged = false;
        }
        window.draw(sprite);
        window.display();
    }
}
