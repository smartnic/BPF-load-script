**This tool provides an easy way to check if a bpf program written in c can pass the verifier test.**

The load.sh script is responsible for taking a .c bpf program as input, compiling it into a .o file using clang, and loading the program into the OS. In case the c file represents an unsafe bpf program, this process fails and the verifier error log is printed.

The Makefile provided only has a "clean" function to remove .o files generated through the process.

Running the examples:
1. sudo ./load.sh sockex1_kern_after.c
2. sudo ./load.sh sockex1_kern_before.c
3. sudo make clean

The 1st command is an example of loading a safe bpf program. So, the command will terminate successfully after printing out a few debug statements.
The 2nd command is an example of loading an unsafe bpf program. In this case, the verifier error log is printed out.

**Based on the .c file we are attempting to load, other bpf files may need to be included in this directory. For the two example c files in this repsitory the current bpf files seem to be sufficient.**

**Information about machine where this code executed:**

OS Name: Ubuntu 20.04.3 LTS

OS Type: 64-bit

Kernel release version: 5.11.0-44-generic





