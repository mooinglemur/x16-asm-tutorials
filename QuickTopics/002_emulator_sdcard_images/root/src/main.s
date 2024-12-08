.segment "STARTUP"
    jmp start
.segment "INIT"
.segment "ONCE"
.segment "CODE"

CHROUT = $ffd2

.include "ascii_charmap.inc"

hellotext:
    .byte "HELLO WORLD!",13,0

start:
    ldx #0
loop:
    lda hellotext,x
    beq done
    jsr CHROUT
    inx
    bra loop
done:
    lda #13
    jsr CHROUT
    rts
