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
    
    loop:
    	li $v0, 8      #takes an input
    	syscall
    	li $t0, 0  
    	lb  $t0, ($a0) 
    	li $t1, 10
	bne $t0, $t1, loop

    
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
    
    # Tell system its the end of main
    li $v0, 10
    syscall 
    
    
