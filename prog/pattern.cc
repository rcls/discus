#include "script.h"
#include "state.h"

struct Pattern : public state_t {
    void go();
};

// 688890810140004888a6d20320

// 6888c0a50220

void Pattern::go()
{
    stack[0] = NULL;
    executed = 0;
/*
    XOR(A);
    LOAD(X,A);
loop:
    INC(A);
    STA(X);
    JMP(loop);
*/
    XOR(A);
    LOAD(X,A);
    LOAD(Y,A);

loop:
    LOAD(A,X);
    ADD(1);
    ADC(0);
    LOAD(X,A);
    STA(Y);
    INC(Y);
    JMP(loop);
}


int main(int argc, char * argv[])
{
    sim_main(Pattern(), argc, argv);
}
