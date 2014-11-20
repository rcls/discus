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
    CHECK(!flag_C && reg[A] == 0);
    SBC(0x7d);
    LOAD(X,A);
    SUB(X);
    CHECK(flag_C);
    SBC(X);
    SBC(X);
    SUB(X);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestSub(), argc, argv);
}
