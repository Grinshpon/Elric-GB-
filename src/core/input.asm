; down | up | left | right | start | select | b | a
SECTION "Data", WRAM0

OldInput: ds 1
Input: ds 1


SECTION "Input", ROM0

ReadInput:
  ld hl, $FF00
  ld [hl], $20
  ld a, 0
  ld a, [hl]
  cpl
  and $0F
  swap a
  ld c, a
  ld [hl], $10
  ld a, 0
  ld a, 0
  ld a, 0
  ld a, [hl]
  cpl
  and $0F
  add a, c

  ld [hl], $FF

  ld hl, Input
  ld b, [hl]
  ld [hl], a
  ld hl, OldInput
  ld [hl], b

  ret


