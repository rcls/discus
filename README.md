discus
======

[ <img align="right" src="sym/control.png"> ](gates/control.md)

Discus is an 8-bit CPU built from 1229 discrete transistors.  Currently it runs
in simulation, [integrated into a system with RAM and ROM](board/univlight.md).

It is a pure 8-bit Harvard architecture, with 8-bit code and data addresses, and
a separate four entry stack.  There are four general purpose registers, one of
which is the accumulator.  It uses a 2.5 stage RISC pipeline (opcode
fetch/branch, instruction execute, and writeback).  The pipelining costs around
100 transistors.

The instruction set is minimalist but functional.  All instructions are a single
byte and execution is strict single cycle throughput.  Constant values and some
memory accesses are implemented via prefix instructions.  The prefixes are
separate instructions, but leave their result in a “hidden” register that is
implicitly accessed by the following instruction.

Instructions with two operands have the accumulator as one operand and the
destination.  Single operand instructions (`INC`, `DEC`, `MOV`, `LOADM`) can use
any registers as their source and destination.

The instruction set is RISC style load/store.  Arithmetic instructions are
register-to-register.  Memory reads are either `LOADM` (to a named register), or
`MEM` (prefix loading to hidden register).  `STA` is the only memory write
instruction.

Branch (jump, call, return) instructions are executed in the first pipeline
stage.  All branches may be conditional. There are no indirect branches, and no
data access to the stack—it is not possible to branch to a computed address.


Circuitry Overview
------------------

[ <img align="right" src="sym/bit.png"> ](gates/bit.md)

The bulk of the implementation is in NMOS logic, with N-channel MOSFET switches
and 3.3k load resistors, giving a 1mA current per logic gate at 3.3V.  BJTs are
used in the register files, both as pass gates, and as low-capacitance
interfaces to the sense lines.

Most [SRAM cells](gates/sramcell.md) are 4T2R, with two NMOS transistors, two
resistors and two BJT pass gates.  Outside of the register files,
[latches](gates/dilatch.md) have six NMOS transistors (plus resistors) and
[two](gates/dilatch.md) [latches](gates/rslatch.md) form a
[flip-flop](gates/dflipflop.md).

Arbitrary AOI gates are used as needed, where sensible these are drawn in the
circuit diagram by connecting the outputs of open-drain gates together, although
there are a couple of discrete monsters in
[instruction decode](gates/decode.md).
Significant use is made of stacked gates, where the
output of one gate is connected to the ground connection of other gates,
essentially forming a wired-and.

Lines needing high fanout or high drive strength—mostly the bus and clock
lines—are driven by CMOS outputs.  PMOS logic is also used, mostly for 1-of-N
decoder trees.

The overall layout is bit-sliced, with the per-bit circuitry laid out on
[eight identical boards](gates/bit.md) (123 transistors each), and a
[separate control board](gates/control.md) (245 transistors).

The [bit slice board](gates/bit.md) has the program counter, stack and branch
logic on the left, and the instruction execute pipe line stage on the right.
The [control board](gates/bit.md) contains the status flags and register strobe
handling, with the [stack pointer](gates/sp.md) and
[instruction decode](gates/decode.md) in sub-circuits.


Registers
=========

The general purpose registers are `A`, `X`, `Y`, `U`.  `A` is the accumulator,
an implicit operand and destination of two argument instructions.  Otherwise,
all GP registers are interchangeable.

The hidden register is `K`.  This is written by prefix instructions (constants
or MEM prefix).  If an instruction writes `K`, then the next instruction uses
that as the srouce register, instead of the register encoded in the instruction.

There are two condition flags, `C` and `Z`.

There is an 8-bit program counter, and two bit [stack pointer](gates/sp.md).
The four entry stack is implemented as a register file in the CPU, 128
transisters for storing 4 bytes, plus 38 for interfacing to the register file.


Instruction Set & Encoding
==========================

### Source Register (`......RR`)

The last two bits of (nearly all) instructions identify a source register.
Values of RR are:

* **00** : `A`
* **01** : `X`
* **10** : `Y`
* **11** : `U`
* But `K` if the preceding instruction was a prefix.

The `CONST`, `MEM` and `IN` prefix instructions write the `K` register, and then
the decode of the subsequent instruction is overriden to read `K` instead of
using the instruction bits.

### Destination Register (`11DD..RR`)

Instructions with an explicit destination register put the register number in
bits 4 and 5.  The encoding is the same as the source register.

### Condition Codes (`...CCC..`)

Branch instructions put the condition in bits 2, 3, 4.  The encoding is:

* **000** : Always
* **001** : Never
* **010** : Always
* **011** : Never
* **100** : If Z
* **101** : If not Z
* **110** : If C
* **111** : If not C

### `CONST` prefix : `00nnnnnn`

This instruction writes K with an 8-bit constant.  The lower 6 bits are taken
from the opcode, while the high two bits are “stolen” from bits 0 and 1 of the
following instruction.  Because of the pipelining, those bits are available when
CONST executes.

The CONST instruction is never written explicitly in assembly
code—instead, it is generated automatically when a numeric constant
operand is used.

### `JUMP`, `CALL` : `00LCCCnn`

These share the opcode encoding of the `CONST` instruction.  They are
distinguished by disallowing two successive `CONST` instructions.  Instead,
immediately following a `CONST` instruction, a jump is decoded in preference,
with the `CONST` providing the target address for the jump.  The L bit is 0 for
a `JUMP` and 1 for a `CALL`.

All branches have a condition code; see above for the enumeration of the CCC
values.

The target address is given by the `CONST` prefix (6 bits from the `CONST` and 2
bits from the jump or call.  Note that the circuitry can't use the `K` register
though—the branch instruction happens in the wrong pipeline stage.  Instead,
when the branch is handled, the prefix can be found in the register holding the
instruction for the execute pipeline stage.

### `OUT` : `010000rr`

`OUT` instruction.  This does nothing, but pulses a strobe.  External
peripherals may use the values from the accumulator and operand buses.

Only the first four bits are decoded; any instruction starting 0100 is decoded
as `OUT`.

### `STA` : `010100rr`

Store the acumulator to memory.  The operand is the memory address to write.
Like the `OUT` instruction, the only circuitry within the CPU for `STA` is to
assert appropriate control strobes—the address and data buses are always driven.

Note that only the first four bits are decoded; any instruction starting 0101 is
decoded as `STA`.

### RET : `011CCC..`

Pops the PC from the stack, if the condition passes.  The operand is ignored.

Note that return-never instructions are overloaded.

This opcode in the first stage of the pipeline, but uses the condition flags set
in the second stage.  This means that the condition flag for the return is
evaluated before an update by the immediately preceding instruction, a hazard to
be aware of.

(`JUMP` and `CALL` have the same quirk, but for those instructions, there is no
impact—for `JUMP` & `CALL`, the preceding instruction must be `CONST`
which does not change the condition flags.)

### `CMP` : `011001rr`

Subtract the operand from `A`, discarding the result, but updating `Z` and `C`
flags.  Subtraction `A − B` is implemented as `A + not B + 1`, which determines
the polarity of the `C` flag for `CMP` and subtract instructions.

This takes an instruction encoding otherwise assigned to “return never”.

### `TST` : `011011rr`

Compute the logical and of `A`, discarding the result, but updating `Z` and
setting `C` to 1.

This takes an instruction encoding otherwise assigned to “return never”.

### Arithmetic : `100aaarr`

[ <img align="right" src="sym/alu.png"> ](gates/alu.md)

Perform an arithmetic operation on the accumulator and operand, writing the
result to the accumlator and updating the `Z` and `C` flags.

The encoding of `aaa` is:
* **000** : `ADD` (add without carry)
* **001** : `SUB` (subtract without carry)
* **010** : `OR ` (sets `C` to 0 also)
* **011** : `AND` (sets `C` to 1 also)
* **100** : `ADC` (add with carry)
* **101** : `SBC` (subtract with carry)
* **110** : `XOR` (sets `C` to 0 also)
* **111** : unused alias of `AND`.

Incidentally, the corresponding bits in `CMP` and `TST` instructions match `SUB`
and `AND` respectively, simplifying the instruction decode.

`ADD(A)` and `ADC(A)` instructions give left shift and (9-bit) rotate.  There
are no right shift instructions.

### `MEM` prefix : `101011rr`

Load the `K` register from memory.  The operand is the memory address.

Not all bits are decoded; there are aliases.

The `MEM` prefix is typically not written explicitly in assembly code.  Instead,
the letter 'M' is suffixed to the following instruction, e.g., `ADDM` instead of
`MEM`,`ADD`.

Note that with a `MEM` prefix, the operand bits of the following instruction are
ignored.

### `IN` prefix : `101000rr`

Load `K` from the external result bus `Q` (the bus is open-drain).  The
accumulator and operand buses may be used by external circuitry, and the `IN`
strobe line is asserted.

### `INC` : `11dd00rr`

Write the operand plus one into the destination, and update `Z`.  The `C` flag
is not changed.

### `DEC` : `11dd01rr`

Write the operand minus one into the destination, and update `Z`.  The `C` flags
is not changed.

### `MOV` : `11dd10rr`

Write the operand into the destination.  No condition flag updates.

### `LOADM` : `11dd11rr`

Load the destination register from memory.  The operand is the memory address.

This is a convenience, `MEM`,`MOV` would achieve the same result, but taking two
bytes.


Processor Buses
===============

There are several buses:
* **`A`** : Accumulator bus.  This is a differential CMOS bus outputing the
  accumulator value for `STA` and `OUT` instructions.
* **`B`** : Operand bus.  This is a differential CMOS bus outputing the current
  instruction operand.  It is used as the address lines for memory instructions.
* **`Q`** : Result bus.  This is an open drain bus carrying the result of the
  current instruction.  It is driven by memory reads and IN instructions,
  in addition to all internal instruction result values.
* **`P`** : Program counter.  This is a differential CMOS bus outputing the PC
  for the code memory read.
* **`O`** : Opcode bus.  Open drain bus inputing the fetched opcode from
  the code memory read.

Internally, there is also the I bus, carrying the instruction currently in
execute.  The J and K buses are looped to lines on the O and I buses to give
respectively the jump target and `CONST` value.


Reset
=====

The opcode bus is open-drain.  Reset is implemented by pulling down the opcode
bus, giving continuous 00000000 instructions.

Normally this would alternate `CONST` prefix and `JUMP`-always instructions,
jumping to address 0, reseting the program counter.  To make sure the exit from
reset always leaves the instruction decode in the correct state, while in reset,
the decode is modified so that the jump to zero takes place on every clock
cycle.

The above takes two transistors to implement.  We also latch the reset to
synchronise with the clock, which takes several more.


Arithmetic Unit
===============

[ <img align="right" src="sym/alu.png"> ](gates/alu.md)

The arithmetic unit is essentially a ripple-carry adder, with an optional
inverter on one operand.  The two inputs are `A` and `B`.  The `A` input is
usually the accumulator.  The `B` input is the operand register encoded in the
instruction, and has an optional inverter.

Logical operations are implemented by disabling appropriate parts of the adder
and carry chain.  E.g.,
* The `XOR` instruction forces the carry chain to zero.
* The `A xor B` needed for a half-adder is equal to `(A or B) and not (A and
  B)`.  Disabling the `and` leaves an `OR`.
* Likewise, disabling the `or` in the `xor` leaves a `nand`, which can be
  inverted by forcing the carry chain to 1, giving an `AND` instruction.

This is visible in logic operations setting the carry flag to fixed values, so
that `AND(A)` and `OR(A)` can be used as carry-set and carry-clear instructions.

Increment and decrement instructions are implemented by forcing the `A` input to
be all-zeros or all-ones, and forcing the carry chain input oppositely.

The per-bit transistor count is 20 transistors per bit, including the
output-enable driving the `Q` bus.  Decoding the instruction to produce the
control stobes for the ALU takes 41 transistors.

The ripple carry uses two gate levels per bit.  This is on the critical path for
the CPU clock cycle time, and accounts for over half of it.  One gate level per
bit could be achieved by dualizing every second ALU bit, saving a transistor and
improving performance.  Pragmatically, keeping each bit identical is preferable.


Register File
=============

The main register file consists of the four architectural registers `A`, `X`,
`Y`, `U` and the hidden register `K`.  The register file is dual ported, with
seperate read and write ports.

[ <img align="right" src="sym/sramcell2.png"> ](gates/sramcell2.md)

The accumulator `A` also outputs directly to a bus.  Four of the registers are
[5T2R NMOS SRAM cells](gates/sramcell2.md), while the accumulator is a [7T2R
CMOS SRAM cell](gates/sramcell2s.md), to give high drive strength for the `A`
bus.

The read port provides only weak access from the bit-line to the SRAM cell, so
that precharge is not necessary.  Writes are latched in a separate latch during
the execute stage, and written back to the register file in the first half of
the following clock cycle; hence the nominal 2.5 stage pipeline.

Because the write-back occurs simultaneously with the execute stage of the
following instruction, the write-back is on the critical path for the CPU cycle
time.


Program Counter and Stack
=========================

There is a [D flip-flop](gates/dflipflop.md) per bit for the program counter,
and a ripple-carry chain for incrementing it, followed by muxes to integrate
with the stack and implement branch instructions.  Like the accumulator, the PC
has CMOS outputs, as it directly drives the address bus for instruction fetch.

The carry-chain is two gate-levels per bit, like the ALU carry-chain.  Due to
the simpler surrounding logic, it is well away from the critical-path: dualizing
alternating bits would save a transistor per bit, but make no difference to
performance.

[ <img align="right" src="sym/sp.png"> ](gates/sp.md)

The program counter is closely coupled to the stack.  This is an integrated
four-entry stack, with a Gray-coded stack pointer.  There is no access to the
stack or stack-pointer other than via `CALL`/`RET` instructions.

The stack storage is implemented as a four byte register file, using
[single ported 4T2R SRAM cells](gates/sramcell.md)
(identical to main memory below).

Precharging the bit-lines is necessary, which is achieved by only accessing the
stack on the second half of each clock cycle.  The output path from the stack
into the PC is short, so this is not critical for the clock cycle time.

Note that the stack address strobes need to be stable during the second half of
the clock cycle (while the stack register file is accessed), so the opcode fetch
and decode of branch instructions must be complete in the first half of the
clock cycle.

At first sight, it appears to be an exhorbitent expenditure of transistors in
the CPU core to integrate the stack.  However, the
[SRAM cells](gates/sramcell.md) for this only total 16 transistors on each
bit-slice, very competitive with the transistor count of muxing stack operations
onto the data memory bus.  In any case, storing stack entries in
[main memory](board/sram32byte.md) SRAM cells would cost just as many
transistors for the storage, just on a different circuit board.

Main Memory
===========

[ <img align="right" src="sym/sram32byte.png"> ](board/sram32byte.md)

As well as the CPU, there is memory… SRAM is implemented as arrays of 4T2R
cells, consisting of two cross-coupled NMOS inverters, and two BJTs as pass
gates.  A 32-byte SRAM board takes 2048 transistors for storage, plus those
needed for decode and bus interfaces, more than the CPU.

Precharging the bit-lines is necessary.  Pull-up resistors suffice.  Memory
accesses take place on the second half of the clock cycle, leaving the first
half for pre-charge, even on back-to-back memory accesses.  Because memory reads
always go directly into a register, the reduced time available from the half
clock cycle is not a concern.

Program storage is intended to be implemented as ROM, so there is no allowance
for precharge allowance.  Opcode fetch is not critical path for performance.
While branches are executed in the same clock cycle as opcode fetch, the logic
for those is much simpler and shorter than the main execution pipeline stage.
