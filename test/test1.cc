#include "script.h"
#include "state.h"

struct Script1 : public state_t {
    void go();
};


void Script1::go()
{
    stack[0] = NULL;
    executed = 0;

    XOR(A);
start:
    ADD(2);
    INC(A);
    JP(NZ,start);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(Script1(), argc, argv);
}
