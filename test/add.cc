#include "script.h"
#include "state.h"

struct TestAdd : public state_t {
    void go();
};


void TestAdd::go()
{
    stack[0] = NULL;
    executed = 0;

    XOR(A);
    CHECK(!flag_C && reg[A] == 0);
    JP(NZ,crap);
    ADC(0x83);
    LOAD(Y,A);
    CHECK(!flag_C);
    JP(C,crap);
    ADD(Y);
    CHECK(flag_C);
    ADC(Y);
    ADC(Y);
    CHECK(flag_C);
    ADD(Y);
crap:
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestAdd(), argc, argv);
}
