#include "script.h"
#include "state.h"

struct TestCmp : public state_t {
    void go();
};


void TestCmp::go()
{
    stack[0] = NULL;
    executed = 0;

    // XOR(A);
    LOAD(A,33);
    LOAD(X,66);
    // CHECK(!flag_C);
    CMP(X);
    CHECK(!flag_C && regK != 0);
    CMP(A);
    CHECK(flag_C && regK == 0);
    CMP(12);
    CHECK(flag_C && regK != 0);
    TST(A);
    TST(X);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestCmp(), argc, argv);
}
