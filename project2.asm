.data 
    stringStatus: .asciiz "Input is empty"
    userInput: .space 5
    # add math base 18?
    x: .word 2838581
    n: .word 0
    m: .word 0 
    
.text
    main:
    
    # Get input 1 byte
    li $v0, 8
    la $a0, userInput
    li $a1, 5
    syscall 
    
     # loops thru input to check if it is good  
     # if not end and exit 
    loop:
    	li $t1, 0      
    	syscall
    	

    
    #check if string is empty
    #beq $a0, $zero, stringEmpty
    #syscall   
    
    
    #label to print if string is empty
    #stringEmpty:
    #li $v0, 4
    #la $a0, stringStatus
    #syscall 
    
    # convert input to decimal
    
    # convert imput to base 
    
    
    # print output
    
    
