/*********************
     File Handler
*********************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string>
#include <iostream>
#include <fstream>
#include <vector>

#include "Utils.hpp"
#include "Settings.hpp"
#include "StringUtils.hpp"

#include "Color/ColorMap.hpp"
#include "Convergence/Convergence.hpp"

#ifndef FILEHANDLER_H_
#define FILEHANDLER_H_

using namespace std;

class ConfigReader {
private:
  bool debug;
	string filename;
	ifstream fr;

public:
	ConfigReader();
	ConfigReader(string filename);
	~ConfigReader();

	int Open(string filename);
	void ParseParams();
  static bool ParseConvergenceType(string arg);
  static bool ParseColorMap(string arg);

};

class CSVHandler {
public:

  static vector< vector<string> > ReadCSV(string filename);
  static bool WriteCSV(vector< vector<string> > tab, std::string filename);
  static void PrintCSV(vector< vector<string> > tab);

};


#endif /*FILEHANDLER_H_*/
