.SEGMENT "LEVEL_1_LAYOUT"
.include "./level-1/palette.asm"
.include "./level-1/level-layout.bin"
; end marker
.byte $FF, $FF, $FF, $FF, $FF, $FF
.include "./level-1/tile-groups.bin"

.SEGMENT "LEVEL_2_LAYOUT"
.include "./level-2/palette.asm"
.include "./level-2/level-layout.bin"
; end marker
.byte $FF, $FF, $FF, $FF, $FF, $FF
.include "./level-2/tile-groups.bin"

.SEGMENT "LEVEL_3_LAYOUT"

.include "./level-3/palette.asm"
.include "./level-3/level-layout.bin"
; end marker
.byte $FF, $FF, $FF, $FF, $FF, $FF
.include "./level-3/tile-groups.bin"

.SEGMENT "LEVEL_4_LAYOUT"
.include "./level-4/palette.asm"
.include "./level-4/level-layout.bin"
; end marker
.byte $FF, $FF, $FF, $FF, $FF, $FF
.include "./level-4/tile-groups.bin"

.SEGMENT "LEVEL_5_LAYOUT"
.include "./level-5/palette.asm"
.include "./level-5/level-layout.bin"
; end marker
.byte $FF, $FF, $FF, $FF, $FF, $FF
.include "./level-5/tile-groups.bin"

.SEGMENT "LEVEL_6_LAYOUT"
.include "./level-6/palette.asm"
.include "./level-6/level-layout.bin"
; end marker
.byte $FF, $FF, $FF, $FF, $FF, $FF
.include "./level-6/tile-groups.bin"

.SEGMENT "LEVEL_DRAC_LAYOUT"
.include "./dracula/palette.asm"
.include "./dracula/level-layout.bin"
; end marker
.byte $FF, $FF, $FF, $FF, $FF, $FF
.include "./dracula/tile-groups.bin"