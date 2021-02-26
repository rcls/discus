#include "script.h"
#include "state.h"

struct TestMemi : public state_t {
    void go();
};


void TestMemi::go()
{
    stack[0] = NULL;
    executed = 0;

    // Write alternating values and check readback.
    XOR(A);
    LOAD(X,A);
    STA(X);
    LOADM(Y,X);
    DEC(A);
    STA(X);
    LOADM(Y,X);
    INC(A);
    STA(X);
    LOADM(Y,X);
    DEC(A);
    STA(X);
    LOADM(Y,X);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestMemi(), argc, argv);
}
