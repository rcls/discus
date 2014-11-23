#include "script.h"
#include "state.h"

struct TestSub : public state_t {
    void go();
};


void TestSub::go()
{
    stack[0] = NULL;
    executed = 0;

    SUB(A);
    CHECK(flag_C && reg[A] == 0);
    JP(C,carry_on);
zero_on:
    SUB(X);
    CHECK(!flag_C);
    SBC(X);
    SUB(X);
    RET();
carry_on:
    SBC(0x7d);
    LOAD(X,A);
    CHECK(!flag_C);
    SUB(X);
    CHECK(flag_C && flag_Z);
    JP(Z,zero_on);
}


int main(int argc, char * argv[])
{
    sim_main(TestSub(), argc, argv);
}
