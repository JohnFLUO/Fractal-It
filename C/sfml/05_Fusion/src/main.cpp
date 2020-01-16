#include <SFML/Graphics.hpp>
//#include <Mouse.hpp>
#include <array>
#include <vector>
#include <thread>
#include <iostream>
#include <unistd.h>
#include <sstream>

#include "Utils.hpp"
#include "Settings.hpp"
#include "FileHandler.hpp"
#include "Mandelbrot.hpp"
#include "Convergence/fixed/fixed_point.hpp"

#include "immintrin.h"
#include "StringUtils.hpp"
#include <getopt.h>

#define LONG_OPTION 0
#define TAB_CSV_HSTART 2
#define TAB_CSV_VSTART 10
#define TAB_CSV_VSTEP 30


int main(int argc, char* argv[]) {

    // Parse parameters file :
    string filename = "default_config.ini";
    if (argc > 1) {
      string argv1 = argv[1];
      if (argv1.at(0) != '-') {
        filename = argv[1];
      }
    }

    ConfigReader configFile(filename);
    configFile.ParseParams();

    // Parse command options :
    int opt = 0;
    int option_index = 0;

    static struct option long_options[] = {
      {"dp",           no_argument, 0, 0},
      {"dp_omp",       no_argument, 0, 0},
      {"dp_omp_avx",   no_argument, 0, 0},
      {"dp_omp_avx+",  no_argument, 0, 0},
      {"dp_omp_avx++", no_argument, 0, 0},
      {"sp",           no_argument, 0, 0},
      {"sp_omp",       no_argument, 0, 0},
      {"sp_omp_avx",   no_argument, 0, 0},
      {"sp_omp_avx+",  no_argument, 0, 0},
      {"sp_omp_avx++", no_argument, 0, 0},
      {"fp",           no_argument, 0, 0},
      {"fp_omp",       no_argument, 0, 0},
      {"fp_omp_SSE2",  no_argument, 0, 0},
      {"fp_omp_AVX2",  no_argument, 0, 0},
      {"cuda_d",       no_argument, 0, 0},
      {"cuda_d2",      no_argument, 0, 0},
      {"cuda_d2_wp",   no_argument, 0, 0},

      {"close",        no_argument, 0, 0},
      {"fluffy",       no_argument, 0, 0},
      {"first",        no_argument, 0, 0},
      {"last",         no_argument, 0, 0},
      {"save",         no_argument, 0, 0},

      {"nbsimu",       required_argument, 0, 0},
      {"maxiter",      required_argument, 0, 0},
      {"testid",       required_argument, 0, 0},
      {"testID",       required_argument, 0, 0},

      {0, 0, 0, 0}
    };

    while ((opt = getopt_long(argc, argv, "x:y:w:h:i:d:csfl", long_options, &option_index)) != -1) {
    //while ((opt = getopt(argc, argv, ":c:")) != -1) {
      string long_opt;
      switch (opt) {
      case LONG_OPTION :
        long_opt = long_options[option_index].name;
        stringToUppercase(&long_opt);
        if (optarg) {
          if (long_opt == "NBSIMU") {
            Settings::SetNbSimulations(atoi(optarg));
          } else if (long_opt == "MAXITER") {
            Settings::SetMaxIter(atoi(optarg));
          } else if (long_opt == "MAXITER") {
            Settings::SetMaxIter(atoi(optarg));
          } else if (long_opt == "TESTID") {
            Settings::SetTestID(stringToInt(optarg));
          }
        } else {
          if (long_opt == "CLOSE") {
            Settings::SetCloseAfterSimulation(true);
          } else if (long_opt == "FLUFFY") {
            printf("TODO --fluffy\n");
          } else if (long_opt == "FIRST") {
            Settings::SetFirstSimulation(true);
          } else if (long_opt == "LAST") {
            Settings::SetLastSimulation(true);
          } else if (long_opt == "SAVE") {
            Settings::SetLogToFile(true);
          } else {
            bool sucessfullyParsed = ConfigReader::ParseConvergenceType(long_opt);
            if (!sucessfullyParsed) {
              cout << "\033[33m" << endl; //unix only
              cerr << "warning: unknown long option \"" << long_opt << "\""<< endl;
              cout << "\033[0m"  << endl;
            }
          }
        }
        break;

      case 'x' :
        Settings::SetOffsetX(stringToDouble(optarg));
        break;

      case 'y' :
        Settings::SetOffsetY(stringToDouble(optarg));
        break;

      case 'w' :
        Settings::SetWidth(stringToInt(optarg));
        break;

      case 'h' :
        Settings::SetHeight(stringToInt(optarg));
        break;

      case 'i' :
        Settings::SetMaxIter(stringToInt(optarg));
        break;

      case 'c' : // close after simulation
        Settings::SetCloseAfterSimulation(true);
        break;

      case 'f' :
        Settings::SetFirstSimulation(true);
        break;

      case 'l' :
        Settings::SetLastSimulation(true);
        break;

      case 's' :
        Settings::SetLogToFile(true);
        break;

      case 'd' :
        Settings::SetTestID(stringToInt(optarg));
        break;

      default:
      /*cout << "\033[33m" << endl; //unix only
      cerr << "warning: invalid option received\"-" << opt << "\""<< endl;
      cout << "\033[0m"  << endl;
      exit(-1);*/
        break;
      }
   }

   // Get result template
   vector< vector<string> > tab_csv;
   if (Settings::firstSimulation || Settings::testID == 0) {
     tab_csv = CSVHandler::ReadCSV("results_template.csv");
   } else {
     tab_csv = CSVHandler::ReadCSV("tmp.csv");
   }


    // Apply parameters :
    double offsetX = Settings::offsetX; // and move around
    double offsetY = Settings::offsetY;
    double zoom    = Settings::zoom; // allow the user to zoom in and out...
    int max_iters  = Settings::max_iters;


    unsigned short iterations = Settings::max_iters; //256;
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
    std::chrono::steady_clock::time_point autoZoomBegin = std::chrono::steady_clock::now();
    unsigned int sumDuration = 0;
    unsigned int avgTime;
    unsigned int medianTime;
    unsigned int maxDuration = 0;
    unsigned int minDuration = 1000000;

    bool autoZoomFinished = false;
    bool autoZoomFinished_10times = false;
    unsigned int compteur_autoZoom = 1;
    std::vector<unsigned int> execTimes;

    while (window.isOpen()) {

        sf::Event event;
        sf::Vector2i position;
        sf::Vector2<double> worldPosition;
        sf::Vector2i distanceToCenter;

        std::string dateString;

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
                            dateString = dateTimeString();
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
                          //print_fi32_hex("offsetX fi = ", double_to_fi32(offsetX, FI_32_25));
                          //print_fi32_hex("offsetY fi = ", double_to_fi32(offsetY, FI_32_25));
                          //print_fi32_hex("zoom fi = ", double_to_fi32(zoom, FI_32_25));
                          break;

                        case sf::Keyboard::C :
                          Settings::SetCentralDot(!Settings::isCentralDotEnable);
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


        if (Settings::autoZoom && !autoZoomFinished && zoom < Settings::finalZoom && Settings::nbSimulations > 0) {
          std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
          //calcul stats
          unsigned int nbSimu = Settings::nbSimulations;
          unsigned int curentDuration = std::chrono::duration_cast<std::chrono::milliseconds>(end - autoZoomBegin).count();
          execTimes.push_back(curentDuration);
          sumDuration += curentDuration;
          maxDuration = (maxDuration > curentDuration ? maxDuration : curentDuration);
          minDuration = (minDuration < curentDuration ? minDuration : curentDuration);
          avgTime = sumDuration/compteur_autoZoom;
          medianTime = median(execTimes);
          if (nbSimu == 1) {
            std:: cout << "AutoZoom terminé, durée totale : " << curentDuration/1000.0f <<  " s" << std::endl;
          } else {
            std:: cout << "AutoZoom "<<compteur_autoZoom<<"/"<< nbSimu << " terminé, durée totale : " << curentDuration/1000.0f <<  " s" << std::endl;
          }
          //actualisation variables
          compteur_autoZoom += 1;
          zoom = Settings::zoom; //zoom remis a zero
          autoZoomBegin = std::chrono::steady_clock::now();//remise pour que les calculs de stats n'ai pas d'influence
          if (compteur_autoZoom > nbSimu) {
            autoZoomFinished = true; //fini
            execTimes.clear();
            std::cout << "Temps total  : " << sumDuration/1000.0f << " s" <<std::endl;
            if (nbSimu > 1) {
              std::cout << "Temps median : " << medianTime/1000.0f << " s" <<std::endl;
              std::cout << "Temps moyen  : " << avgTime/1000.0f << " s" <<std::endl;
              std::cout << "Temps max    : " << maxDuration/1000.0f << " s" <<std::endl;
              std::cout << "Temps min    : " << minDuration/1000.0f << " s" <<std::endl;
            }

            if (Settings::logTofile) {
              unsigned int c_off = Settings::GetConvOffset();
              tab_csv[TAB_CSV_VSTART+c_off][TAB_CSV_HSTART+Settings::testID-1] = ToString(medianTime/1000.0f);
              tab_csv[TAB_CSV_VSTART+c_off+TAB_CSV_VSTEP][TAB_CSV_HSTART+Settings::testID-1] = ToString(avgTime/1000.0f);
              tab_csv[TAB_CSV_VSTART+c_off+TAB_CSV_VSTEP*2][TAB_CSV_HSTART+Settings::testID-1] = ToString(maxDuration/1000.0f);
              tab_csv[TAB_CSV_VSTART+c_off+TAB_CSV_VSTEP*3][TAB_CSV_HSTART+Settings::testID-1] = ToString(minDuration/1000.0f);

              //CSVHandler::PrintCSV(tab_csv);
              std::cout << "Sauvegarde des resultats..." << std::endl;
              bool success;
              if (Settings::lastSimulation || Settings::testID == 0) {
                tab_csv[2][12] = getOSname();
                tab_csv[3][12] = getCPUname();
                success = CSVHandler::WriteCSV(tab_csv, "results_" + dateTimeString() + ".csv");
                remove("tmp.csv");
              } else {
                success = CSVHandler::WriteCSV(tab_csv, "tmp.csv");
              }
              if (success) std::cout << "Sauvegarde reussie !" << std::endl;
            }
            if (Settings::closeAfterSimulation) {
              window.close();
            }
          } else {
            autoZoomFinished = false; //pas fini
          }
        }


        if (Settings::autoZoom && Settings::nbSimulations > 0 && !autoZoomFinished && autoZoomTime.getElapsedTime() > sf::seconds(Settings::zoomStepTime)) {
          zoom /= Settings::zoomFactor;
          autoZoomTime.restart();
          stateChanged = true;
        }


        if (stateChanged) {
            std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
            mb.updateImage(zoom, offsetX, offsetY, image);
            std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
            if (!Settings::autoZoom) std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() <<std::endl;
            texture.loadFromImage(image);
            sprite.setTexture(texture);
            stateChanged = false;
        }
        window.draw(sprite);
        window.display();
    }
}
