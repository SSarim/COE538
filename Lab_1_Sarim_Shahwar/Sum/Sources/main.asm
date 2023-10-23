*****************************************************************
;* This program demonstrates how to use the assembly            *
;* It adds together two 8bit numbers and leaves the result       *
;* in the 'SUM' location                                         *
;* Author: Sarim Shahwar                                         *
;*****************************************************************

; * export symbols *
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry                  ; for absolute assembly: mark this as application entry point



; * Include derivative-specific definitions *
  INCLUDE 'derivative.inc'


; * code section *
            ORG   $3000
           
FIRSTNUM    FCB   01
SECNUM      FCB   02
SUM         RMB   1

; * The actual Program Starts here *

            ORG   $4000

Entry:
_Startup:
            LDAA FIRSTNUM         ; Get the first number into ACCA
            ADDA SECNUM           ; Add to it the second number
            STAA SUM              ; and store the sum
            SWI                   ; break to the monitor


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            FDB   Entry           ; Reset Vector