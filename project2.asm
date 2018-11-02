.data 
    message: .asciiz "hello"
    userInput: .space 20
.text
    main:
    # Getting users input 
    li $v0, 8
    la $a0, userInput
    la $a1, 4
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
    
    