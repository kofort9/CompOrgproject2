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
        
        deletespaces:
		li $t3, 32 # space
		lb $t1, 0($a0)
		beq $t3, $t1, delete_first_char
		move $t3, $a0
		j input_len

	deletefirstspace:
		addi $a0, $a0, 1
		j deletespaces
  
        
        # conditional to check if the length of entered string is equal to 4 characters
        la $t0, userInput
	Loop:
 		lb $t1, 0($t0)
  		beq $t1, $zero, emptyCheck #  null input 
  		#beq $t1, 10, emptyCheck   # newline  input  
  		beq $t1, 32, invalidCheck    # space input
  		beq $t0, 5, stringTooLong
  		addi $t0, $t0, 1
  		j Loop
  		
  	
  	invalidCheck:
  		lb $t1, 0($t0)
  		slti $t6, $t1, 48                 # if char < ascii(48),  input invalid,   ascii(48) = 0  
		bne $t6, $zero, stepChar
		slti $t6, $t1, 58                 # if char < ascii(58),  input is valid,  ascii(58) = 9  
		bne $t6, $zero, stepChar
		slti $t6, $t5, 65                 # if char < ascii(65),  input invalid,   ascii(97) = A  
		bne $t6, $zero, inputInvalid
		slti $t6, $t1, 82                 # if char < ascii(82),  input is valid,  ascii(82) =  R
		bne $t6, $zero, stepChar
		slti $t6, $t1, 97                 # if char < ascii(97),  input invalid,   ascii(97) = a
		bne $t6, $zero, inputInvalid
		slti $t6, $t1, 114                # if char < ascii(114), input is valid, ascii(114) = r
		bne $t6, $zero, stepChar
		bgt $t1, 115, inputInvalid   # if char > ascii(115), input invalid,  ascii(115) = s
  		addi $t0, $t0, 1
  		j invalidCheck
  	
  		
  	stepChar:
		addi $a0, $a0, 1
		j invalidCheck
  				
  										
  	emptyCheck: # new way to check if the string is empty
        	la $t1, userInput
 		j inputEmpty 
        	
            
 
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
        
        
        
     convertBaseInput:
	lb $s4, 0($a0)
	beqz $s4, printresult
	beq $s4, $t1, printresult
	slti $t6, $s4, 58
	bne $t6, $zero, base10
	slti $t6, $s4, 82
	bne $t6, $zero, base28Upper
	slti $t6, $s4, 114
	bne $t6, $zero, base28Lower
    
    
    
    	convertobase10:
		addi $s4, $s4, -42
		j getresult

	base28Upper:
		addi $s4, $s4, -49
		j getresult

	base28Lower:
		addi $s4, $s4, -81
		
	getresult:
		beq $s0, $s3, 1digit
		beq $s0, $s2, 2digit
		beq $s0, $s1, 3digit
		beq $s0, $s5, 4digit
    
    
    	1digit:
		li $s6, 35937
		mult $s4, $s6
		mflo $s7
		add $t7, $t7, $s7
		addi $s0, $s0, -1
		addi $a0, $a0, 1
		j convertBaseInput
		
	2digit:
		li $s6, 1089
		mult $s4, $s6
		mflo $s7
		addi $s0, $s0, -1
		addi $a0, $a0, 1
		j convertBaseInput

    # print output
    
    
    #end of program
        
    exit:
        li $v0, 10 
        syscall 
    
    
    
  
