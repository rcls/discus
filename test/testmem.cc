#include "script.h"
#include "state.h"

struct TestMem : public state_t {
    void go();
};


void TestMem::go()
{
    stack[0] = NULL;
    executed = 0;

    XOR(A);
    STA(0x15);
    DEC(A);
    STA(0x08);
    DEC(A);
    STA(0x01);
    LOADM(X,0x01);
    LOADM(Y,0x08);
    LOADM(U,0x15);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestMem(), argc, argv);
}
