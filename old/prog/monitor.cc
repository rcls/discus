#include "script.h"
#include "state.h"

struct Monitor : public state_t {
    void go();
};

constexpr int program_address = 0;
constexpr int program_data = 1;
constexpr int data_address = 2;
constexpr int data_data = 3;
constexpr int serial_data = 4;
constexpr int leds = 5;
constexpr int cpu_reset = 6;


void Monitor::go()
{
    stack[0] = NULL;
    executed = 0;

    // At 50Mhz, a 115200 baud bit is 434 clock cycles.
    // At 33.3Mhz, a 115200 baud bit is 289 clock cycles.

    // U = currently input byte (last two nibbles).
start:
    LOAD(A,64);
    STA(data_address);
    LOADM(A,data_data);
    STA(leds);
    // Wait until we've had 50% of a bit as zero...
    LOAD(X,15);
start_bit:
    DECM(A,serial_data);                // 0 or 1.
    JP(Z,start);
    DEC(X);
    JP(NZ,start_bit);
    // X==0 is current char, Y is current bit.
    CALL(bittimewait);
    INC(Y,X);                           // Y = 1.
getbyte:
    XOR(A);
    SUBM(serial_data);                  // 0 or -1.
    AND(Y);
    OR(X);
    LOAD(X,A);
    CALL(bittimewait);
    JP(NC,getbyte);
    // Ok, we're now in the stop bit.  Hopefully.  Process the character...
    // 0..9,a..f : shift hex nibble onto word.
    // = : set address.
    // @ : fetch data byte.
    // ! : store data byte.
    // ; : store program byte.
    // 0xff : ignore.
    CALL(process_byte);
    JMP(start);
process_byte:
    LOADM(A,program_address);
    STA(data_address);
    LOAD(A,X);
    CMP(' '+1);
    JP(NC,print_char);
    CMP('=');
    JP(Z,set_address);
    LOAD(Y,data_data);
    CMP('@');
    JP(Z,fetch);
    CMP('!');
    JP(Z,store);
    LOAD(Y,program_data);
    CMP('.');
    JP(Z,fetch);
    CMP(';');
    JP(Z,store);
    CMP('r');
    JP(Z,set_reset);
    CMP(255);
    JP(Z,start);                          // Ignore.
    LOAD(X,'?');
    SUB('0');
    JP(NC,print_charX);
    CMP(10);
    JP(NC,shift_nibble);
    SUB(39);
    CMP(10);
    JP(NC,print_charX);
    CMP(16);
    JP(C,print_charX);
shift_nibble:
    LOAD(X,A);
    LOAD(A,U);
    ADD(A);
    ADD(A);
    ADD(A);
    ADD(A);
    ADD(X);
    LOAD(U,A);
    RET();
set_reset:
    LOAD(A,U);
    STA(cpu_reset);
    RET();
set_address:
    LOAD(A,U);
    STA(program_address);
    RET();
store:
    LOAD(A,U);
    STA(Y);
next_address:
    INCM(A,program_address);
    STA(program_address);
    RET();
fetch:
    LOADM(U,Y);
    CALL(next_address);
    LOAD(A,U);
    ADC(A); // Rotate left by 5 through carry = shift right by 4.
    ADC(A);
    ADC(A);
    ADC(A);
    ADC(A);
    CALL(print_nibble);
    CALL(bittimewait);                  // Wait out the stop bit.
    LOAD(A,U);
    // JMP(print_nibble); .... just fall through.
print_nibble:
    AND(15);
    ADD('0');
    CMP('9'+1);
    JP(NC,print_char);
    ADD(39);
print_char:
    LOAD(X,A);
print_charX:
    XOR(A);
    CALL(serial_send_bit);              // Start bit.
    LOAD(Y,1);
print_char_bits:
    LOAD(A,X);
    AND(Y);
    ADD(255);
    ADC(A);                             // Only low bit matters.
    CALL(serial_send_bit);
    JP(NC,print_char_bits);
    INC(A,Y);                           // Stop bit.
    STA(serial_data);
    RET();
serial_send_bit:
    STA(serial_data);
bittimewait:
    LOAD(A,70);
bitimewait1:
    DEC(A);
    JP(NZ,bitimewait1);
    LOAD(A,Y);
    ADD(A);
    LOAD(Y,A);
    RET();
}


int main(int argc, char * argv[])
{
    sim_main(Monitor(), argc, argv);
}
