.model small
.stack 100h
.data 




.code

main proc 
    include emu8086.inc
    
   mov ah,01h
   int 21h
   printn
          
   Yes:
   printn "Perfect Number"
   jmp finish
   
   No:
   printn "Not Perfect"
   
         

   
   
   mov dl,al
   sub dl,48
   mov bx,0
   mov [bx],dl
   mov bx,1
   mov [bx],0
   
   mov cl,1
   
   check:
   
   mov bx,0
   mov dl,[bx]
   cmp cl,dl
   je perfect
   mov ah,0
   mov al,0
   mov al,[bx]
   mov dl,cl
   div dl
   cmp ah,0
   je sum
   
   increment:
   
   inc cl 
   jmp check
   
   
   
   perfect:
   mov bx,1
   mov dl,[bx]
   mov bx,0
   mov al,[bx]
   cmp dl,al
   je Yes
   jmp No
   
   sum:
   mov bx,1
   add [bx],cl
   jmp increment
                
                
   finish:             
   mov ah,4ch
   int 21h 
    
    
    main endp
end main
