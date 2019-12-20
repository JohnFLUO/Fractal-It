#include <SFML/Graphics.hpp>
//#include <Mouse.hpp>
#include <array>
#include <vector>
#include <thread>
#include <iostream>
#include <unistd.h>
#include <sstream>

#include "Settings.hpp"
#include "FileHandler.hpp"
#include "Mandelbrot.hpp"

#include "immintrin.h"


int main(int argc, char* argv[]) {

    // Parse parameters file
    string filename = "default_config.ini";
    if (argc > 1) {
      filename = argv[1];
    }
    ConfigReader configFile(filename);
    configFile.ParseParams();

    // Default parameters

    double offsetX =  Settings::offsetX; // and move around
    double offsetY =  Settings::offsetY;
    double zoom    = Settings::zoom; // allow the user to zoom in and out...
    int max_iters  = Settings::max_iters;

    unsigned short iterations = 256;

    double wheelZoomFactor = 0.05;

    printf("(II) Dimension de la fenetre (%d, %d)\n", Settings::width, Settings::height);

    // Mandelbrot object instanciation
    Mandelbrot mb(max_iters);

    // Window creation
    sf::RenderWindow window(sf::VideoMode(Settings::width, Settings::height), "Mandelbrot - Premium HD edition");
    window.setFramerateLimit(0);

    sf::Image image;
    image.create(Settings::width, Settings::height, sf::Color(0, 0, 0));
    sf::Texture texture;
    sf::Sprite sprite;

    bool stateChanged = true; // track whether the image needs to be regenerated
    sf::Clock clicTime;

    sf::Clock autoZoomTime;

    while (window.isOpen()) {

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
                  worldPosition.x = (position.x - (double)(Settings::width)/2.0)*zoom + offsetX;
                  worldPosition.y = (position.y - (double)(Settings::height)/2.0)*zoom + offsetY;

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
                      offsetX += (position.x - Settings::width/2) * zoom;
                      offsetY += (position.y - Settings::height/2) * zoom;
                    } else {
                      clicTime.restart();
                    }
                  }
                break;

                case sf::Event::Closed:
                    window.close();
                    break;
/*
                case sf::Event::Resized:
                    Settings::SetWidth(event.size.width);
                    Settings::SetHeight(event.size.height);
                    image.create(event.size.width, event.size.height, sf::Color(0, 0, 0));
                    printf("(II) Dimension de la fenetre (%d, %d)\n", Settings::width, Settings::height);
                    break;
*/
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
                          iterations /= 2;
                          iterations  = (iterations <= 1) ? 2 : iterations;
                          mb.setIterations( iterations );
                          break;

                        case sf::Keyboard::P :
                          iterations = (iterations*2 <= 65535) ? iterations*2 : iterations;
                          mb.setIterations( iterations );
                          break;

                        case sf::Keyboard::I :
                          printf("offsetX = %0.16lf, offsetY = %0.16lf\n", offsetX, offsetY);
                          printf("zoom = %0.16lf\n", zoom);
                          break;

                        case sf::Keyboard::R :
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

        if (Settings::autoZoom && autoZoomTime.getElapsedTime() > sf::seconds(Settings::zoomStepTime) && zoom > Settings::finalZoom) {
          zoom /= Settings::zoomFactor;
          autoZoomTime.restart();
          stateChanged = true;
        }

        if (stateChanged) {
            std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
            mb.updateImage(zoom, offsetX, offsetY, image);
            std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
            std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() <<std::endl;
            texture.loadFromImage(image);
            sprite.setTexture(texture);
            stateChanged = false;
        }
        window.draw(sprite);
        window.display();
    }
}
