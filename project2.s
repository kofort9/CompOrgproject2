.data 
    userInput: .space 5
    invaildInputLength: .asciiz "Input is too long."
    emptyInput: .asciiz "Input is empty."
    invalidInput: .asciiz "Invalid base-28 number." #A-R, 0-9, a-r
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
	Loop:
 		lb $t1, 0($t0)
  		beq $t1, $zero, emptyCheck #  null input 
  		beq $t1, 10, emptyCheck   # newline  input  
  		beq $t1, 32, invalidCheck    # space input
  		beq $t0, 5, stringTooLong
  		addi $t0, $t0, 1
  		j Loop
  		
  	
  	invalidCheck:
  		la $t0, userInput
  		lb $t1, 0($t0)
  		slti $t6, $t5, 48                 # if char < ascii(48),  input invalid,   ascii(48) = 0  
		bne $t6, $zero, inputInvalid
		slti $t6, $t5, 58                 # if char < ascii(58),  input is valid,  ascii(58) = 9  
		bne $t6, $zero, step_char_forward
		slti $t6, $t5, 65                 # if char < ascii(65),  input invalid,   ascii(97) = A  
		bne $t6, $zero, inputInvalid
		slti $t6, $t5, 82                 # if char < ascii(82),  input is valid,  ascii(82) =  R
		bne $t6, $zero, step_char_forward
		slti $t6, $t5, 97                 # if char < ascii(97),  input invalid,   ascii(97) = a
		bne $t6, $zero, inputInvalid
		slti $t6, $t5, 114                # if char < ascii(114), input is valid, ascii(114) = r
		bne $t6, $zero, step_char_forward
		bgt $t5, 115, inputInvalid   # if char > ascii(115), input invalid,  ascii(115) = s

  		
  		addi $t0, $t0, 1
  		j invalidCheck
  		
  	emptyCheck: # new way to check if the string is empty
        	la $t1, userInput
 		j inputEmpty 
        	
        
        
    
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
    
    
    
  
