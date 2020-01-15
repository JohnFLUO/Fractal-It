#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>

#ifndef CONVERGENCE_H_
#define CONVERGENCE_H_

class Convergence {

public:
    Convergence(){

    }

    ~Convergence( ){

    }

    int process(double startReal, double startImag, int max_iters);

};

#endif
