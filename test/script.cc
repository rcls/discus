#include "state.h"

struct Script1 : public state_t {
    void go(int start);
};

void Script1::go(int start)
{
    stack[0] = NULL;
    executed = 0;

    XOR(A);
start:
    ADD(2);
    INC(A);
    JMP(start);
}

int main(int argc, char * argv[])
{
    Script1 script;
    script.extract_branches(0);
    print_emitter_t emit(stdout);
    script.emitter = &emit;
    script.executed = 0;
    script.straight_through = true;
    script.jump_take_number = -1;
    script.go(0);                       // Assemble

    munge_emitter_t munge(stdout, "");
    script.emitter = &munge;
    script.executed = 0;
    script.straight_through = true;
    script.jump_take_number = -1;
    script.go(0);                       // Assemble

    return 0;
}
