.segment "PRGB5"; Bank 4


; 8000 - bank 4


; sub-area starting locations
; the first one is actually negative garbage but it's never on screen
stage_0_ptr:
.addr $7FF2 ; Stage 0 - outdoors - reads garbage for 24 bytes before actual level data
stage_1_ptr:
.addr $8082 ; Stage 1 - entry
stage_2_ptr:
.addr $8292 ; stage 2 - sub area 0 - waterway
.addr $81a2 ; stage 2 - sub area 1 - over waterway
stage_3_ptr:
.addr $8202 ; stage 3 - Bat Boss

level_1_layout:
.incbin "./level-layouts/level-1/level-layout.bin"
level_1_layout_end:

level_1_tile_groups:
.incbin "./level-layouts/level-1/tile-groups.bin"
level_1_tile_groups_end:
 
 ; sub area starting locations for lvl 2

.addr $880D
.addr $88FD
.addr $886D
.addr $8A7D
.addr $89ED
.addr $895D

level_2_layout:
.incbin "./level-layouts/level-2/level-layout.bin"
level_2_layout_end:
level_2_tile_groups:
.incbin "./level-layouts/level-2/tile-groups.bin"
level_2_tile_groups_end:


.byte $AE, $8D, $3E, $8E
.byte $CE, $8E, $2E, $8F, $1E, $90

level_3_layout:
.incbin "./level-layouts/level-3/level-layout.bin"
level_3_layout_end:

level_3_tile_groups:
.incbin "./level-layouts/level-3/tile-groups.bin"
level_3_tile_groups_end:

.byte $43, $94, $43, $94, $63, $95, $83, $96

level_4_layout:
.incbin "./level-layouts/level-4/level-layout.bin"
level_4_layout_end:

level_4_tile_groups:
.incbin "./level-layouts/level-4/tile-groups.bin"
level_4_tile_groups_end:

.byte $29, $9B, $89, $9B, $B9, $9B, $09, $9D, $49, $9C, $F9
.byte $9D

level_5_layout:
.incbin "./level-layouts/level-5/level-layout.bin"
level_5_layout_end:

level_5_tile_groups:
.incbin "./level-layouts/level-5/tile-groups.bin"
level_5_tile_groups_end:

; A200 - bank 4
.byte $7F, $A2, $EF, $A1, $FF, $A3

level_6_layout:
.incbin "./level-layouts/level-6/level-layout.bin"
level_6_layout_end:

level_6_tile_groups:
.incbin "./level-layouts/level-6/tile-groups.bin"
level_6_tile_groups_end:

; A900 - bank 4
.byte $BC, $A8, $4C, $A9

level_drac_layout:
.incbin "./level-layouts/dracula/level-layout.bin"
level_drac_layout_end:

level_drac_tile_groups:
.incbin "./level-layouts/dracula/tile-groups.bin"
level_drac_tile_groups_end:


.byte $CA, $AC, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D
.byte $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D


; AD00 - bank 4
.byte $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D, $2D
.byte $2D, $2D, $00, $01, $01, $01, $02, $2D, $03, $04, $05, $06, $07, $2D, $03, $08
.byte $09, $0A, $0B, $2D, $0C, $0D, $0E, $0F, $10, $2D, $0C, $04, $11, $12, $07, $2D
.byte $13, $14, $15, $16, $07, $2D, $17, $18, $19, $1A, $0B, $2D, $1B, $1C, $1D, $1E
.byte $0B, $2D, $03, $1F, $20, $21, $22, $2D, $0C, $23, $24, $25, $07, $2D, $03, $26
.byte $27, $28, $07, $2D, $29, $2A, $2B, $2B, $2C, $2D, $55, $00, $00, $00, $00, $00
.byte $00, $00, $00, $30, $31, $32, $33, $3B, $34, $34, $34, $55, $42, $34, $34, $34
.byte $44, $34, $34, $34, $43, $45, $34, $34, $42, $34, $34, $34, $55, $42, $34, $34
.byte $66, $44, $34, $34, $6D, $42, $34, $72, $34, $43, $73, $74, $75, $55, $00, $00
.byte $00, $00, $00, $00, $00, $00, $32, $33, $32, $67, $34, $34, $34, $34, $55, $34
.byte $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $55
.byte $34, $34, $34, $34, $34, $34, $34, $86, $34, $34, $34, $6B, $34, $34, $34, $3D
.byte $55, $34, $34, $34, $3E, $34, $34, $34, $00, $34, $34, $34, $6E, $34, $34, $34
.byte $41, $55, $67, $67, $50, $6E, $34, $34, $34, $34, $34, $72, $34, $34, $2B, $74
.byte $62, $75, $55, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $38, $34
.byte $38, $39, $48, $55, $34, $48, $49, $3A, $36, $3A, $4A, $7C, $34, $34, $4C, $4D


; AE00 - bank 4
.byte $34, $34, $5C, $5D, $55, $00, $00, $00, $55, $00, $00, $00, $6F, $00, $00, $00
.byte $00, $34, $34, $34, $6B, $55, $00, $00, $00, $00, $53, $50, $6E, $6E, $34, $34
.byte $34, $72, $62, $75, $2B, $74, $55, $00, $00, $00, $00, $00, $00, $00, $00, $50
.byte $51, $7C, $51, $34, $34, $34, $34, $55, $34, $34, $34, $34, $34, $34, $34, $37
.byte $39, $34, $46, $47, $49, $34, $34, $34, $55, $3B, $3D, $3C, $3D, $7C, $34, $3C
.byte $3C, $4E, $34, $36, $3E, $5E, $7C, $3E, $3E, $55, $2D, $77, $7C, $7C, $6F, $35
.byte $34, $34, $00, $00, $6F, $6F, $34, $34, $77, $34, $55, $34, $34, $77, $00, $7C
.byte $7C, $67, $67, $34, $34, $69, $34, $74, $75, $75, $62, $55, $3C, $3C, $3C, $3C
.byte $3C, $3C, $3C, $3C, $48, $49, $34, $34, $3A, $3B, $34, $34, $55, $7D, $00, $36
.byte $3D, $77, $7C, $7C, $68, $28, $4D, $4E, $52, $5C, $5D, $29, $2A, $55, $00, $00
.byte $00, $00, $00, $00, $00, $00, $50, $53, $54, $55, $34, $58, $59, $49, $55, $77
.byte $78, $79, $7A, $34, $7F, $6A, $7F, $34, $77, $6C, $6D, $34, $34, $34, $34, $55
.byte $4B, $22, $23, $34, $5C, $5D, $4F, $34, $7F, $00, $3E, $34, $41, $00, $3E, $34
.byte $55, $77, $00, $00, $34, $77, $00, $42, $34, $48, $00, $00, $36, $3A, $00, $00
.byte $00, $55, $00, $00, $00, $00, $00, $00, $00, $00, $34, $55, $56, $34, $38, $5A
.byte $5B, $5F, $55, $55, $7C, $7C, $7D, $3C, $34, $34, $77, $7F, $34, $34, $77, $34


; AF00 - bank 4
.byte $6E, $6F, $2A, $55, $34, $41, $00, $3F, $34, $41, $00, $83, $34, $41, $00, $83
.byte $34, $77, $00, $42, $55, $34, $77, $00, $43, $34, $48, $00, $00, $6F, $00, $00
.byte $00, $00, $00, $00, $00, $55, $00, $00, $00, $00, $00, $00, $00, $00, $50, $50
.byte $51, $7C, $76, $34, $34, $34, $55, $00, $7E, $34, $34, $6A, $3C, $3C, $3C, $3C
.byte $3C, $3C, $3C, $6A, $34, $34, $7F, $55, $6C, $34, $34, $77, $34, $34, $34, $34
.byte $34, $34, $34, $3D, $34, $34, $34, $00, $55, $34, $34, $86, $00, $6F, $3C, $77
.byte $34, $00, $00, $00, $00, $00, $00, $00, $00, $55, $34, $34, $34, $34, $36, $34
.byte $34, $34, $60, $22, $23, $36, $61, $5D, $63, $34, $55, $6C, $00, $64, $34, $41
.byte $00, $00, $00, $3D, $00, $00, $34, $00, $00, $00, $34, $55, $00, $00, $00, $27
.byte $34, $34, $34, $5C, $00, $00, $00, $00, $00, $3E, $00, $00, $55, $00, $00, $3E
.byte $51, $6E, $6A, $71, $34, $34, $34, $34, $72, $75, $75, $2B, $74, $55, $34, $34
.byte $34, $34, $81, $34, $34, $34, $80, $34, $81, $34, $00, $65, $80, $36, $55, $55
.byte $7A, $55, $55, $00, $6F, $6F, $34, $34, $34, $77, $6F, $34, $6F, $35, $00, $55
.byte $4D, $26, $00, $00, $5D, $4F, $00, $00, $00, $00, $00, $00, $00, $00, $3E, $6A
.byte $55, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $3D, $34, $34
.byte $34, $55, $00, $34, $34, $34, $83, $34, $34, $34, $82, $34, $34, $34, $36, $3D


; B000 - bank 4
.byte $34, $34, $55, $3D, $3E, $34, $34, $00, $6A, $34, $34, $6A, $34, $34, $34, $34
.byte $34, $34, $34, $55, $00, $00, $00, $00, $00, $00, $00, $00, $8D, $8E, $8F, $00
.byte $2E, $8E, $2F, $00, $55, $34, $2E, $8E, $8F, $34, $34, $87, $8C, $34, $34, $34
.byte $85, $34, $34, $34, $85, $55, $34, $34, $34, $85, $34, $34, $34, $85, $34, $34
.byte $34, $84, $34, $34, $34, $70, $55, $36, $34, $34, $70, $53, $69, $34, $85, $34
.byte $72, $34, $84, $2B, $74, $73, $73, $55, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $52, $B0, $01, $18, $18, $18, $18, $03
.byte $01, $18, $18, $18, $18, $03, $01, $18, $18, $18, $18, $03, $01, $18, $18, $18
.byte $18, $03, $01, $18, $18, $18, $18, $03, $01, $18, $18, $18, $18, $03, $01, $18
.byte $18, $18, $18, $03, $01, $18, $18, $18, $18, $03, $01, $18, $18, $18, $02, $03
.byte $01, $27, $18, $31, $02, $03, $01, $28, $2E, $32, $02, $03, $01, $29, $2F, $33
.byte $02, $03, $01, $2A, $30, $34, $02, $03, $01, $2B, $18, $35, $02, $03, $01, $2C
.byte $18, $36, $02, $03, $01, $2D, $18, $37, $02, $03, $01, $08, $10, $18, $02, $03
.byte $02, $09, $11, $19, $20, $03, $03, $0A, $12, $1A, $21, $03, $04, $0B, $13, $1B
.byte $22, $03, $05, $0C, $14, $1C, $23, $03, $06, $0D, $15, $1D, $24, $03, $07, $0E
.byte $16, $1E, $25, $03, $01, $0F, $17, $1F, $26, $03, $55, $00, $00, $00, $00, $00


; B100 - bank 4
.byte $00, $00, $00, $30, $31, $32, $33, $3B, $34, $34, $34, $55, $42, $34, $34, $34
.byte $44, $34, $34, $34, $43, $45, $34, $34, $42, $34, $34, $34, $55, $42, $34, $34
.byte $66, $44, $34, $34, $6D, $42, $34, $72, $34, $43, $73, $74, $75, $55, $00, $00
.byte $00, $00, $00, $00, $00, $00, $32, $33, $32, $67, $34, $34, $34, $34, $55, $34
.byte $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $55
.byte $34, $34, $34, $34, $34, $34, $34, $86, $34, $34, $34, $6B, $34, $34, $34, $3D
.byte $55, $34, $34, $34, $3E, $34, $34, $34, $00, $34, $34, $34, $6E, $34, $34, $34
.byte $41, $55, $67, $67, $50, $6E, $34, $34, $34, $34, $34, $72, $34, $34, $2B, $74
.byte $62, $75, $55, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $38, $34
.byte $38, $39, $48, $55, $34, $48, $49, $3A, $36, $3A, $4A, $7C, $34, $34, $4C, $4D
.byte $34, $34, $5C, $5D, $55, $00, $00, $00, $55, $00, $00, $00, $6F, $00, $00, $00
.byte $00, $34, $34, $34, $6B, $55, $00, $00, $00, $00, $53, $50, $6E, $6E, $34, $34
.byte $34, $72, $62, $75, $2B, $74, $55, $00, $00, $00, $00, $00, $00, $00, $00, $50
.byte $51, $7C, $51, $34, $34, $34, $34, $55, $34, $34, $34, $34, $34, $34, $34, $37
.byte $39, $34, $46, $47, $49, $34, $34, $34, $55, $3B, $3D, $3C, $3D, $7C, $34, $3C
.byte $3C, $4E, $34, $36, $3E, $5E, $7C, $3E, $3E, $55, $2D, $77, $7C, $7C, $6F, $35


; B200 - bank 4
.byte $34, $34, $00, $00, $6F, $6F, $34, $34, $77, $34, $55, $34, $34, $77, $00, $7C
.byte $7C, $67, $67, $34, $34, $69, $34, $74, $75, $75, $62, $55, $3C, $3C, $3C, $3C
.byte $3C, $3C, $3C, $3C, $48, $49, $34, $34, $3A, $3B, $34, $34, $55, $7D, $00, $36
.byte $3D, $77, $7C, $7C, $68, $28, $4D, $4E, $52, $5C, $5D, $29, $2A, $55, $00, $00
.byte $00, $00, $00, $00, $00, $00, $50, $53, $54, $55, $34, $58, $59, $49, $55, $77
.byte $78, $79, $7A, $34, $7F, $6A, $7F, $34, $77, $6C, $6D, $34, $34, $34, $34, $55
.byte $4B, $22, $23, $34, $5C, $5D, $4F, $34, $7F, $00, $3E, $34, $41, $00, $3E, $34
.byte $55, $77, $00, $00, $34, $77, $00, $42, $34, $48, $00, $00, $36, $3A, $00, $00
.byte $00, $55, $00, $00, $00, $00, $00, $00, $00, $00, $34, $55, $56, $34, $38, $5A
.byte $5B, $5F, $55, $55, $7C, $7C, $7D, $3C, $34, $34, $77, $7F, $34, $34, $77, $34
.byte $6E, $6F, $2A, $55, $34, $41, $00, $3F, $34, $41, $00, $83, $34, $41, $00, $83
.byte $34, $77, $00, $42, $55, $34, $77, $00, $43, $34, $48, $00, $00, $6F, $00, $00
.byte $00, $00, $00, $00, $00, $55, $00, $00, $00, $00, $00, $00, $00, $00, $50, $50
.byte $51, $7C, $76, $34, $34, $34, $55, $00, $7E, $34, $34, $6A, $3C, $3C, $3C, $3C
.byte $3C, $3C, $3C, $6A, $34, $34, $7F, $55, $6C, $34, $34, $77, $34, $34, $34, $34
.byte $34, $34, $34, $3D, $34, $34, $34, $00, $55, $34, $34, $86, $00, $6F, $3C, $77


; B300 - bank 4
.byte $34, $00, $00, $00, $00, $00, $00, $00, $00, $55, $34, $34, $34, $34, $36, $34
.byte $34, $34, $60, $22, $23, $36, $61, $5D, $63, $34, $55, $6C, $00, $64, $34, $41
.byte $00, $00, $00, $3D, $00, $00, $34, $00, $00, $00, $34, $55, $00, $00, $00, $27
.byte $34, $34, $34, $5C, $00, $00, $00, $00, $00, $3E, $00, $00, $55, $00, $00, $3E
.byte $51, $6E, $6A, $71, $34, $34, $34, $34, $72, $75, $75, $2B, $74, $55, $34, $34
.byte $34, $34, $81, $34, $34, $34, $80, $34, $81, $34, $00, $65, $80, $36, $55, $55
.byte $7A, $55, $55, $00, $6F, $6F, $34, $34, $34, $77, $6F, $34, $6F, $35, $00, $55
.byte $4D, $26, $00, $00, $5D, $4F, $00, $00, $00, $00, $00, $00, $00, $00, $3E, $6A
.byte $55, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $34, $3D, $34, $34
.byte $34, $55, $00, $34, $34, $34, $83, $34, $34, $34, $82, $34, $34, $34, $36, $3D
.byte $34, $34, $55, $3D, $3E, $34, $34, $00, $6A, $34, $34, $6A, $34, $34, $34, $34
.byte $34, $34, $34, $55, $00, $00, $00, $00, $00, $00, $00, $00, $8D, $8E, $8F, $00
.byte $2E, $8E, $2F, $00, $55, $34, $2E, $8E, $8F, $34, $34, $87, $8C, $34, $34, $34
.byte $85, $34, $34, $34, $85, $55, $34, $34, $34, $85, $34, $34, $34, $85, $34, $34
.byte $34, $84, $34, $34, $34, $70, $55, $36, $34, $34, $70, $53, $69, $34, $85, $34
.byte $72, $34, $84, $2B, $74, $73, $73, $55, $00, $00, $00, $00, $00, $00, $00, $00


; B400 - bank 4
.byte $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; B500 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; B600 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; B700 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; B800 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; B900 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; BA00 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; BB00 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; BC00 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; BD00 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; BE00 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


; BF00 - bank 4
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

.segment "PRGB5C"
fixedb5:
.include "bank7.asm"
fixedb5_end: