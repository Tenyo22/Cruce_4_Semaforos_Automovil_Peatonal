;ZONA DE DATOS
    PROCESSOR 16F84A
    #INCLUDE <P16F84A.INC>
    __CONFIG _CP_OFF & _PWRTE_OFF & _WDT_ON & _XT_OSC ; 0x3FFD

; RAM-Variable
LRAM_0x10 EQU 0x10
LRAM_0x11 EQU 0x11

; Program

    ORG 0x0000

;   RESET-VECTOR
    GOTO LADR_0x0005

    ORG 0x0004

;   INTERRUPT-VECTOR
    GOTO LADR_0x0018

LADR_0x0005
    MOVLW 0x87           ;  b'10000111'  d'135'
    BSF STATUS,RP0       ;  Register-Bank(0/1)-Select
    MOVWF TMR0           ;  TMR0 - OPTION_REG
    BCF STATUS,RP0       ;  Register-Bank(0/1)-Select
    BSF STATUS,RP0       ;  Register-Bank(0/1)-Select
    CLRF PORTB           ;  PORTB - TRISB
    CLRF PORTA           ;  PORTA - TRISA
    BCF STATUS,RP0       ;  Register-Bank(0/1)-Select
    CLRF LRAM_0x10
    MOVLW 0x61           ;  b'01100001'  d'097'  "a"
    MOVWF PORTB          ;  PORTB - TRISB
    BCF PORTA,1          ;  PORTA - TRISA
    BSF PORTA,0          ;  PORTA - TRISA
    MOVLW 0x10           ;  b'00010000'  d'016'
    MOVWF TMR0           ;  TMR0 - OPTION_REG
    MOVLW 0xA0           ;  b'10100000'  d'160'
    MOVWF INTCON

LADR_0x0016
    CLRWDT
    GOTO LADR_0x0016

LADR_0x0018
    MOVLW 0x10           ;  b'00010000'  d'016'
    MOVWF TMR0           ;  TMR0 - OPTION_REG
    INCF LRAM_0x11,F
    MOVLW 0x05           ;  b'00000101'  d'005'
    SUBWF LRAM_0x11,W
    BTFSS STATUS,Z
    GOTO LADR_0x0069
    CLRF LRAM_0x11
    INCF LRAM_0x10,F
    MOVLW 0x28           ;  b'00101000'  d'040'  "("
    SUBWF LRAM_0x10,W
    BTFSC STATUS,C
    GOTO LADR_0x002A
    MOVLW 0x61           ;  b'01100001'  d'097'  "a"
    MOVWF PORTB          ;  PORTB - TRISB
    BCF PORTA,1          ;  PORTA - TRISA
    BSF PORTA,0          ;  PORTA - TRISA
    GOTO LADR_0x0069

LADR_0x002A
    MOVLW 0x32           ;  b'00110010'  d'050'  "2"
    SUBWF LRAM_0x10,W
    BTFSC STATUS,C
    GOTO LADR_0x0037
    MOVLW 0x61           ;  b'01100001'  d'097'  "a"
    MOVWF PORTB          ;  PORTB - TRISB
    BTFSC LRAM_0x10,0
    GOTO LADR_0x0069
    MOVLW 0x02           ;  b'00000010'  d'002'
    XORWF PORTA,F        ;  PORTA - TRISA
    MOVLW 0x60           ;  b'01100000'  d'096'  "`"
    MOVWF PORTB          ;  PORTB - TRISB
    GOTO LADR_0x0069

LADR_0x0037
    MOVLW 0x3C           ;  b'00111100'  d'060'  "<"
    SUBWF LRAM_0x10,W
    BTFSC STATUS,C
    GOTO LADR_0x0042
    MOVLW 0x62           ;  b'01100010'  d'098'  "b"
    MOVWF PORTB          ;  PORTB - TRISB
    BTFSC LRAM_0x10,0
    GOTO LADR_0x0069
    MOVLW 0x02           ;  b'00000010'  d'002'
    XORWF PORTA,F        ;  PORTA - TRISA
    GOTO LADR_0x0069

LADR_0x0042
    MOVLW 0x64           ;  b'01100100'  d'100'  "d"
    SUBWF LRAM_0x10,W
    BTFSC STATUS,C
    GOTO LADR_0x004B
    MOVLW 0x8C           ;  b'10001100'  d'140'
    MOVWF PORTB          ;  PORTB - TRISB
    BSF PORTA,1          ;  PORTA - TRISA
    BCF PORTA,0          ;  PORTA - TRISA
    GOTO LADR_0x0069

LADR_0x004B
    MOVLW 0x6E           ;  b'01101110'  d'110'  "n"
    SUBWF LRAM_0x10,W
    BTFSC STATUS,C
    GOTO LADR_0x0058
    MOVLW 0x8C           ;  b'10001100'  d'140'
    MOVWF PORTB          ;  PORTB - TRISB
    BTFSS LRAM_0x10,0
    GOTO LADR_0x0069
    MOVLW 0x01           ;  b'00000001'  d'001'
    XORWF PORTA,F        ;  PORTA - TRISA
    MOVLW 0x84           ;  b'10000100'  d'132'
    MOVWF PORTB          ;  PORTB - TRISB
    GOTO LADR_0x0069

LADR_0x0058
    MOVLW 0x78           ;  b'01111000'  d'120'  "x"
    SUBWF LRAM_0x10,W
    BTFSC STATUS,C
    GOTO LADR_0x0064
    MOVLW 0x94           ;  b'10010100'  d'148'
    MOVWF PORTB          ;  PORTB - TRISB
    BTFSS LRAM_0x10,0
    BSF INDF,0
    BTFSC LRAM_0x10,0
    GOTO LADR_0x0069
    MOVLW 0x01           ;  b'00000001'  d'001'
    GOTO LADR_0x0069

LADR_0x0064
    MOVLW 0x61           ;  b'01100001'  d'097'  "a"
    MOVWF PORTB          ;  PORTB - TRISB
    BCF PORTA,1          ;  PORTA - TRISA
    BSF PORTA,0          ;  PORTA - TRISA
    CLRF LRAM_0x10

LADR_0x0069
    MOVLW 0xA0           ;   b'10100000'  d'160'
    MOVWF INTCON
    RETFIE

    End
