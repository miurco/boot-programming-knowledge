

A software application, C or Go


All programs get converted to machine code

C Programs --> Compiler --> Machine Code
Go Programs --> Compiler --> Machine Code

---------------------------------------------

**CPU Application/Process Management**

Think of it like a bookmark in multiple books:
•  Each process has a special structure called "Process Control Block" (PCB)
•  The PCB contains a "Program Counter" (PC) that points to the next instruction
•  When the CPU switches processes, it saves the current PC
•  When returning to a process, it loads that saved PC and continues

Like a chef cooking multiple dishes:
•  Chef (CPU) works on one dish (process) for a while
•  Before switching to another dish, writes down exactly where they stopped
•  When returning to the first dish, checks notes to know where to continue
•  The "notes" are stored in memory (in the PCB)


Whos responsability to define logic PC/PCB of each process ? Is it compiler ?


The Process Control Block(PCB) and Program Counter(PC) management is actually handled by the Operating System, not the compiler. Here is the separation of responsabilities:

Compiler's Role
Converts source code to machine code
Generates executable binary file
Handles languages-specific optimization
DOES NOT manage process execution or state


Operating Systems's Role
Creates and manages PCB for each process
Handles process scheduling
Saves and restores PC when switching processes
Manages memory allocation for processes
Handles context switching


So, no C programm could be executed without an operating system unless you write "bare metal" code that runs directly on hardware without an OS(like embedded systems firmware)

**Operating system dependencies are reflected in a compiled program**
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}

gcc -o hello hello.c && file hello
hello: Mach-O 64-bit executable arm64

The binary format is "Mach-O" - this is macOS's native executable format. Different OS's use different formats:
•  macOS uses Mach-O
•  Linux uses ELF (Executable and Linkable Format)
•  Windows uses PE (Portable Executable)

The binary contains:
•  Machine code (CPU instructions)
•  OS-specific headers and metadata
•  References to OS-specific system calls
•  Dynamic linking information for OS libraries
