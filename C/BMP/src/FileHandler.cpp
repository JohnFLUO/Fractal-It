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
*/

#include "FileHandler.h"

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
  if (filename.length() <= 4 || filename.substr(filename.length()-4) != ".txt") {
    filename+= ".txt";
  }
  fr.open(filename.c_str());
  if (!fr) {
    string test_filename = "../" + filename;
    fr.open(test_filename.c_str());
    if (!fr) {
      test_filename = "../" + test_filename;
      fr.open(test_filename.c_str());
      if (!fr) {
        //SetConsoleTextAttribute(WinColor::hstdout, 0x0e);
        cerr << "warning: cannot find \"" << filename << "\", file ignored" << endl;
        //SetConsoleTextAttribute(WinColor::hstdout, 0x0f);
        return -1;
      }
    }
  }
}

void FileReader::ParseBinary(std::vector<uint8_t> *output) {
  string line;
  int lineNb = 1;
  int byteNb = 0;
  if (fr) {
    while (std::getline(fr, line)) {
      removeAllCharFromString(' ', &line);
      removeAllCharFromString('\t', &line);
      removeAllCharFromString('\n', &line);
      removeAllCharFromString('\r', &line);
      if (line[0] != '#' && !line.empty()) { //skip empty lines and comment lines
        if (line.size() == 8) {
          uint8_t byte = 0;
          for (int i = 0 ; i < 8 ; i++) {
            if (line[i] != '0' && line[i] != '1') {
              //SetConsoleTextAttribute(WinColor::hstdout, 0x0c);
              cerr << "error: unexpected character \"" << line[i] << "\" at line " << lineNb << endl;
              //SetConsoleTextAttribute(WinColor::hstdout, 0x0f);
              exit(-1);
            }
            if (line[7-i] == '1') {
              byte |= (0x01 << i);
            }
          }
          output->push_back(byte);
          byteNb ++;
          if (debug) {
              //cout << "Line " << lineNb << " = " << line << " -> " << byte << endl;
          }
        } else if (line.size() < 8) {
          //SetConsoleTextAttribute(WinColor::hstdout, 0x0c);
          cerr << "error: too few characters at line " << lineNb << endl;
          //SetConsoleTextAttribute(WinColor::hstdout, 0x0f);
          exit(-1);
        } else if (line.size() > 8) {
          //SetConsoleTextAttribute(WinColor::hstdout, 0x0c);
          cerr << "error: too many characters at line " << lineNb << endl;
          //SetConsoleTextAttribute(WinColor::hstdout, 0x0f);
          exit(-1);
        }
      }
      lineNb++;
    }
  }
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
        vector<string> content = splitString(line, ":");
        string identifier = content.at(0);
        if (content.size() > 1) {
          string arg = content.at(1);
          if (identifier == "TYPE") {
            if (arg == "JULIA") {
                Settings::SetFractalType(JULIA);
            } else {
                Settings::SetFractalType(MANDELBROT);
            }
          } else if (identifier == "MAX_IT") {
            Settings::SetMaxIt(stringToInt(arg));
          } else if (identifier == "PAS") {
            Settings::SetPas(stringToDouble(arg));
          } else if (identifier == "ZOOM") {
            Settings::SetZoom(stringToDouble(arg));
          } else if (identifier == "DECALAGE_Y") {
            Settings::SetDecalage_y(stringToDouble(arg));
          } else if (identifier == "DECALAGE_X") {
            Settings::SetDecalage_x(stringToDouble(arg));
          } else  {
            //SetConsoleTextAttribute(WinColor::hstdout, 0x0e);
            cerr << "warning: unknwon identifier \"" << identifier << "\" at line " << lineNb << endl;
            //SetConsoleTextAttribute(WinColor::hstdout, 0x0f);
          }
        } else {
          //SetConsoleTextAttribute(WinColor::hstdout, 0x0e);
          cerr << "warning: missing value for \"" << identifier << "\" at line " << lineNb << ", line ignored" << endl;
          //SetConsoleTextAttribute(WinColor::hstdout, 0x0f);
        }
      }
    }
  }
}
