.data 
    stringStatus: .asciiz "Input is empty"
    userInput: .space 5
    # add math base 18?
    x: .word 2838581
    n: .word 0
    m: .word 0 
    message: .asciiz "AFter while loop is done"
    newspace: .asciiz " "
    
.text
    main:
    
        # Get input 1 byte
        li $v0, 8
        la $a0, userInput #loads adress user input  from memory and stores in regester a0
        li $a1, 5 
        syscall 
    
        li $v0, 4 
        la $a0, userInput
        syscall 
        
        
    
        # loops thru input to check if it is good  
        # if not end and exit 
        loop:
            bgt $t0, 3, exit # condition statment of the loop
            
            li $v0, 1
            add $a0, $t0, $zero #  prints the num of iterations
            syscall 
            # lw $t4, 0($t1)
            # li $v0, 8
            #syscall 
            
        
            addi $t0, $t0, 1 # i++
        
            j loop
        
        
        exit:
        
    li $v0, 10 
    syscall 