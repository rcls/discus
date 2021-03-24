#include "script.h"
#include "state.h"

struct TestInc : public state_t {
    void go();
};


void TestInc::go()
{
    stack[0] = NULL;
    executed = 0;

    SUB(A);
    CHECK(flag_C && reg[A] == 0);
    DEC(X,A);
    LOAD(Y,X);
    INC(U,Y);
    CL(Z,ret);
    CHECK(reg[U] == 0);
    ADD(U);
    CHECK(!flag_C && reg[A] == 0);
    DEC(X,A);
    INC(X);
    INC(X);
    INC(X);
ret:
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestInc(), argc, argv);
}
