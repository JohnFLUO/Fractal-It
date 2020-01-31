#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>

class Convergence {

public:
    Convergence(){

    }

    ~Convergence( ){

    }

    int process(double startReal, double startImag, int max_iters);

};
