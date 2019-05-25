;---- stack segment begins ----;
myStack segment stack
        db      64 dup ('STACK!!!') ; reserve 512 bytes for the stack
myStack ends
;---- stack segment ends ----;

;---- data segment begins ----;
myData  segment
message db      "Hello World!!!", '$'
CRLF    db      0Dh, 0Ah, '$'
myData  ends
;---- data segment ends ----;

;---- code segment begins ----;
myCode  segment
        assume  cs:myCode, ds:myData

;---- main procedure of our program ----;
main    proc

start:                          ; execution begins here
        mov     ax, myData      ; Move myData segment address into ds
        mov     ds, ax          ; Can't load ds directly

        lea     dx, message     ; Load offset of message into dx
        mov     ah, 09h         ; DOS service to print string   
        int     21h             ; interrupt DOS

        lea     dx, CRLF        ; Load offset of CRLF into dx
        mov     ah, 09h         ; DOS service to print string   
        int     21h             ; interrupt DOS       

        mov     ah, 4Ch         ; DOS service terminate process
        mov     al, 0           ; return ERRORLEVEL 0
        int     21h             ; interrupt DOS

main    endp
;---- main procedure ends ----;

myCode  ends
;---- code segment ends ----;

        end     start