check_for_palette_updates:
  PHA
  LDA PALETTE_NEEDS_UPDATING
  BNE :+
  PLA
  rtl
: pla
  stz PALETTE_NEEDS_UPDATING

write_palette_data:
  PHX
  PHY
  PHA

  setAXY8
  PHK
  PLB

  LDA $00
  PHA
  LDA $01
  PHA

  LDA OPTIONS_PALETTE
  ASL
  TAY
  LDA palette_adddresses, Y
  STA $00
  LDA palette_adddresses + 1, Y
  STA $01

  LDX #$00
  STZ CURR_PALETTE_ADDR
  STZ CGADD

  ; lookup our 2 byte color from palette_lookup, color * 2
  ; Our palettes are written by writing to CGDATA
  ; PALETTE_UPDATE_START contains the first byte of palette data to update.
palette_entry:

  LDA PALETTE_UPDATE_START, X
  AND PALETTE_FILTER
  ASL A
  TAY
  LDA ($00), Y
  STA CGDATA
  INY
  LDA ($00), Y
  STA CGDATA

  LDA PALETTE_UPDATE_START + 1, X
  AND PALETTE_FILTER
  ASL A
  TAY 

  LDA ($00), Y
  STA CGDATA
  INY
  LDA ($00), Y
  STA CGDATA

  LDA PALETTE_UPDATE_START + 2, X
  AND PALETTE_FILTER
  ASL A
  TAY 

  LDA ($00), Y
  STA CGDATA
  INY
  LDA ($00), Y
  STA CGDATA

  LDA PALETTE_UPDATE_START + 3, X
  AND PALETTE_FILTER
  ASL A
  TAY 

  LDA ($00), Y
  STA CGDATA
  INY
  LDA ($00), Y
  STA CGDATA

  LDA CURR_PALETTE_ADDR
  CLC
  ADC #$10
  STA CGADD
  STA CURR_PALETTE_ADDR

  INX
  INX
  INX
  INX
  ; CPY #$10
  ; BNE palette_entry

  TXA
  AND #$0F
  CMP #$00
  BNE skip_writing_four_empties

  ; after 16 entries we write an empty set of palettes
  CLC
  LDA CURR_PALETTE_ADDR
  ADC #$40
  STA CGADD
  STA CURR_PALETTE_ADDR 

skip_writing_four_empties:
  CPX #$20
  BEQ :+
  jmp palette_entry
:


  LDA ACTIVE_NES_BANK
  INC A
  ORA #$A0
  PHA
  PLB
  
  PLA
  STA $01
  PLA 
  STA $00

  PLA
  PLY  
  PLX
  ; done after $20
  RTL
  
zero_all_palette_long:
  jsr zero_all_palette
  rtl

zero_all_palette:
  LDY #$00
  LDX #$02

  STZ CGADD

: STZ CGDATA
  DEY
  BNE :-
  DEX
  BNE :-

  RTS

snes_default_bg_palette:
.byte $00, $00, $FF, $7F, $7D, $12, $D6, $10, $B6, $0D, $33, $01, $04, $38, $C0, $03
.byte $40, $55, $26, $00, $00, $45, $20, $20, $1F, $7C, $6C, $74, $05, $58, $03, $1C
.byte $00, $00, $FF, $7F, $B5, $56, $29, $25, $3A, $30, $3A, $30, $FA, $33, $3A, $30
.byte $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30
.byte $00, $00, $FF, $7F, $B5, $56, $29, $25, $3A, $30, $3A, $30, $3A, $30, $3F, $7C
.byte $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30, $3A, $30
.byte $00, $00, $FF, $7F, $B5, $56, $29, $25, $1F, $0F, $18, $06, $D0, $04, $54, $42
.byte $3D, $0D, $7C, $6B, $DA, $0C, $6C, $04, $8F, $21, $B5, $11, $EC, $08, $66, $00

snes_sprite_palatte:
.byte $00, $00, $FF, $7F, $7D, $12, $D6, $10, $FF, $7F, $16, $6B, $AC, $3D, $DE, $32
.byte $97, $09, $7F, $13, $BA, $0A, $33, $01, $00, $00, $15, $35, $D0, $24, $68, $14
.byte $00, $00, $FF, $7F, $B5, $56, $29, $25, $74, $4A, $AE, $35, $08, $31, $0D, $59
.byte $6B, $2C, $F8, $4A, $DD, $7F, $17, $6B, $AB, $41, $1F, $0F, $18, $06, $2F, $05
.byte $00, $00, $FF, $7F, $B5, $56, $29, $25, $DD, $7F, $17, $6B, $AB, $41, $D7, $3E
.byte $94, $1D, $A7, $7E, $E4, $40, $9F, $43, $9E, $02, $BD, $00, $34, $00, $2B, $00
.byte $00, $00, $FF, $7F, $B5, $56, $29, $25, $CB, $49, $24, $31, $84, $14, $32, $00
.byte $29, $00, $5F, $33, $1C, $35, $FF, $7F, $9E, $02, $94, $11, $0E, $09, $88, $00

write_default_palettes_jsl:
  jsr write_default_palettes
  rtl

write_default_palettes:
  STZ CGADD
  LDY #$00
: LDA snes_default_bg_palette, y
  STA CGDATA
  INY
  CPY #$80
  BNE :-


  LDA #$80
  sta CGADD
  LDY #$00
: LDA snes_sprite_palatte, y
  STA CGDATA
  INY
  CPY #$80
  BNE :-
  rts

load_palette_for_level_long:
  jsr load_palette_for_level
  RTL

load_palette_for_level:
  PHB
  PHK
  PLB

  PHA
  PHY

  LDA $00
  PHA
  LDA $01
  PHA

  ; todo, if state == $0C (map) then check if prev level == current level
  ; if so load per level palette, otherwise load map palette
  ; this ensures we load the right palette for the first screen after the map
  LDA SYSTEM_STATE
  CMP #$0C
  BNE :+
    LDA PREV_LEVEL_INDEX
    CMP LEVEL_INDEX
    BEQ load_per_level_palette
    BRA load_per_system_state_palette
:
  CMP #$04
  BNE load_per_system_state_palette
    LDA $19 ; this is subsystem state, > 0 means we're loading level and not intro
    BEQ load_per_system_state_palette
    BRA load_per_level_palette

load_per_system_state_palette:
  LDA SYSTEM_STATE
  TAY
  LDA system_state_palettes, Y
  CMP #$FF ; Gameplay
  BNE palette_index_selected  
  
load_per_level_palette:
  LDA LEVEL_INDEX  
  ; ensure level index is within range, looping the game adds 18 to the level counter
: CMP #$13
  BCC :+
    SEC
    SBC #$13
    BRA :-
  :

  TAY
  LDA per_level_palettes, Y

palette_index_selected:
  STA TMP_CURR_LOADED_EXTENDED_PALETTE
  ASL A
  TAY
  PHY

  LDA snes_palette_adddresses, Y
  STA $00
  LDA snes_palette_adddresses + 1, Y
  STA $01

  STZ CGADD
  LDY #$00
: LDA ($00), y
  STA CGDATA
  INY
  CPY #$80
  BNE :-


  PLY
  LDA snes_sprite_palette_adddresses, Y
  STA $00
  LDA snes_sprite_palette_adddresses + 1, Y
  STA $01

  LDA #$80
  STA CGADD
  LDY #$00
: LDA ($00), y
  STA CGDATA
  INY
  CPY #$80
  BNE :-

  PLA 
  STA $01

  PLA
  STA $00

  PLY
  PLA
  PLB

  RTS

; $0018              System State
; 00 = Booting        ; 01 = Title Screen ; 02 = Demo Mode      ; 03 = Start Game;
; 04 = Introduction   ; 05 = Gameplay     ; 06 = Respawning     ; 07 = Game Over;
; 08 = Door Transition; 09 = Autowalk     ; 0a = Entering Castle; 0b = Autoclimb;
; 0c = Scoring & Map  ; 0d = Continue     ; 0e = Falling        ; 0f = Ending
system_state_palettes:
.byte $00, $00, $FF, $01
.byte $01, $FF, $FF, $01
.byte $FF, $FF, $01, $FF
.byte $09, $01, $FF, $0A

per_level_palettes:
.byte $02, $02, $02, $02 ; 0 - 3: level 1
.byte $03, $03, $03 ; 4 - 6 level 2
.byte $04, $04, $04 ; 7 - 9 level 3
.byte $05, $05, $05 ; 10 - 12 level 4
.byte $06, $06, $06 ; 13 - 15 level 5
.byte $07, $07 ; 16 - 17 level 6
.byte $08 ; 18 - Dracula
; extra
.byte $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03

snes_palette_adddresses:
.addr palette_0
.addr palette_1
.addr palette_2
.addr palette_3
.addr palette_4
.addr palette_5
.addr palette_6
.addr palette_7
.addr palette_8
.addr palette_9
.addr palette_10

snes_sprite_palette_adddresses:
.addr sprite_palette_0
.addr sprite_palette_1
.addr sprite_palette_2
.addr sprite_palette_3
.addr sprite_palette_4
.addr sprite_palette_5
.addr sprite_palette_6
.addr sprite_palette_7
.addr sprite_palette_8
.addr sprite_palette_9
.addr sprite_palette_10

.align 256
palette_0:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

; intro / ending
palette_1:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $7FFF, $0206, $0112, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $56B5, $3856, $125D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

; level 1 - 4 
palette_2:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

; level 5 - 7
palette_3:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

palette_4:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

palette_5:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

palette_6:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

palette_7:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

palette_8:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

palette_9:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

palette_10:
.word $0000, $006A, $44A0, $6D62, $0DB6, $0133, $3804, $03C0
.word $5540, $0026, $4500, $2020, $7C1F, $746C, $5805, $1C03
.word $0000, $0112, $318C, $200D, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $10B6, $000D, $2100, $781E, $781E, $781E, $781E
.word $781E, $781E, $781E, $781E, $781E, $781E, $781E, $781E
.word $0000, $7FFF, $361F, $10B6, $0AFE, $01F7, $00CE, $4654
.word $0D3D, $675B, $0CD9, $006C, $216F, $11B4, $04ED, $0067

.align 256
sprite_palette_0:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

; intro / ending
sprite_palette_1:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

; level 1 - 4 
sprite_palette_2:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

; level 5 - 7
sprite_palette_3:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

sprite_palette_4:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

sprite_palette_5:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

sprite_palette_6:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

sprite_palette_7:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

sprite_palette_8:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

sprite_palette_9:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 

sprite_palette_10:
.word $0000, $127D, $537E, $006A, $7FFF, $6B16, $3DAC, $32DE 
.word $0997, $137F, $0ABA, $0133, $0000, $3515, $24D0, $1468 
.word $0000, $7DD8, $7F1F, $0000, $4A74, $35AE, $3108, $590D 
.word $2C6B, $4AF8, $7FDD, $6B17, $41AB, $0F1F, $0618, $052F 
.word $0000, $537E, $6D62, $0000, $7FDD, $6B17, $41AB, $3ED7 
.word $1D94, $7EA7, $40E4, $439F, $029E, $00BD, $0034, $002B 
.word $0000, $10D6, $65BF, $0000, $49CB, $3124, $1484, $0032 
.word $0029, $335F, $351C, $7FFF, $029E, $1194, $090E, $0088 



; assumes CGADD is already set
; nes color is in A
store_nes_color_in_palette:
  PHX
  ASL A
  TAX
  LDA $A086E0, X ; palette_lookup, X
  STA CGDATA
  LDA $A086E1, X ; palette_lookup + 1, X
  STA CGDATA

  PLX
  RTL



write_option_palette:
    PHK
    PLB
    LDA RDNMI
:   LDA RDNMI
    BPL :-

    LDA OPTIONS_PALETTE
    ASL
    TAY
    LDA palette_adddresses, Y
    STA $00
    INY
    LDA palette_adddresses, Y
    STA $01
    
    LDY #$00

    LDA #$41
    STA CGADD
    LDX #$80
    LDY #$00

:   LDA ($00), Y
    STA CGDATA
    INY
    DEX
    BNE :-

    RTL

write_option_palette_from_indexes:
    PHK
    PLB
    LDA RDNMI
:   LDA RDNMI
    BPL :-

    STZ CGADD
    LDY #$00
    LDX #$00

    LDA OPTIONS_PALETTE
    ASL
    TAY
    LDA palette_adddresses, Y
    STA $00
    INY
    LDA palette_adddresses, Y
    STA $01
    
    LDY #$00
    
option_palette_loop:
    LDA default_options_bg_palette_indexes, X
    ASL A
    TAY

    LDA ($00), Y
    STA CGDATA
    INY

    LDA ($00), Y
    STA CGDATA    
    INY

    ; every 4 we need to write a bunch of empty palette entries
    INX
    TXA
    AND #$03
    BNE :+

    CLC
    LDA CURR_PALETTE_ADDR
    ADC #$10
    STA CGADD
    STA CURR_PALETTE_ADDR

:
    TXA
    AND #$0F
    CMP #$00
    BNE :+
    ; after 16 entries we write an empty set of palettes
    CLC
    LDA CURR_PALETTE_ADDR
    ADC #$40
    STA CGADD
    STA CURR_PALETTE_ADDR 

:
    CPX #$20
    BNE option_palette_loop
    rtl    

    
default_options_bg_palette_indexes:
.byte $0F, $10, $00, $17, $0F, $10, $16, $25, $0F, $01, $19, $09, $0F, $30, $26, $16

default_options_sprite_palette_indexes:
.byte $0F, $27, $37, $07, $0F, $23, $34, $0F, $0F, $37, $11, $0F, $0F, $16, $25, $0F

default_options_palette:
.byte $00, $00, $FF, $7F, $74, $64, $42, $50, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $F7, $02, $33, $01, $6A, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $29, $6F, $07, $02, $A0, $44, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $BF, $65, $8C, $31, $76, $3C, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

options_sprite_palette:
.byte $00, $00, $FF, $7F, $1F, $3A, $6A, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $78, $7F, $42, $50, $76, $3C, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $08, $7D, $D8, $7D, $78, $7F, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $0D, $00, $D6, $10, $9C, $4B, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

