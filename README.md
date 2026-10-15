# worksheet1_24010844
# Operating Systems Worksheet 1

## Task 1.1 – Adding Two Integers

### Description
This program uses Assembly language to add two integers stored in memory.
The first integer is 15 and the second integer is 6. The program loads
the first integer into the EAX register, adds the second integer, and
stores the result in memory before displaying it.

### Implementation
- The `.data` section stores the two integers.
- The `.bss` section reserves memory for the result.
- The `.text` section contains the program instructions.
- The program uses `mov` to load and store values and `add` to calculate
  the sum.
- The result is displayed using `print_int`.

### Testing
The program was assembled, compiled, and executed successfully.

**Test values:**
- First integer: 15
- Second integer: 6
- Expected result: 21
- Actual result: 21

---

## Task 1.2 – Adding Two User-Entered Integers

### Description
This program asks the user to enter two integers, adds them together,
and displays the calculation and the sum.

### Implementation
- The `.data` section stores the messages displayed to the user.
- The `.bss` section reserves memory for the two integers and their sum.
- `read_int` accepts the user's input.
- `mov` stores the input values in memory.
- `add` calculates the sum.
- `print_string` displays messages.
- `print_int` displays the numbers and the result.
- `print_nl` moves the output to a new line.

### Testing
The program was assembled, compiled, and executed successfully.

**Test values:**
- First integer: 10
- Second integer: 20
- Expected result: 30
- Actual result: 30

---

## Files

- `src/task1.asm` – Assembly program for Task 1.1.
- `src/task1_2.asm` – Assembly program for Task 1.2.
- `src/driver.c` – C driver used to run the Assembly programs.
- `src/asm_io.asm` – Assembly input/output routines.
- `src/asm_io.inc` – Assembly input/output definitions.