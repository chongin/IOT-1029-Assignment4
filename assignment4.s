.global _start

.equ amark, 90
.equ bmark, 75
.equ cmark, 50

_start:
    MOV R5, #75    // The assignment grade (you can change this value for testing)

    LDR R6, =amark // Load the value at the memory address 'amark' into R6
    LDR R7, =bmark // Load the value at the memory address 'bmark' into R7
    LDR R8, =cmark // Load the value at the memory address 'cmark' into R8

    CMP R5, R6  // compare input grade and a grade
    BGE print_a_grade // handle input grade is greater or equal than a grade

    CMP R5, R7 // compare input grade and b grade
    BGE print_b_grade // handle input grade is greater or equal than b grade

    CMP R5, R8 // compare input grade and c grade
    BGE print_c_grade // handle input grade is greater or equal than c grade
    BLT print_f_grade // input grade is less than c grade

print_a_grade:
    LDR R1, =amessage  // Load the value at memory address '=amessage' into R1
    LDR R2, =alen // Load the length value of amessage at memory address '=alen' into R2
    B print_message

print_b_grade:
    LDR R1, =bmessage // Load the value at memory address '=bmessage' into R1
    LDR R2, =blen // Load the length value of bmessage at memory address '=blen' into R2
    B print_message

print_c_grade:
    LDR R1, =cmessage // Load the value at memory address '=cmessage' into R1
    LDR R2, =clen // Load the length value of cmessage at memory address '=clen' into R2
    B print_message

print_f_grade:
    LDR R1, =fmessage // Load the value at memory address '=fmessage' into R1
    LDR R2, =flen // Load the length value of fmessage at memory address '=flen' into R2
    B print_message

print_message:
    MOV R7, #4 // syscall to call write function
    MOV R0, #1 //print to stdout
    SWI 0 // execute the interrupt to invoke the write function

end:
    MOV R7, #1 // syscall to terminate the current process, exit call
    MOV R0, #0 // no error
    SWI 0 // return status code 0

.data

amessage:
    .asciz "Congratulations, you got an A.\n"  // define constant amessage string value
alen = .-amessage // calculate the length value of amessage

bmessage:
    .asciz "Good job! You got a B.\n" // define constant bmessage string value
blen = .-bmessage // calculate the length value of bmessage

cmessage:
    .asciz "Not bad, you got a C.\n" // define constant cmessage string value
clen = .-cmessage // calculate the length value of cmessage

fmessage:
    .asciz "Sorry, you got an F.\n" // define constant fmessage string value
flen = .-fmessage // calculate the length value of fmessage


