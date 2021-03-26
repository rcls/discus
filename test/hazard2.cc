#include "script.h"
#include "state.h"

struct Hazard : public state_t {
    void go();
};


void Hazard::go()
{
    stack[0] = NULL;
    executed = 0;

    // Put 1 into [0], 254 into [1] and then flip between them.
    XOR(A);
    LOAD(X,A);
    INC(A);
    LOAD(Y,A);
    STA(X);
    LOAD(A,254);
    STA(Y);
    LOADM(A,X);
    LOADM(A,Y);
    LOADM(A,X);
    LOADM(A,Y);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(Hazard(), argc, argv);
}
