.data 
    userInput: .space 5
    # add math base 18?
    invaildInputLength: .asciiz "Input is too long."
    emptyInput: .asciiz "Input is empty."
    invalidInput: .asciiz "Invalid base-n number."
.text
    main:
    
        # Get input 1 byte
        li $v0, 8
        la $a0, userInput #loads adress user input  from memory and stores in regester a0
        li $a1, 16 
        syscall 
        
        li $t0, 0
        li $t1, 10
        
        
        #need to check for input of spaces
  
        
        # conditional to check if the length of entered string is equal to 4 characters
        la $t0, userInput
	stringLength:
 		lb $t1, 0($t0)
  		beq $t1, $zero, AfterStringLength
  		addi $t0, $t0, 1
  		j stringLength
  		
  	AfterStringLength:
        
        
        
        
        # prints input from user
        #li $v0, 4 
        #la $a0, userInput
        #syscall
        
        #li $v0, 4
        #la $t0, invalidinput
        #syscall 
        
        # checking if the input is too long
        #beqz $a0, inputempty
        #j exit
        #beq $t0,$v0, inputempty
        #j exit
        
        #bne $a0, $t0, stringtoolong
          
        
        #la $t0, userInput # prints  on char from the input from the user
    #lb $a0, ($t0)
    #li $v0, 11
    #syscall
        
        
        
        
        
        
    
        # loops thru input to check if it is good  
        # if not end and exit 
        loop:
            bgt $s0, 3, exit # condition statment of the loop
            
            li $v0, 1
            add $a0, $s0, $zero #  prints the num of iterations
            syscall 
            # lw $t4, 0($t1)
            # li $v0, 8
            #syscall 
            
        
            addi $s0, $s0, 1 # i++
        
            j loop
            
 
       # error messages 
    stringTooLong:
        la $a0, invaildInputLength
        li $v0, 4
        syscall
        j exit
        
    inputInvalid:        
        la $a0, invalidInput
        li $v0, 4
        syscall
        j exit  
        
    inputEmpty:
        la $a0, emptyInput
        li $v0, 4
        syscall
        j exit 
        
        
        
     # convert input to decimal
    
    # convert imput to base 
    
    
    # print output
    
    
    #end of program
        
    exit:
        li $v0, 10 
        syscall 
    
    
    
  