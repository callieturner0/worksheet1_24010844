# worksheet1_24010844
# Operating Systems Worksheet 1

## Task 1.1 – Adding Two Integers

### Code Example

The following instructions load the first integer into the EAX register,
add the second integer, and store the result in memory.

```asm
mov eax, [integer1]
add eax, [integer2]
mov [result], eax
```

The `mov` instruction loads or stores values, while `add` performs the
addition. The result is stored in the `result` variable before it is
printed.

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

![Task 1.1 running](task1.png)

---

## Task 1.2 – Adding Two User-Entered Integers

### Code Example

The program reads two integers, stores them in memory, and adds them.

```asm
call read_int
mov [integer1], eax

call read_int
mov [integer2], eax

mov eax, [integer1]
add eax, [integer2]
mov [result], eax
```

The `read_int` routine accepts an integer from the user. Each value is
stored in memory, and the `add` instruction calculates the sum.

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

![Task 1_2 running](task1_2.png)

---

Task 2.1 – Personalised Welcome Message
Aim

The aim of this program is to ask the user for their name and how many times they want a welcome message to be displayed. The program checks that the number entered is greater than 50 and less than 100. If the number is outside this range, an error message is displayed.

How the Program Works

1. Asking for the user's name

The program uses print_string to display a prompt asking for the user's name. It then uses read_char to read the name one character at a time and stores each character in memory.

mov eax, name_msg
call print_string

mov edi, user_name
mov ecx, 99

The EDI register points to the location where the name is stored, and ECX limits the number of characters read. The program stops reading when the user presses Enter or the character limit is reached.

2. Asking for the number

The program asks the user how many times the welcome message should be displayed. It uses read_int to accept an integer and stores the result in user_number.

mov eax, number_msg
call print_string
call read_int
mov [user_number], eax

3. Validating the number

The program checks whether the number is within the required range. The number must be greater than 50 and less than 100.

cmp eax, 50
jle show_error

cmp eax, 100
jge show_error

The cmp instructions compare the number against the limits. The conditional jumps send the program to the error message if the number is 50 or below, or 100 or above.

4. Printing the welcome message

If the number is valid, the program starts a counter at zero and enters a loop.

mov dword [counter], 0

Each time the loop runs, the program prints Welcome, followed by the user's name. The counter increases by one after each message. The loop continues until the counter reaches the number entered by the user.

inc dword [counter]

mov eax, [counter]
cmp eax, [user_number]
jl welcome_loop

This ensures that the welcome message is displayed the requested number of times.

Testing

The program was assembled and linked successfully using NASM and GCC. It was then run from the terminal to check its behaviour.

Test	Input	Expected result
Valid lower limit	51	Prints the welcome message 51 times
Valid upper limit	99	Prints the welcome message 99 times
Below the allowed range	50	Displays an error message
Above the allowed range	100	Displays an error message

![Task 2 valid input](task2_correct.png)
![Task 2 invalid input](task2_incorrect.png)

Task 2.2 – Creating an Array and Calculating Its Sum
Aim

The aim of this program is to create an array containing 100 integers, fill it with the numbers 1 to 100, and calculate the sum of all the elements. The final result is printed to the terminal.

How the Program Works

1. Creating the array

The program reserves memory for 100 integers using resd. Each integer occupies four bytes.

numbers resd 100

The program also uses a counter to keep track of the current array position and a variable called total to store the sum.

2. Initialising the array

The program starts the counter at zero and uses a loop to fill the array with numbers from 1 to 100.

mov eax, [counter]
inc eax

mov ebx, [counter]
mov [numbers + ebx*4], eax

The counter represents the array index, starting at zero. The program adds one to the counter value to generate the number stored at that position. Multiplying the index by four calculates the correct memory offset for each integer.

3. Calculating the sum

After filling the array, the counter is reset to zero. A second loop reads each element and adds it to total.

mov ebx, [counter]
mov eax, [numbers + ebx*4]
add [total], eax

The loop continues until all 100 elements have been added together.

4. Displaying the result

Once the calculation is complete, the program prints the total using print_int, followed by a newline.

mov eax, [total]
call print_int
call print_nl
Testing

The program was assembled using NASM, linked using GCC, and executed in the terminal.

Test	Expected output
Sum of integers from 1 to 100	5050

![Task 2_2 running](task2_2.png)


## Files

- `src/task1.asm` – Assembly program for Task 1.1.
- `src/task1_2.asm` – Assembly program for Task 1.2.
- `src/driver.c` – C driver used to run the Assembly programs.
- `src/asm_io.asm` – Assembly input/output routines.
- `src/asm_io.inc` – Assembly input/output definitions.
