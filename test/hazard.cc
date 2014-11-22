#include "script.h"
#include "state.h"

struct Hazard : public state_t {
    void go();
};


void Hazard::go()
{
    stack[0] = NULL;
    executed = 0;

    // Put 0 into [0], 255 into [1] and then flip between them.
    XOR(A);
    STA(A);
    LOAD(X,A);
    INC(Y,X);
    DEC(A);
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
