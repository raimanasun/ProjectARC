org 100h

; les case font du 4x3 
; le perso se deplace en X= 8h
; le perso se deplace en Y=f0h

call start
call paths
call char
call doors
call deplacement



start proc
    
mov ah, 00      ; Taille d'ecran a 40x25
mov al, 00
int 10h

mov ax, 0b800h  ; On initialise le registre DS a B800h qui correspond au debut de la memoire video
mov ds, ax

mov ax, 02000h  ; On initialise le registre ES a 2000h pour stocker des valeurs necessaires au fonctionnement du jeu
mov es, ax

mov es:[0], 00h ; es:[0] pour le personnage

ret

start endp 

paths proc
    
    push ax
    push bx
    push cx
    push dx

    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 21   ; On a 21 lignes
    mov dx, 0A0h
    
    path1:

        mov [0000h + bx], 0xffffh
        mov [0002h + bx], 0xffffh
        mov [0004h + bx], 0xffffh
        mov [0006h + bx], 0xffffh

        mov [0010h + bx], 0xffffh
        mov [0012h + bx], 0xffffh
        mov [0014h + bx], 0xffffh
        mov [0016h + bx], 0xffffh

        add bx, 50h

    loop path1

    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 3    ; On a 3 lignes
    mov dx, 0A0h

    path2:
        mov [0288h + bx], 0xffffh
        mov [028ah + bx], 0xffffh
        mov [028ch + bx], 0xffffh
        mov [028eh + bx], 0xffffh

        add bx, 50h

        loop path2 

    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 3    ; On a 3 lignes
    mov dx, 0A0h

    path3:
        mov [0018h + bx], 0xffffh
        mov [001ah + bx], 0xffffh
        mov [001ch + bx], 0xffffh
        mov [001eh + bx], 0xffffh

        mov [0020h + bx], 0xffffh
        mov [0022h + bx], 0xffffh
        mov [0024h + bx], 0xffffh
        mov [0026h + bx], 0xffffh

        mov [0028h + bx], 0xffffh
        mov [002ah + bx], 0xffffh
        mov [002ch + bx], 0xffffh
        mov [002eh + bx], 0xffffh

        mov [0030h + bx], 0xffffh
        mov [0032h + bx], 0xffffh
        mov [0034h + bx], 0xffffh
        mov [0036h + bx], 0xffffh

        mov [0038h + bx], 0xffffh
        mov [003ah + bx], 0xffffh
        mov [003ch + bx], 0xffffh
        mov [003eh + bx], 0xffffh

        mov [0040h + bx], 0xffffh
        mov [0042h + bx], 0xffffh
        mov [0044h + bx], 0xffffh
        mov [0046h + bx], 0xffffh

        add bx, 50h

    loop path3

    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 10    ; On a 10 lignes
    mov dx, 0A0h

    path4:
        mov [0070h + bx], 0xffffh
        mov [0072h + bx], 0xffffh
        mov [0074h + bx], 0xffffh
        mov [0076h + bx], 0xffffh

        add bx, 50h

    loop path4

    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 15    ; On a 15 lignes
    mov dx, 0A0h

    path5:
        mov [0210h + bx], 0xffffh
        mov [0212h + bx], 0xffffh
        mov [0214h + bx], 0xffffh
        mov [0216h + bx], 0xffffh
                         
        mov [0220h + bx], 0xffffh
        mov [0222h + bx], 0xffffh
        mov [0224h + bx], 0xffffh
        mov [0226h + bx], 0xffffh
                        
        add bx, 50h

        loop path5 

    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 3    ; On a 3 lignes
    mov dx, 0A0h

    path6:
        mov [05b8h + bx], 0xffffh
        mov [05bah + bx], 0xffffh
        mov [05bch + bx], 0xffffh
        mov [05beh + bx], 0xffffh
  
        mov [05c0h + bx], 0xffffh
        mov [05c2h + bx], 0xffffh
        mov [05c4h + bx], 0xffffh
        mov [05c6h + bx], 0xffffh

        mov [05c8h + bx], 0xffffh
        mov [05cah + bx], 0xffffh
        mov [05cch + bx], 0xffffh
        mov [05ceh + bx], 0xffffh
  
        add bx, 50h

    loop path6
    
    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 3    ; On a 3 lignes
    mov dx, 0A0h

    path7:
        mov [04d0h + bx], 0xffffh
        mov [04d2h + bx], 0xffffh
        mov [04d4h + bx], 0xffffh
        mov [04d6h + bx], 0xffffh
  
        add bx, 50h

    loop path7

    mov ax, 06h
    mov bx, 00h  ; bouge sur position X
    mov cx, 3    ; On a 3 lignes
    mov dx, 0A0h

    path8:
        mov [0218h + bx], 0xffffh
        mov [021ah + bx], 0xffffh
        mov [021ch + bx], 0xffffh
        mov [021eh + bx], 0xffffh
  
        add bx, 50h

    loop path8

    ;ret

    paths endp

doors proc

    dooryel:
        mov [02a0h], 218
        mov [02a1h], 11100000b
        mov [02a2h], 196
        mov [02a3h], 11100000b 
        mov [02a4h], 196
        mov [02a5h], 11100000b
        mov [02a6h], 191
        mov [02a7h], 11100000b

        mov [02f0h], 179
        mov [02f1h], 11100000b
        mov [02f2h], ' '
        mov [02f3h], 11100000b
        mov [02f4h], 05h
        mov [02f5h], 11100000b
        mov [02f6h], 179
        mov [02f7h], 11100000b

        mov [0340h], 179
        mov [0341h], 11100000b
        mov [0342h], ' '
        mov [0343h], 11100000b
        mov [0344h], ' '
        mov [0345h], 11100000b
        mov [0346h], 179
        mov [0347h], 11100000b

    doorred:
        mov [05a0h], 218
        mov [05a1h], 11000000b
        mov [05a2h], 196
        mov [05a3h], 11000000b 
        mov [05a4h], 196
        mov [05a5h], 11000000b
        mov [05a6h], 191
        mov [05a7h], 11000000b

        mov [05f0h], 179
        mov [05f1h], 11000000b
        mov [05f2h], ' '
        mov [05f3h], 11000000b
        mov [05f4h], 05h
        mov [05f5h], 11000000b
        mov [05f6h], 179
        mov [05f7h], 11000000b

        mov [0640h], 179
        mov [0641h], 11000000b
        mov [0642h], ' '
        mov [0643h], 11000000b
        mov [0644h], ' '
        mov [0645h], 11000000b
        mov [0646h], 179
        mov [0647h], 11000000b

    doorgre:
        mov [0000h], 218
        mov [0001h], 10100000b
        mov [0002h], 196
        mov [0003h], 10100000b 
        mov [0004h], 196
        mov [0005h], 10100000b
        mov [0006h], 191
        mov [0007h], 10100000b

        mov [0050h], 179
        mov [0051h], 10100000b
        mov [0052h], ' '
        mov [0053h], 10100000b
        mov [0054h], 05h
        mov [0055h], 10100000b
        mov [0056h], 179
        mov [0057h], 10100000b

        mov [00a0h], 179
        mov [00a1h], 10100000b
        mov [00a2h], ' '
        mov [00a3h], 10100000b
        mov [00a4h], ' '
        mov [00a5h], 10100000b
        mov [00a6h], 179
        mov [00a7h], 10100000b

    doorblu:
        mov [04d0h], 218
        mov [04d1h], 00010000b
        mov [04d2h], 196
        mov [04d3h], 00010000b 
        mov [04d4h], 196
        mov [04d5h], 00010000b
        mov [04d6h], 191
        mov [04d7h], 00010000b

        mov [0520h], 179
        mov [0521h], 00010000b
        mov [0522h], ' '
        mov [0523h], 00010000b
        mov [0524h], 05h
        mov [0525h], 00010000b
        mov [0526h], 179
        mov [0527h], 00010000b

        mov [0570h], 179
        mov [0571h], 00010000b
        mov [0572h], ' '
        mov [0573h], 00010000b
        mov [0574h], ' '
        mov [0575h], 00010000b
        mov [0576h], 179
        mov [0577h], 00010000b 

    doorvio:
        mov [0040h], 218
        mov [0041h], 11010000b
        mov [0042h], 196
        mov [0043h], 11010000b 
        mov [0044h], 196
        mov [0045h], 11010000b
        mov [0046h], 191
        mov [0047h], 11010000b

        mov [0090h], 179
        mov [0091h], 11010000b
        mov [0092h], ' '
        mov [0093h], 11010000b
        mov [0094h], 05h
        mov [0095h], 11010000b
        mov [0096h], 179
        mov [0097h], 11010000b

        mov [00e0h], 179
        mov [00e1h], 11010000b
        mov [00e2h], ' '
        mov [00e3h], 11010000b
        mov [00e4h], ' '
        mov [00e5h], 11010000b
        mov [00e6h], 179
        mov [00e7h], 11010000b
        
    ;ret
        
    doors endp

; les clefs ont qd meme ete mis 
; pour montrer leur positions
keyyel proc    
    mov [05c8h], ' '
    mov [05c9h], 11111110b
    mov [05cah], ' '
    mov [05cbh], 11111110b
    mov [05cch], 201
    mov [05cdh], 11111110b
    mov [05ceh], 187
    mov [05cfh], 11111110b 

    mov [0618h], 201
    mov [0619h], 11111110b
    mov [061ah], 203
    mov [061bh], 11111110b
    mov [061ch], 185
    mov [061dh], 11111110b
    mov [061eh], 186
    mov [061fh], 11111110b
    
    mov [0668h], ' '
    mov [0669h], 11111110b
    mov [066ah], ' '
    mov [066bh], 11111110b
    mov [066ch], 200
    mov [066dh], 11111110b
    mov [066eh], 188
    mov [066fh], 11111110b
    
    ;ret
    
    keyyel endp

keyred proc
    mov [0028h], ' '
    mov [0029h], 11111100b
    mov [002ah], ' '
    mov [002bh], 11111100b
    mov [002ch], 201
    mov [002dh], 11111100b
    mov [002eh], 187
    mov [002fh], 11111100b 

    mov [0078h], 201
    mov [0079h], 11111100b
    mov [007ah], 203
    mov [007bh], 11111100b
    mov [007ch], 185
    mov [007dh], 11111100b
    mov [007eh], 186
    mov [007fh], 11111100b

    mov [00c8h], ' '
    mov [00c9h], 11111100b
    mov [00cah], ' '
    mov [00cbh], 11111100b
    mov [00cch], 200
    mov [00cdh], 11111100b
    mov [00ceh], 188
    mov [00cfh], 11111100b
    
    ;ret

    keyred endp
        
keygre proc
    mov [0288h], ' '
    mov [0289h], 11111010b
    mov [028ah], ' '
    mov [028bh], 11111010b
    mov [028ch], 201
    mov [028dh], 11111010b
    mov [028eh], 187
    mov [028fh], 11111010b

    mov [02d8h], 201
    mov [02d9h], 11111010b
    mov [02dah], 203
    mov [02dbh], 11111010b
    mov [02dch], 185
    mov [02ddh], 11111010b
    mov [02deh], 186
    mov [02dfh], 11111010b

    mov [0328h], ' '
    mov [0329h], 11111010b
    mov [032ah], ' '
    mov [032bh], 11111010b
    mov [032ch], 200
    mov [032dh], 11111010b
    mov [032eh], 188
    mov [032fh], 11111010b 

    ;ret
   
    keygre endp   
      
keyblu proc
    mov [0010h], ' '
    mov [0011h], 11110001b
    mov [0012h], ' '
    mov [0013h], 11110001b
    mov [0014h], 201
    mov [0015h], 11110001b
    mov [0016h], 187
    mov [0017h], 11110001b
    
    mov [0060h], 201
    mov [0061h], 11110001b
    mov [0062h], 203
    mov [0063h], 11110001b
    mov [0064h], 185
    mov [0065h], 11110001b
    mov [0066h], 186
    mov [0067h], 11110001b

    mov [00b0h], ' '
    mov [00b1h], 11110001b
    mov [00b2h], ' '
    mov [00b3h], 11110001b
    mov [00b4h], 200
    mov [00b5h], 11110001b
    mov [00b6h], 188
    mov [00b7h], 11110001b

    ;ret

    keyblu endp
        
keyvio proc
    mov [0218h], ' '
    mov [0219h], 11111101b
    mov [021ah], ' '
    mov [021bh], 11111101b
    mov [021ch], 201
    mov [021dh], 11111101b
    mov [021eh], 187
    mov [021fh], 11111101b

    mov [0268h], 201
    mov [0269h], 11111101b
    mov [026ah], 203
    mov [026bh], 11111101b
    mov [026ch], 185
    mov [026dh], 11111101b
    mov [026eh], 186
    mov [026fh], 11111101b

    mov [02b8h], ' '
    mov [02b9h], 11111101b
    mov [02bah], ' '
    mov [02bbh], 11111101b
    mov [02bch], 200
    mov [02bdh], 11111101b
    mov [02beh], 188
    mov [02bfh], 11111101b

    ;ret                
    
    keyvio endp

char proc  ; fonction graphique du personnage
    
    push ax
    push bx
    push cx
    push dx
   
    mov bx, es:[0] ; On recupere la position du centre du personnage
               
                   
    mov [05e0h + bx], 218
    mov [05e1h + bx], 11110000b
    mov [05e2h + bx], 034
    mov [05e3h + bx], 11110000b
    mov [05e4h + bx], 034
    mov [05e5h + bx], 11110000b
    mov [05e6h + bx], 191
    mov [05e7h + bx], 11110000b
               
    mov [0630h + bx], 040
    mov [0631h + bx], 11110000b
    mov [0632h + bx], 250
    mov [0633h + bx], 11110000b
    mov [0634h + bx], 250
    mov [0635h + bx], 11110000b
    mov [0636h + bx], 041
    mov [0637h + bx], 11110000b

    mov [0680h + bx], 179
    mov [0681h + bx], 11110000b
    mov [0682h + bx], 192
    mov [0683h + bx], 11110000b
    mov [0684h + bx], 217
    mov [0685h + bx], 11110000b
    mov [0686h + bx], 179
    mov [0687h + bx], 11110000b
    
    pop dx
    pop cx
    pop bx
    pop ax 
    
    ret
        
    char endp 


dropchar PROC
    
    push ax
    push bx
    push cx
    push dx

    mov bx, es:[0] ; On recupere la position (la colonne) du centre de la raquette

    mov [05e0h + bx], ' '
    mov [05e2h + bx], ' '
    mov [05e4h + bx], ' '
    mov [05e6h + bx], ' '

    mov [0630h + bx], ' '
    mov [0632h + bx], ' '
    mov [0634h + bx], ' '
    mov [0636h + bx], ' '
    
    mov [0680h + bx], ' '
    mov [0682h + bx], ' '
    mov [0684h + bx], ' '
    mov [0686h + bx], ' '
    
    ret    

    dropchar endp 


deplacement proc
    
    push ax
    push bx
    push cx
    push dx

    mov dx, 0
    mov ax, 0

    mov ah, 6           ; clavier
    mov dl, 255
    int 21h

    cmp al, 113         ; "q" pour la gauche
    jz vers_la_gauche

    cmp al, 100         ; "d" pour la droite
    jz vers_la_droite   

    cmp al, 122         ; "z" pour le haut
    jz vers_le_haut

    cmp al, 115         ; "s" pour le bas
    jz vers_le_bas

    jmp fin

    vers_la_gauche:
    cmp b.es:[0], 0
    jle fin
    call dropchar
    sub B.ES:[0], 8
    jmp suite

    vers_la_droite:
    cmp b.es:[0], 0
    jz fin
    call dropchar
    add b.es:[0], 8      ; ES:[0] position perso
    jmp suite

    vers_le_haut:
    cmp b.es:[0], 0
    jle fin
    call dropchar
    sub b.es:[0], 0
    jmp suite

    vers_le_bas:
    cmp b.es:[0], 160
    jz fin
    call dropchar
    add b.es:[0], 240
    jmp suite

    suite:
    call char

    fin:
    pop dx
    pop cx
    pop bx
    pop ax

    ret

    deplacement endp
