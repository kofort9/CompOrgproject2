.data 
    stringStatus: .asciiz "Input is empty"
    userInput: .space 5
    # add math base 18?
    invaildinputlengthmessage: .asciiz "Input is too long."
    emptyinput: .asciiz "Input is empty."
    invalidinput: .asciiz "    "
.text
    main:
    
        # Get input 1 byte
        li $v0, 8
        la $a0, userInput #loads adress user input  from memory and stores in regester a0
        li $a1, 5 
        syscall 
        
        li $t0, 0
        li $t1, 10
        checksforemptychar: # checks for no input at all
            lbu $t0, 0($a0)
            beq $t0, $t1, inputempty
        
        #need to check for input of spaces
  
        
        # conditional to check if the length of entered string is equal to 4 characters
        #beqz $a0, inputempty
        #bne $a0, $t0, stringtoolong
        
        
        
        
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
            
 
        
        stringtoolong:
        li $v0, 4
        la $a0, invaildinputlengthmessage 
        syscall 
        
    inputempty:
        li $v0, 4
        la $a0, emptyinput
        syscall 
        
    strlen: li $v0, -1   # $v0 has length - start at -1 
        
        
    exit:
        li $v0, 10 
        syscall 
    
    
    #label to print if string is empty
    #stringEmpty:
    #li $v0, 4
    #la $a0, stringStatus
    #syscall 
    
    # convert input to decimal
    
    # convert imput to base 
    
    
    # print output
    
    
    #end of program