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
