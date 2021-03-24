#include "script.h"
#include "state.h"

struct TestMemi : public state_t {
    void go();
};


void TestMemi::go()
{
    stack[0] = NULL;
    executed = 0;

    LOAD(X,0x01);
    LOAD(Y,0x08);
    LOAD(U,0x15);
    XOR(A);
    STA(U);
    DEC(A);
    STA(Y);
    DEC(A);
    STA(X);
    LOADM(A,X);
    LOADM(X,Y);
    LOADM(Y,U);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestMemi(), argc, argv);
}
