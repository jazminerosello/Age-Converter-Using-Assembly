global _start

section .data
    SYS_EXIT equ 60
    ;declare or initialized variables needed
    age db 25
    days dd 0 ;days is double word since the size that we are going to multiply here are bytes and word so the product should be one size larger to the word
    hours dq 0 ;hours is quadword since the size that are going to multiply here are double word and bytes so the product should be one size larger to the double word

section .text
_start:
    ; CONVERSION OF AGE TO DAYS BY MULTIPLYING THE AGE TO 365
    mov ax, 0 ;clear ax register since we are using this one for multiplying
    mov bx, 0 ; clear bx where we will store the 365 value

    mov bx, 365 ;since immediate value si 365, we cannot directly multiply it to the age so we need to move 365 to a word register
    mov al, byte[age] ;since we are multiplying word into byte, we need to move the byte into a word sized register by mving it to the byte sized register that is part of the word sized register
    mul bx ;so multiply bx to the al, bx contains the 365 and al contains the value of byte age
    mov word[days], ax ;store the value of ax to the days variable
    mov word[days+2], dx ; store the rest or the value that dx hold to the upper 16 bits that's why we add 2 to the days

    ;***************
    ; THIS IS TO CONVERT THE AGE INTO HOURS BY MULTIPLYING THE PRODUCT OF AGE MULTIPLIED TO 365 INTO 24
    mov ecx, eax ;move or copy the value eax have which is 9125 that is also the value of days kasi kapag days ang ginamit nababago value ng days
    mov edx, 0 ;clear the edx register
    mov eax, 0 ;clear the eax register since we used this one in converting age into days so there are values already stored and we cannot use it with them so clear the eax

    mov al, 24 ;move 24 to byte sized register of eax which is al
    mul ecx ;then multiply the ecx(holds now the value of eax and days which is 9125) to eax
    mov dword[hours], eax ;move the lowest 32 bits that can be found in eax register to the hours
    mov dword[hours+4], edx ;move the upper 32 bits that can be found in edx register to the hours + 4 bits(4*8 bytes = 32)

;exit code
exit_here:
    mov rax, SYS_EXIT
	xor rdi, rdi
	syscall
