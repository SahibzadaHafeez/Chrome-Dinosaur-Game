.model huge
.stack 100h
.data
    ;Screen 1_________________________
	play DB "Play"
	instruction DB "Instructions"
	exit DB "Exit"
	;back DB "Go Back"
	
	button db ?
	XCord DB ?
	YCord DB ?
    ;Screen2___________________________

    file db "inst.txt", 0
    buffer db 500 dup(0)
    handle dw ? 

    highscoreFile db "high.txt", 0
    highscoreTracker dw 0000h

	;Screen 3 stuff_______________________________________________________________________________________________________________________________________________________________________________________________________________________
    ;Game Systems
    scoreCount db "Score:"
	liveCount db "Lives: 3"
    highscoreMsg db "Highscore:"
    gameOverMsg db "GAME OVER!"
    scoreInterval db 0
    scoreTracker dw 0
    liveTracker dw 3
    speed dw 4
    sfx dw ?
    isCrouching db 0
    ;Dino Data
    xpos_dino dw 50
    ypos_dino dw 150
	xpos_dino_temp dw 50
    ypos_dino_temp dw 150
    jumpHeight dw 50
    tempJumpHeight dw 0
    jumpSpeed dw 5
    jumping db 0
    falling db 0
    collisionLimiter dw 0
    frameSelecDino dw 0
    ;Dino Crouching Data
    xpos_dino_c dw 50
    ypos_dino_c dw 156
    xpos_dino_c_temp dw 50
    ypos_dino_c_temp dw 156
    ;GroundData
    xpos_grnd dw 0
    ypos_grnd dw 167
    ;Cactus data
    spawnCac db 0
    reset_xpos_cac dw 299
	xpos_cac dw 299
	ypos_cac dw 143
    ;Perodactyl data
    frameSelec dw 0
    spawnTero db 0
    ypos_tero dw 100
    reset_xpos_tero dw 299
    xpos_tero dw 299
    ;Heart Data
    xpos_heart dw 300
    ypos_heart dw 120
    reset_xpos_heart dw 300
    spawnHeart dw 0
    isHeart dw 0

    ;Dino Pixel Map
    dinoStr1 db "PPPPPPPPPPAAAAAAAAAPPPPPPPPPPAAPAAAAAAAAPPPPPPPPPAAAAAAAAAAAPPPPPPPPPAAAAAAAAAAAPPPPPPPPPAAAAAAAAAAAPPPPPPPPPAAAAAAPPPPPPPPPPPPPPAAAAAAAAAPPAPPPPPPPAAAAAAPPPPPPAPPPPPPAAAAAAAPPPPPPAAPPPPAAAAAAAAAAPPPP"
    dinoStr2 db "AAAPPAAAAAAAAAPAPPPPAAAAAAAAAAAAAAPPPPPPPAAAAAAAAAAAAAPPPPPPPPAAAAAAAAAAAPPPPPPPPPPAAAAAAAAAPPPPPPPPPPPPAAAAAAAPPPPPPPPPPPPPPAAAPAAPPPPPPPPPPPPPPAAPPPAAPPPPPPPPPPPPPAPPPPPPPPPPPPPPPPPPPAAPPPPPPPPPPPPP"
    dinoStr3 db "PPPPPPPPPPAAAAAAAAAPPPPPPPPPPAAPAAAAAAAAPPPPPPPPPAAAAAAAAAAAPPPPPPPPPAAAAAAAAAAAPPPPPPPPPAAAAAAAAAAAPPPPPPPPPAAAAAAPPPPPPPPPPPPPPAAAAAAAAAPPAPPPPPPPAAAAAAPPPPPPAPPPPPPAAAAAAAPPPPPPAAPPPPAAAAAAAAAAPPPP"
    dinoStr4 db "AAAPPAAAAAAAAAPAPPPPAAAAAAAAAAAAAAPPPPPPPAAAAAAAAAAAAAPPPPPPPPAAAAAAAAAAAPPPPPPPPPPAAAAAAAAAPPPPPPPPPPPPAAAAAAAPPPPPPPPPPPPPPAAAPAAPPPPPPPPPPPPPPAAPPPAPPPPPPPPPPPPPPAAPPPAPPPPPPPPPPPPPPPPPPPAAPPPPPPPP"
    ;Dino Crouching Pixel Map
    dinoStrC1 db "APPPPPPPPPPPPPPPPPPPPPPPPPPAAAPPPPAAAAAAAAPPPAAAAAAAAPAAAAAAAAAAAAAAAAAAAPAAAAAAAPAAAAAAAAAAAAAAAAAAAAAAAAAAPPAAAAAAAAAAAAAAAAAAAAAAAAAPPPAAAAAAAAAAAAAAAAAAAAAAAAPPPPAAAAAAAAAAAAAAAAAAPPPPP"
    dinoStrC2 db "PPPPPAAAAAAAAAAAPPAAAAAAAPPPPPPPPAAAAAAAAAAPPPPPPPPPPPPPPPPAAPAAAPPPAPPPPPPPPPPPPPPPPPAAPAAPPPPAAPPPPPPPPPPPPPPPPAPPAAPPPPPPPPPPPPPPPPPPPPPPAAPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP"  
    dinoStrC3 db "APPPPPPPPPPPPPPPPPPPPPPPPPPAAAPPPPAAAAAAAAPPPAAAAAAAAPAAAAAAAAAAAAAAAAAAAPAAAAAAAPAAAAAAAAAAAAAAAAAAAAAAAAAAPPAAAAAAAAAAAAAAAAAAAAAAAAAPPPAAAAAAAAAAAAAAAAAAAAAAAAPPPPAAAAAAAAAAAAAAAAAAPPPPP"
    dinoStrC4 db "PPPPPAAAAAAAAAAAPPAAAAAAAPPPPPPPPAAAAAAAAAAPPPPPPPPPPPPPPPPAAPAAAPPPAPPPPPPPPPPPPPPPPPAPPAAPPPPAAPPPPPPPPPPPPPPPPAAPAPPPPPPPPPPPPPPPPPPPPPPPPPPAAPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP"
    ;Cactus Pixel Map
    cacStr1 db "PPPPPPPPAAAPPPPPPPPPPPPPPPPAIIIAPPPPPPPPPPPPPPAIIIIIAPPPPPPPPPPPPPAIIIIIAPPPPPPPPPPPPPAIIIIIAPPPAAPPPPPPPPAIIIIIAPPAIIAPPPAPPPAIIIIIAPAIIIIAPAIAPPAIIIIIAPAIIIIAAIIIAPAIIIIIAPAIIIIAAIIIAPAIIIIIAPAIIIIA"
    cacStr2 db "AIIIAPAIIIIIAPAIIIIAAIIIAPAIIIIIAPAIIIIAAIIIAPAIIIIIAPAIIIIAAIIIAPAIIIIIAPAIIIIAAIIIAAAIIIIIAAAIIIIAAIIIIIIIIIIIIIIIIIAPAIIIIIIIIIIIIIIIIAPPPAIIIIIIIIIIIIIIAPPPPPAIIIIIIIIIIIIAPPPPPPPAIIIIIIIIAAAPPPPP"
    cacStr3 db "PPPPAAAIIIIIAPPPPPPPPPPPPPAIIIIIAPPPPPPPPPPPPPAIIIIIAPPAPPPPPPPAPAAIIIIIAPAIAPPPPPAIAIAIIIIIAPPAPPPPPPAAPAAIIIIIAPPPPPPP"
	;Pterodactyl Pixel Map
    teroU1 db "PPPPPPPAPPPPPPPPPPPPPPPPPPPPAAPPPPPPPPPPPPPPPPPPPAAAPPPPPPPPPPPPPPPAAPPAAAPPPPPPPPPPPPPAAAPPAAAAPPPPPPPPPPPAAAAAPAAAAAPPPPPPPPPAAAAAAPAAAAAAPPPPPPPAAAAAAAAAAAAAAPPPPPPPPPPPPPAAAAAAAAAPPPPPP"
    teroU2 db "PPPPPPPAAAAAAAAAAAAAAPPPPPPPPAAAAAAAAAAPPPPPPPPPPPPAAAAAAAAAAAPPPPPPPPPPPAAAAAAAPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP"
    teroD1 db "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPAAPPPPPPPPPPPPPPPPPPAAAPPPPPPPPPPPPPPPPPAAAAAPPPPPPPPPPPPPPPAAAAAAPPPPPPPPPPPPPPAAAAAAAAAAAAAAPPPPPPPPPPPPPAAAAAAAAPPPPPPP"
    teroD2 db "PPPPPPPAAAAAAAAAAAAAAPPPPPPPPAAAAAAAAAAPPPPPPPPPPPAAAAAAAAAAAAPPPPPPPPPAAAAAAAAAPPPPPPPPPPPPAAAAPPPPPPPPPPPPPPPPPAAAPPPPPPPPPPPPPPPPPPAAPPPPPPPPPPPPPPPPPPPAAPPPPPPPPPPPPPPPPPPPAPPPPPPPPPPPP"
    ;Heart Pixel Map
    heart db "PMMPMMPMMMMPMMMMMMMMMPMMMMMPPPMMMPPPPPMPPP"
    ;Screen 3 stuff_______________________________________________________________________________________________________________________________________________________________________________________________________________________



.code
	main proc
	
	mov ax,@data
	mov es,ax
	mov ds,ax
	
	mov ah,0
	mov al,13h
	int 10h
		
	mov bp,OFFSET play ;Put address of string into BP
	mov ah,13h
	mov al,01h
	mov bh,0 ; Set Page number
	mov bl, 0fh ; Set Color
	mov cx, Lengthof play ; Length of the string.
	mov dh,7 ; Row number
	mov dl,18 ; Col number
	int 10h
	
	mov bp,OFFSET instruction ;Put address of string into BP
	mov ah,13h
	mov al,01h
	mov bh,0 ; Set Page number
	mov bl, 0fh ; Set Color
	mov cx,Lengthof instruction ; Length of the string.
	mov dh,10 ; Row number
	mov dl,14 ; Col number
	int 10h
	
	
	mov bp,OFFSET exit ;Put address of string into BP
	mov ah,13h
	mov al,01h
	mov bh,0 ; Set Page number
	mov bl, 0fh ; Set Color
	mov cx,Lengthof exit ; Length of the string.
	mov dh,13 ; Row number
	mov dl,18 ; Col number
	int 10h
	
	
	;Mouse handling
	
	mov ax,1
	int 33h
	
	again:
	mov ax,3
	int 33h
	
	mov button,bl
	
	mov ax,cx
	mov bl,8
	div bl
	
	mov XCord,al
	
	mov ax,dx
	mov bl,16
	div bl
	
	mov YCord,al
	
	mov bl,button
	
	;Checks for Mouse handling.
	CMP XCord,29 ;XCord check
	JL  again
	
	CMP XCord,49 ;XCord check
	JG again
	
	CMP YCord,3 ;Top boundary check for YCord
	JL again
	
	CMP YCord,7
	JG again
	
	CMP bl,1
	JNE again
	
	CMP YCord, 3
	JE S3 ;Play
	
	CMP YCord, 5
	JE S2 ;Instructions

    CMP Ycord, 6
    Je terminate

    jmp again
	
	terminate:
	mov al,3
	mov ah,0
	int 10h
	
	JMP BREAK
	
	S2:

	mov ah,0
	mov al,13h
	int 10h

	call readfile
	call instructions

	; mov bp,OFFSET play ;Put address of string into BP
	; mov ah,13h
	; mov al,01h
	; mov bh,0 ; Set Page number
	; mov bl,3 ; Set Color
	; mov cx,Lengthof play ; Length of the string.
	; mov dh,22 ; Row number
	; mov dl,65 ; Col number
	; int 10h
	
	again2:
	mov ah,0h 
	int 16h

	CMP al,0Dh
	JNE backcheck
	JE S3
backcheck:
	CMP al,8
	JNE again2
	JE terminate

	S3:

    push ax
    push bx
    push cx
    push dx
    call highscoreRead
    pop dx
    pop cx
    pop bx
    pop ax

    ;Loads the video mode
    mov ah, 0h
    mov al, 13h
    int 10h

    gameLoop:

    ; push ax
    ;     mov ax, scoreTracker
    ;     cmp ax, highscoreTracker
    ;     jle keepScore
    ;     mov highscoreTracker, ax
    ;     keepScore:
    ; pop ax

    cmp scoreTracker, 50
    jne keepSpeed
    mov speed, 7

    keepSpeed:
    cmp scoreTracker, 100
    jne keepSpeed2
    mov speed, 10
    keepSpeed2:

    push ax
    ;Calclates spawn chance for Cactus
    cmp spawnCac, 1
    je skipTero
    cmp spawnTero, 1
    je skipTero
    call randGen
    cmp al, 70; %chance of cactus spawning on a frame, remaining chance is for terodactyl
    jge skipCac
    mov spawnCac, 1
    ;mov spawnHeart, 1
    jmp skipTero
    skipCac:
    ;Spawn Terodactyl
    mov spawnTero, 1
    mov ah, 2ch
    int 21h
    and dh, 01b
    cmp dh, 0
    je highTero
    mov ypos_tero, 150
    jmp skipTero
    highTero:
    mov ypos_tero, 135

    skipTero:

    cmp spawnHeart, 1
    je skipHeart
    call randGen
    cmp al, 1
    jge skipHeart
    mov spawnHeart, 1
    skipHeart:
    
    pop ax

    

    ;Checks if any key has been pressed
    mov ah, 01h
    int 16h
    ;Compares to see what key has been pressed
    cmp al, 27
    je killit
    ;Crouching
    cmp ah, 4Dh
    jne notMovingRight
    call moveRight
    notMovingRight:
    cmp ah, 4bh
    jne notMovingLeft
    call moveLeft
    notMovingLeft:
    cmp ah, 50h
    je setCrouching

    cmp ah, 48h
    jne skipJump
    call startJump
    jmp skipJump
    setCrouching:
    cmp jumping, 1
    je skipJump
    mov isCrouching, 1
    skipJump:
    ;Clears the KB buffer
    mov ah, 0ch
    mov al, 0
    int 21h

    ;sets BG color/clear window
    mov ah, 06h
    mov al, 00h
    mov ch, 00h
    mov cl, 00h
    mov dh, 4Fh
    mov dl, 4Fh
    mov bh, 0fh ;color
    int 10h

	
	call printLives
	call printScore
    call printHighScore

    ;call drawDino
    cmp spawnCac, 0
    je noDrawCac
    call drawCac
    noDrawCac:

    call drawGround

    ;call drawTero
    cmp spawnTero, 0
    je noDrawTero
    call drawtero
    noDrawTero:

    cmp spawnHeart, 0
    je noDrawHeart
    call drawHeart
    noDrawHeart:
    ;call drawTero

    cmp isCrouching, 0
    jne drawCrouching
    call drawDino
    jmp skipCrouchingDraw
    drawCrouching:
    call drawDinoC
    skipCrouchingDraw:
    ;call drawDinoC
    MOV CX, 00H
    MOV DX, 5000h
    MOV AH, 86H      ;BIOS Wait/Delay function
    INT 15H

    cmp scoreInterval, 25
    jl noScore
    inc scoreTracker
    mov scoreInterval, 0
    noScore:
    inc scoreInterval

    ;Checks if player is out of lives
    cmp liveTracker, 0
    jle killit

   jmp gameLoop

    killit:
        call printLives
        call printGameOver
        mov ax, scoreTracker
        cmp ax, highscoreTracker
        jg newHighscore
        jle keepScore

        newHighscore:
        mov highscoreTracker, ax
                
        keepScore:
        call printHighScore
        call highscoreWrite
        mov ah, 4ch
        int 21h


    BREAK:
       mov ah, 4ch
       int 21h
	
	main endp

    readfile proc

        mov dx, offset file
        mov al, 0
        mov ah, 3dh
        int 21h

        mov handle, ax
        mov bx, handle

        mov dx, offset buffer
        mov cx, lengthof buffer
        mov ah, 3fh
        int 21h

        mov ah, 3eh
        int 21h        

        ret
    readfile endp

    instructions proc

        mov ah, 0
        mov al, 13h
        int 10h
		
        mov ah, 02h
        mov dx, 0
        int 10h
        
        mov al, 01h
        mov ah, 13h
        mov cx, lengthof buffer
        mov bx, ds
        mov es, bx
        mov bp, offset buffer 
        mov bx, 0
        mov bl, 07h
        int 10h

        ret
    instructions endp

    highscoreRead proc
        mov dx, offset highscoreFile
        mov al, 0
        mov ah, 3dh
        int 21h

        mov bx, ax

        mov dx, offset highscoreTracker
        mov cx, lengthof highscoreTracker
        mov ah, 3fh
        int 21h

        mov ah, 3eh
        int 21h
    highscoreRead endp

    highscoreWrite proc
        mov dx, offset highscoreFile
        mov al, 2
        mov ah, 3dh
        int 21H

        mov bx, ax

        mov cx, lengthof highscoreTracker
        mov dx, offset highscoreTracker
        mov ah, 40h
        int 21H

        mov ah, 3eh
        int 21H
        ret
    highscoreWrite endp

	drawDino proc
        ;Check's if ascending or decending
        cmp jumping, 0
        je noJump
        cmp falling, 1
        je makeFall

        ;Checks if jump apex has been reached
        mov ax, JumpHeight
        cmp tempJumpHeight, ax
        jge setFall; starts falling if apex reached

        ;Ascends dino
        mov ax, jumpSpeed
        sub ypos_dino, ax
        add tempJumpHeight, ax

        jmp noJump

        setFall:
        mov falling, 1
        jmp noJump

        makeFall:
        mov ax, jumpSpeed
        add ypos_dino, ax
        sub tempJumpHeight, ax
        cmp tempJumpHeight, 0
        jne noJump
        mov falling, 0
        mov jumping, 0



        noJump:
        mov cx, 400
        mov si, 0
        mov di, 0
        mov ax, xpos_dino
        mov xpos_dino_temp, ax
        mov ax, ypos_dino
        mov ypos_dino_temp, ax 
        
        dinoL1:
            push cx ;stores loop counter
            mov bx, offset dinoStr1
            mov ax, frameSelecDino
            and ax, 01111b
            cmp ax, 7
            jle swapLeg
            mov bx, offset dinoStr3
            push bx
            ;call playSound
            pop bx
            swapLeg:

            mov ah, 0ch
            mov al, [bx + si]
            sub al, 41h
            cmp al, 0fh
            je d_skip_pixel
            mov bh, 0
            mov cx, xpos_dino_temp
            mov dx, ypos_dino_temp
            int 10h
            d_skip_pixel:
            inc si

            pop cx
            
            inc di
            cmp di, 20
            je dinoInc_y

            dinoCont:
            ;inc ypos
            inc xpos_dino_temp
            
        loop dinoL1

        inc frameSelecDino
        jmp exitDrawDino

        ;jumps to the next line
        dinoInc_y:
            mov di, 0
            inc ypos_dino_temp
            sub xpos_dino_temp, 20
        jmp dinoCont

        exitDrawDino:
        ret

    drawDino endp

    drawDinoC proc
        mov cx, 378
        mov si, 0
        mov di, 0
        mov ax, xpos_dino_c
        mov xpos_dino_c_temp, ax
        mov ax, ypos_dino_c
        mov ypos_dino_c_temp, ax 
        
        dinoCL1:
            push cx ;stores loop counter
            mov bx, offset dinoStrC1
            mov ax, frameSelecDino
            and ax, 01111b
            cmp ax, 7
            jle swapLegC
            mov bx, offset dinoStrC3

            swapLegC:

            mov ah, 0ch
            mov al, [bx + si]
            sub al, 41h
            cmp al, 0fh
            je dc_skip_pixel
            mov bh, 0
            mov cx, xpos_dino_c_temp
            mov dx, ypos_dino_c_temp
            int 10h
            dc_skip_pixel:
            inc si

            pop cx
            
            inc di
            cmp di, 27
            je dinoCInc_y

            dinoCCont:
            ;inc ypos
            inc xpos_dino_c_temp
            
        loop dinoCL1

        inc frameSelecDino
        jmp exitDrawDinoC

        ;jumps to the next line
        dinoCInc_y:
            mov di, 0
            inc ypos_dino_c_temp
            sub xpos_dino_c_temp, 27
        jmp dinoCCont

        exitDrawDinoC:
        ;mov isCrouching, 0
        ret
    drawDinoC endp

    drawCac proc
        push xpos_cac
        push ypos_cac
        mov cx, 520
        mov si, 0
        mov di, 0

        cacL1:
            push cx ;stores loop counter
            mov bx, offset cacStr1
            ;mov cntr, cx

            mov ah, 0ch
            mov al, [bx + si]
            sub al, 41h
            cmp al, 0fh
            je c_skip_pixel
            ;sub al, 41h
            mov bh, 0
            mov cx, xpos_cac
            mov dx, ypos_cac
            int 10h

            mov bx, xpos_cac
            mov cx, ypos_cac

            cmp collisionLimiter, 0
            jne skipCollisionCac
            
            call checkCollision
            skipCollisionCac:
            c_skip_pixel:
            
            inc si

            pop cx
            
            inc di
            cmp di, 20
            je cacInc_y

            cacCont:
            ;inc ypos
            inc xpos_cac
            
        loop cacL1
        cmp collisionLimiter, 0
        jle decInvulCac
        dec collisionLimiter
        decInvulCac:

        pop ypos_cac
        pop xpos_cac

        mov ax, speed
        sub xpos_cac, ax

        cmp xpos_cac, 0
        jg exitDrawCac
        
        mov ax, reset_xpos_cac
        mov xpos_cac, ax
        mov spawnCac, 0

        jmp exitDrawCac

        ;jumps to the next line
        cacInc_y:
            mov di, 0
            inc ypos_cac
            sub xpos_cac, 20
        jmp cacCont

        exitDrawCac:
        ret

    drawCac endp

    drawTero proc

        push xpos_tero
        push ypos_tero

        mov cx, 378
        mov si, 0
        mov di, 0
        teroL1:
            push cx ;stores loop counter
            mov bx, offset teroU1
            mov ax, frameSelec
            and ax, 01111b
            cmp ax, 7
            jle swap
            mov bx, offset teroD1
            swap:

            mov ah, 0ch
            mov al, [bx + si]
            sub al, 41h
            cmp al, 0fh
            je t_skip_pixel
            ;sub al, 41h
            mov bh, 0
            mov cx, xpos_tero
            mov dx, ypos_tero
            int 10h

            mov bx, xpos_tero
            mov cx, ypos_tero

            cmp collisionLimiter, 0
            jne skipCollisionTero
            
            call checkCollision
            skipCollisionTero:

            t_skip_pixel:

            inc si

            pop cx
            
            inc di
            cmp di, 21
            je teroInc_y

            teroCont:
            inc xpos_tero
            
        loop teroL1

        cmp collisionLimiter, 0
        jle decInvulTero
        dec collisionLimiter
        decInvulTero:

        pop ypos_tero
        pop xpos_tero
        inc frameSelec
        mov ax, speed
        sub xpos_tero, ax

        cmp xpos_tero, 0
        jg exitDrawtero
        
        mov ax, reset_xpos_tero
        mov xpos_tero, ax
        mov spawnTero, 0

        jmp exitDrawtero

        ;jumps to the next line
        teroInc_y:
            mov di, 0
            inc ypos_tero
            sub xpos_tero, 21
        jmp teroCont

        exitDrawtero:
        ret

    drawTero endp

    drawHeart proc
        push xpos_heart
        push ypos_heart
        mov cx, 42
        mov si, 0
        mov di, 0

        heartL1:
            push cx ;stores loop counter
            mov bx, offset heart
            ;mov cntr, cx

            mov ah, 0ch
            mov al, [bx + si]
            sub al, 41h
            cmp al, 0fh
            je h_skip_pixel
            ;sub al, 41h
            mov bh, 0
            mov cx, xpos_heart
            mov dx, ypos_heart
            int 10h

            mov bx, xpos_heart
            mov cx, ypos_heart
            mov isHeart, 1

            cmp collisionLimiter, 0
            jne skipCollisionHeart
            
            call checkCollision
            skipCollisionHeart:
            h_skip_pixel:
            
            inc si

            pop cx
            
            inc di
            cmp di, 7
            je heartInc_y

            heartCont:
            ;inc ypos
            inc xpos_heart
            
        loop heartL1
        cmp collisionLimiter, 0
        jle decInvulHeart
        dec collisionLimiter
        decInvulHeart:

        pop ypos_heart
        pop xpos_heart

        mov ax, speed
        sub xpos_heart, ax

        cmp xpos_heart, 0
        jg exitDrawHeart
        
        mov ax, reset_xpos_heart
        mov xpos_heart, ax
        mov spawnHeart, 0

        jmp exitDrawHeart

        ;jumps to the next line
        heartInc_y:
            mov di, 0
            inc ypos_heart
            sub xpos_heart, 7
        jmp heartCont

        exitDrawHeart:
        mov isHeart, 0
        ret
    drawHeart endp

    drawGround proc
        mov cx, 320
        mov si, 0
        mov di, 0
        push xpos_grnd
        push ypos_grnd
        groundL1:
            push cx 

            mov ah, 0ch
            mov al, 7h
            mov bh, 0
            mov cx, xpos_grnd
            mov dx, ypos_grnd
            int 10h

            inc xpos_grnd

            pop cx
            
        loop groundL1
        pop ypos_grnd
        pop xpos_grnd
        ret
    drawGround endp

	printLives proc
        mov bp,OFFSET liveCount ;Put address of string into BP
        mov ah,13h
        mov al,01h
        mov bh,0 ; Set Page number
        mov bl, 0fh ; Set Color
        mov cx,Lengthof liveCount ; Length of the string.
        mov dh,1 ; Row number
        mov dl,3 ; Col number
        int 10h
        ret
	printLives endp

	printScore proc
        mov bp,OFFSET scoreCount ;Put address of string into BP
        mov ah, 13h
        mov al,01h
        mov bh,0 ; Set Page number
        mov bl, 0fh ; Set Color
        mov cx,Lengthof scoreCount ; Length of the string.
        mov dh,1 ; Row number
        mov dl,30 ; Col number
        int 10h
		
		mov ax,scoreTracker
		call render_display
		
        ret
	printScore endp

    printHighScore proc
        mov bp,OFFSET highscoreMsg ;Put address of string into BP
        mov ah, 13h
        mov al,01h
        mov bh,0 ; Set Page number
        mov bl, 0fh ; Set Color
        mov cx,Lengthof highscoreMsg ; Length of the string.
        mov dh,1 ; Row number
        mov dl,15 ; Col number
        int 10h
		
		mov ax,highscoreTracker
		call render_display
		
        ret
	printHighScore endp

    printGameOver proc
        mov bp,OFFSET gameOverMsg ;Put address of string into BP
        mov ah, 13h
        mov al,01h
        mov bh,0 ; Set Page number
        mov bl, 0fh ; Set Color
        mov cx,Lengthof gameOverMsg ; Length of the string.
        mov dh,12 ; Row number
        mov dl,14 ; Col number
        int 10h
        ret
	printGameOver endp

    checkCollision proc
        cmp isCrouching, 0
        jne crouchColCheck

        mov ax, xpos_dino
        add ax, 2
        cmp bx, ax
        jle noCollision
        add ax, 12
        cmp bx, ax
        jge noCollision

        mov ax, ypos_dino
        cmp cx, ax
        jle noCollision
        add ax, 20
        cmp cx,ax
        jge noCollision

        jmp collisionDetected

        crouchColCheck:
        mov ax, xpos_dino_c
        cmp bx, ax
        jle noCollision
        add ax, 27
        cmp bx, ax
        jge noCollision

        mov ax, ypos_dino_c
        cmp cx, ax
        jle noCollision
        add ax, 14
        cmp cx,ax
        jge noCollision

        collisionDetected:
        cmp isHeart, 1
        je gotHeart
        dec liveTracker
        dec [liveCount + 7]
        mov collisionLimiter, 21
        mov sfx, 2000
        call playSound

        jmp noCollision

        gotHeart:
        mov isHeart, 0
        inc liveTracker
        inc [liveCount + 7]
        mov collisionLimiter, 28
        mov sfx, 3500
        call playSound
        ;mov spawnHeart, 0
        
        noCollision:
        ret
    checkCollision endp

    randGen proc
        RANDSTART:
        MOV AH, 00h  ; interrupts to get system time        
        INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

        mov  ax, dx
        xor  dx, dx
        mov  cx, 100    
        div  cx       ; here dx contains the remainder of the division - from 0 to 9

        mov al, dl

        ret
    randGen endp

    playSound proc
        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, sfx        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 25          ; Pause for duration of note.
        pause1:
        mov     cx, 65535
        pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.

        ret
    playSound endp
    
    startJump proc
        ;Ignores input if already jumping
        mov isCrouching, 0
        cmp jumping, 0
        jne exitJump

        ;Makes jump condition true
        mov jumping, 1
        mov sfx, 7000
        call playSound
        ;jmp clearBuffer
        exitJump:
        ret
    startJump endp

    moveRight proc
        cmp xpos_dino, 250
        jge dontMoveRight
        add xpos_dino, 4
        add xpos_dino_c, 4
        dontMoveRight:
        ret
    moveRight endp    

    moveLeft proc
        cmp xpos_dino, 10
        jle dontMoveLeft
        sub xpos_dino, 4
        sub xpos_dino_c, 4
        dontMoveLeft:
        ret
    moveLeft endp

    render_display proc       ;Beginning of procedure
	MOV BX, 10      ;Initializes divisor
	MOV DX, 0000H   ;Clears DX
	MOV CX, 0000H   ;Clears CX
    
	;_____________________________	
	;Splitting process starts here
	;=============================
	L1:  
	MOV DX, 0000H    ;Clears DX during jump
	div BX           ;Divides AX by BX
	PUSH DX          ;Pushes DX(remainder) to stack
	INC CX           ;Increments counter to track the number of digits
	CMP AX, 0        ;Checks if there is still something in AX to divide
	JNE L1           ;Jumps if AX is not zero
    
	L2:  
	POP DX          ;Pops from stack to DX
	ADD DX, 30H     ;Converts to it's ASCII equivalent
	MOV AH, 02H     
	INT 21H         ;calls DOS to render_display character
	LOOP L2         ;Loops till CX equals zero
	RET             ;returns control
	render_display  ENDP

	end main