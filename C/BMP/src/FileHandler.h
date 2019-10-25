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
#include "Settings.h"
#include "StringUtils.h"

#ifndef FILEHANDLER_H_
#define FILEHANDLER_H_

using namespace std;

class FileReader {
private:
  bool debug;
	string filename;
	ifstream fr;

public:
	FileReader();
	FileReader(string filename);
	~FileReader();

	int Open(string filename);
	void ParseBinary(std::vector<uint8_t> *output);
	void ParseParams();
};

#endif /*FILEHANDLER_H_*/
