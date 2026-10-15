# Compiler and assembler settings
NASM = nasm
GCC = gcc
NASMFLAGS = -f elf -I src/
GCCFLAGS = -m32

# Location of the source files
SRC = src
ASM_IO = $(SRC)/asm_io.o
DRIVER = $(SRC)/driver.o

# Targets that are not filenames
.PHONY: all clean

# Build all programs when make is run
all: task1 task1_2 task2 task2_2 task2_3

# Assemble the input/output library
$(ASM_IO): $(SRC)/asm_io.asm
	$(NASM) $(NASMFLAGS) $< -o $@

# Compile the C driver
$(DRIVER): $(SRC)/driver.c
	$(GCC) $(GCCFLAGS) -c $< -o $@

# Assemble each Assembly source file
$(SRC)/task1.o: $(SRC)/task1.asm $(SRC)/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

$(SRC)/task1_2.o: $(SRC)/task1_2.asm $(SRC)/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

$(SRC)/task2.o: $(SRC)/task2.asm $(SRC)/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

$(SRC)/task2_2.o: $(SRC)/task2_2.asm $(SRC)/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

$(SRC)/task2_3.o: $(SRC)/task2_3.asm $(SRC)/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

# Link the object files to create each executable
task1: $(DRIVER) $(SRC)/task1.o $(ASM_IO)
	$(GCC) $(GCCFLAGS) $^ -o $@

task1_2: $(DRIVER) $(SRC)/task1_2.o $(ASM_IO)
	$(GCC) $(GCCFLAGS) $^ -o $@

task2: $(DRIVER) $(SRC)/task2.o $(ASM_IO)
	$(GCC) $(GCCFLAGS) $^ -o $@

task2_2: $(DRIVER) $(SRC)/task2_2.o $(ASM_IO)
	$(GCC) $(GCCFLAGS) $^ -o $@

task2_3: $(DRIVER) $(SRC)/task2_3.o $(ASM_IO)
	$(GCC) $(GCCFLAGS) $^ -o $@

# Remove generated object files and executables
clean:
	rm -f $(SRC)/*.o task1 task1_2 task2 task2_2 task2_3