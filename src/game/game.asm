INCLUDE "ui.inc"

SECTION "Game Data", WRAM0

Health:
  ds 1


SECTION "Game", ROM0

GameStart:
  call Init
GameLoop:
  call DrawHealthBar
  ; ...

  jr GameLoop

Init:
  ld hl, Health
  ld [hl], $FF
  ; ...
  call LoadData
  ret

LoadData:
  call WaitVBlank
  xor a
  ld [rLCDC], a

  ld hl, $9000 + 16
  ld de, HPFull
  ld bc, 16
  call MemCpy

  ld hl, $9000 + 32
  ld de, HPHalf
  ld bc, 16
  call MemCpy

  ; ...

  ld a, %10000001
  ld [rLCDC], a
  ret

DrawHealthBar:
  ; ...
  ret
