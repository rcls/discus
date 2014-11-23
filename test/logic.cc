#include "script.h"
#include "state.h"

struct Logic : public state_t {
    void go();
};


void Logic::go()
{
    stack[0] = NULL;
    executed = 0;

    LOAD(U,0x36);
    LOAD(A,U);
    ADD(A);
    LOAD(Y,A);
    XOR(U);
    OR(Y);
    AND(U);
    AND(Y);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(Logic(), argc, argv);
}
