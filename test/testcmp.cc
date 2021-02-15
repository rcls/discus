#include "script.h"
#include "state.h"

struct TestCmp : public state_t {
    void go();
};


void TestCmp::go()
{
    stack[0] = NULL;
    executed = 0;

    XOR(A);
    LOAD(A,27);
    LOAD(X,54);
    CHECK(!flag_C && flag_Z);
    CMP(X);
    CHECK(!flag_C && !flag_Z);
    CMP(A);
    CHECK(flag_C && flag_Z);
    CMP(12);
    CHECK(flag_C && !flag_Z);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestCmp(), argc, argv);
}
