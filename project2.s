.data 
    stringStatus: .asciiz "Input is empty"
    userInput: .space 20
    # add math base 18?
    x: .word 2838581
    n: .word 0
    m: .word 0 
    
.text
    main:
    # Getting users input 
    li $v0, 8
    la $a0, userInput
    la $a1, 4
    syscall 
    
    #check if string is empty
    beq $a0, $zero, stringEmpty  
    
    
    #label to print if string is empty
    stringEmpty:
    li $v0, 4
    la $a0, stringStatus
    syscall 
    
    # Display message
    li $v0, 4
    la $a0, message
    syscall 
    
    #Display the input 
    li $v0, 4
    la $a0, userInput
    syscall 
    
    # Tell system its the end of main
    li $v0, 10
    syscall 
    
    