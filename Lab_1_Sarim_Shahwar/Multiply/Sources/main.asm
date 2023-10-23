;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************
;*****************************************************************
;* 8-bit unsigned numbers multiplication- Sarim Shahwar          *      
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

;********************************************
 ;*Code Section                             *
;********************************************

; variable/data section

            ORG $3000
 
MULTIPLICAND FCB 5       ; First number 
MULTIPLIER   FCB 6       ; Second number
PRODUCT      RMB 30      ; Result of the Multiplication
  
;********************************************
;*Actual program here                       *
;********************************************

            ORG   $4000


Entry:
_Startup:
            LDAA MULTIPLICAND   ; Load the first number into register A
            LDAB MULTIPLIER     ; Load the second number into register B
            MUL                 ; Multiply 8-bit numbers in register A with register B. Store the 16-bit result in register D
            STD PRODUCT         ; Store product in register D 
            SWI                 ; break to the monitor
            
;**************************************************************
;* Interrupt Vectors                                          *
;**************************************************************
            ORG   $FFFE
            FDB   Entry      ;Reset Vector
