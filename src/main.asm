INCLUDE "hardware.inc"
INCLUDE "title.inc"

SECTION "Header", ROM0[$100]
EntryPoint:
  di
  jp Start ;

REPT $150 - $104
  db 0
ENDR


SECTION "Game code", ROM0

Start:
  ; turn off LCD
  call WaitVBlank
  xor a ; ld a,0
  ld [rLCDC], a

  call ClearSCR

  ld hl, $9000 + 16
  ld de, TitleTile3
  call MCFV

  ld hl, $9000 + 32
  ld de, TitleTile4
  call MCFV

  ld hl, $9000 + 48
  ld de, TitleTile2
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 64
  ld de, TitleTile5
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 80
  ld de, TitleTile6
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 96
  ld de, TitleTile7
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 112
  ld de, TitleTile8
  call MCFV

  ld hl, $9000 + 128
  ld de, TitleTile9
  call MCFV

  ld hl, $9000 + 144 ; in the C top row
  ld de, TitleTile10
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 160 ; in the C top row
  ld de, TitleTile11
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 176
  ld de, TitleTile12
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 192
  ld de, TitleTile13
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 208
  ld de, TitleTile1
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 224; dot under C
  ld [hl], $20
  inc hl
  ld [hl], $20

  ld hl, $9000 + 240
  ld de, TitleTile14
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 256
  ld de, TitleTile15
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 272
  ld de, TitleTile16
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 288
  ld de, TitleTile17
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 304 + 14 ; dot for R leg
  ld [hl], $80
  inc hl
  ld [hl], $80

  ld hl, $9000 + 320
  ld de, TitleTile3
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 336
  ld de, TitleTile4
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 352
  ld de, TitleTile2
  call MCFV

  ld hl, $9000 + 368
  ld de, TitleTile18
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 384
  ld de, TitleTile19
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 400
  ld de, TitleTile8
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 416
  ld de, TitleTile9
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 432
  ld de, TitleTile10
  call MCFV

  ld hl, $9000 + 448
  ld de, TitleTile11
  call MCFV

  ld hl, $9000 + 464
  ld de, TitleTile12
  call MCFV

  ld hl, $9000 + 480
  ld de, TitleTile20
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 496 + 14
  ld [hl], $20
  inc hl
  ld [hl], $20

  ld hl, $9820 + 2;harcoded title for now, will optimize later (maybe) todo: add some animation
  ld a, 1
.loop
  ld [hli], a
  inc a
  cp a, 4
  jr nz, .loop
  ld [hl], 1
  inc hl
  ld [hl], 4
  inc hl
  inc hl
  ld [hl], 1
  inc hl
  ld [hl], 2
  inc hl

  ld a, 5
.loop1
  ld [hli], a
  inc a
  cp a, 13
  jr nz, .loop1
  ld hl, $9840 + 2
  ld [hli], a
  inc hl
  inc hl
  ld [hli], a
  inc hl
  inc hl
  ld [hli], a
  inc hl
  ld [hli], a
  inc hl
  ld [hli], a
  inc hl
  ld [hli], a
  inc hl
  inc hl
  ld [hl], 14
  ld hl, $9860 + 2
  ld [hli], a
  ld [hl], 15
  inc hl
  ld [hl], 16
  inc hl
  ld [hli], a
  inc hl
  inc hl
  ld [hli], a
  ld [hl], 15
  inc hl
  ld [hl], 17
  inc hl
  inc hl
  ld [hli], a
  inc hl
  ld [hl], 13
  ld hl, $9880 + 2
  ld [hli], a
  inc hl
  inc hl
  ld [hli], a
  inc hl
  inc hl
  ld [hli], a
  inc hl
  ld [hl], 18
  inc hl
  ld [hl], 19
  inc hl
  ld [hli], a
  inc hl
  ld [hli], a
  inc hl
  inc hl
  ld [hl], 31
  ld hl, $98A0 + 2

  ld b, 2
.loop3
  ld a, 20
.loop2
  ld [hli], a
  inc a
  cp a, 23
  jr nz, .loop2
  dec b
  jr nz, .loop3
  ld [hl], 20
  inc hl
  inc hl
.loop4
  ld [hli], a
  inc a
  cp a, 31
  jr nz, .loop4

  ; init display registers
  ld a, %00011011 ;%11100100
  ld [rBGP], a

  xor a; ld a, 0
  ;ld a, $40 ; move tile since other way produces duplicate tile
  ld [rSCY], a
  ;ld a, $20
  ld [rSCX], a

  ; shut sound down
  ld [rNR52], a

  ; turn screen on, display background
  ld a, %10000001
  ld [rLCDC], a

  ; lock up
.mainloop
  call ReadInput
  ld hl, Input
  bit 3, [hl] ; start
  jr z, .mainloop
  call WaitVBlank
;  xor a
;  ld [rLCDC], a
  call SClear
;  ld a, %10000001
;  ld [rLCDC], a
  jr .mainloop


SECTION "Util", ROM0

WaitVBlank:
  ld a, [rLY]
  cp 144 ; check if LCD is past VBlank
  jr c, WaitVBlank
  ret

MemCpy:
  ; @param hl - destination
  ; @param de - source  (pointer to object being copied)
  ; @param bc - size of source input (in bytes)
  ld a, [de]
  ld [hli], a
  inc de
  dec bc
  ld a, b ; check if count is zero
  or c
  jr nz, MemCpy
  ret

MCFV: ; memcpy for background tiles, flipped vertically
  ; @param hl - destination
  ; @param de - source  (pointer to object being copied)
  ld b, 15
  ld a, e
  add a, b
  ld e, a
  ld a, d
  adc a, 0
  ld d, a
  inc b
.recurseMCFV
  ld a, [de]
  ld [hli], a
  dec de
  dec b
  jr nz, .recurseMCFV
  ret

; MCFH: ; memcpy for background tiles, flipped horizontally
;   ; @param hl - dest
;   ; @param de - src
;   ld b, 7
; .recurseMCFH
;   inc de
;   ld a, [de]
;   call MirrorByte
;   ld [hli], a
;   dec de
;   ld a, [de]
;   call MirrorByte
;   ld [hli], a
;   inc de
;   inc de
;   dec b
;   jr nz, .recurseMCFH
;   ret

ClearSCR:
  ld hl, $9800
  ld bc, $3FF ; $9BFF - $9800 ; 1023
.clrLoop
  xor a ; ld a, 0
  ld [hli], a
  dec bc
  ld a, b
  or c
  jr nz, .clrLoop
  ret

SClear: ; like ClearSCR but runs outside initial loop
  ld hl, $9800
  ld bc, $3FF
.clrLoop
  xor a
  call WaitVBlank
  ld [hli], a
  dec bc
  ld a,b
  or c
  jr nz, .clrLoop
  ret
