/**********************\
      File Handler
***********************

Author :
--------
Jonathan SAUSSEREAU

Description :
-------------
Text file parser

Changelog :
-----------
  - 2019/04/17 : Initial release
  - 2019/04/27 : Improved to hanle complex parsing
  - 2019/10/21 : Adapted to fit fractal plotting
  - 2019/11/28 : Adapted to fit fractal plotting with sfml
*/

#include "FileHandler.hpp"

FileReader::FileReader() {
}

FileReader::FileReader(string filename) {
  Open(filename);
  debug = false;
}

FileReader::~FileReader() {
}

int FileReader::Open(string filename) {
  FileReader::filename = filename;
  if (filename.length() <= 4 || filename.substr(filename.length()-4) != ".ini") {
    filename+= ".ini";
  }
  fr.open(filename.c_str());
  if (!fr) {
    string test_filename = "../" + filename;
    fr.open(test_filename.c_str());
    if (!fr) {
      test_filename = "../" + test_filename;
      fr.open(test_filename.c_str());
      if (!fr) {
        cout << "\033[33m" << endl; //unix only
        cerr << "warning: cannot find \"" << filename << "\", file ignored" << endl;
        cout << "\033[0m"  << endl;
        return -1;
      }
    }
  }
  return 0;
}


void FileReader::ParseParams() {
  if (fr) {
    string line;
    int lineNb = 1;
    while (std::getline(fr, line)) {
      removeAllCharFromString(' ', &line);
      removeAllCharFromString(';', &line);
      removeAllCharFromString('\t', &line);
      removeAllCharFromString('\n', &line);
      removeAllCharFromString('\r', &line);
      stringToUppercase(&line);
      if (line[0] != '#' && line[0] != '/' && !line.empty()) { //skip empty lines and comment lines
        vector<string> content = splitString(line, "=");
        string identifier = content.at(0);
        if (content.size() > 1) {
          string arg = content.at(1);
          if (identifier == "WIDTH") {
            Settings::SetWidth(stringToInt(arg));
          } else if (identifier == "HEIGHT") {
            Settings::SetHeight(stringToInt(arg));
          } else if (identifier == "CONVERGENCE") {
            if (arg == "DP") {
              Settings::SetConvergenceType(ConvergenceType::DP);
            } else if (arg == "DP_OMP") {
              Settings::SetConvergenceType(ConvergenceType::DP_OMP);
            } else if (arg == "DP_OMP_AVX") {
              Settings::SetConvergenceType(ConvergenceType::DP_OMP_AVX);
            } else {
              cout << "\033[33m" << endl; //unix only
              cerr << "warning: unknown parameter \"" << arg << "\" at line " << lineNb << endl;
              cout << "\033[0m"  << endl;
            }
          } else if (identifier == "COLORMAP") {
            if (arg == "GREYSCALE") {
              Settings::SetColorMapMode(ColorMapMode::GREYSCALE);
            } else if (arg == "HSV") {
              Settings::SetColorMapMode(ColorMapMode::HSV);
            } else if (arg == "HSV_LOOP") {
              Settings::SetColorMapMode(ColorMapMode::HSV_LOOP);
            } else if (arg == "HSV_SHIFTED") {
              Settings::SetColorMapMode(ColorMapMode::HSV_SHIFTED);
            } else if (arg == "SMOOTH") {
              Settings::SetColorMapMode(ColorMapMode::SMOOTH);
            } else if (arg == "SMOOTH_LOOP") {
              Settings::SetColorMapMode(ColorMapMode::SMOOTH_LOOP);
            } else if (arg == "SMOOTH_SHIFTED") {
              Settings::SetColorMapMode(ColorMapMode::SMOOTH_SHIFTED);
            } else if (arg == "LSD") {
              Settings::SetColorMapMode(ColorMapMode::LSD);
            } else {
              cout << "\033[33m" << endl; //unix only
              cerr << "warning: unknown parameter \"" << arg << "\" at line " << lineNb << endl;
              cout << "\033[0m"  << endl;
            }
          } else  {
            cout << "\033[33m" << endl; //unix only
            cerr << "warning: unknown identifier \"" << identifier << "\" at line " << lineNb << endl;
            cout << "\033[0m"  << endl;
          }
        } else {
          cout << "\033[33m" << endl; //unix only
          cerr << "warning: missing value for \"" << identifier << "\" at line " << lineNb << ", line ignored" << endl;
          cout << "\033[0m"  << endl;
        }
      }
      lineNb++;
    }
  }
}
