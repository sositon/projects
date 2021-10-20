// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//pseudo-code
//LOOP:
//  if kb_is_not_pressed
//     white_screen()
//  black_screen()


    // R0 <- 8192
    @8192
    D=A
    @0
    M=D

(LOOP)

    // R1 <- 0
    @1
    M=0

    // D = RAM[KBD]
    @KBD
    D=M
    @BLACK
    D;JGT
    @WHITE
    D;JEQ

    (BLACK)

        //while i<R0
        @R0
        D=M
        @R1
        D=D-M
        @LOOP
        D;JEQ

        //RAM[SCREEN+i] = -1
        @R1
        D=M
        @SCREEN
        A = A+D
        M = -1

        // i=i+1
        @R1
        M=M+1
        @BLACK
        0;JMP


    (WHITE)

        //while i<R0
        @R0
        D=M
        @R1
        D=D-M
        @LOOP
        D;JEQ

        //RAM[SCREEN+i] = -1
        @R1
        D=M
        @SCREEN
        A = A+D
        M = 0

        // i=i+1
        @R1
        M=M+1
        @WHITE
        0;JMP

















