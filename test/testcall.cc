#include "script.h"
#include "state.h"

struct TestCall : public state_t {
    void go();
};


void TestCall::go()
{
    stack[0] = NULL;
    executed = 0;

    CALL(sub1);
    RET();
sub1:
    CALL(sub2);
    RET();
sub2:
    CALL(sub3);
    RET();
sub3:
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(TestCall(), argc, argv);
}
