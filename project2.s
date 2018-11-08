.data 
    stringStatus: .asciiz "Input is empty"
    chars: .space 16
    userinput: .space 4 
    # add math base 18?
    x: .word 2838581
    n: .word 0
    m: .word 0 
    
.text
    main:
    
    
    
    
   # Input array
    la $t0, chars
    
    # Get input 1 byte
    li $v0, 8
    la $a0, userInput
    li $a1, 1
    
    # stores char in first position of array
    sw $t1, 0($t0)
    
     # loops thru input
    loop:
        li $t0, userInput      
        syscall
        

    
    #check if string is empty
    beq $a0, $zero, stringEmpty
    syscall   
    
    
    #label to print if string is empty
    stringEmpty:
    li $v0, 4
    la $a0, stringStatus
    syscall 
    
    #Display the input 
    li $v0, 4
    la $a0, userInput
    syscall 
    
    
