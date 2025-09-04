# Castlevania SNES Port - Makefile equivalent of build.sh
# Works under MSYS2/MinGW (Windows) and Unix-like shells

# --------------------------------------------------------------------
# Toolchain detection
# --------------------------------------------------------------------
CA65 := $(shell which ca65 2>/dev/null)
LD65 := $(shell which ld65 2>/dev/null)
GO   := $(shell which go 2>/dev/null)
EMU  := $(shell which Mesen-S 2>/dev/null || which higan 2>/dev/null || which snes9x 2>/dev/null)
ASAR := $(shell which asar 2>/dev/null || echo ./resources/asar.exe)

ifeq ($(CA65),)
$(error "ca65 not found in PATH. Please install cc65 and ensure ca65 is available.")
endif
ifeq ($(LD65),)
$(error "ld65 not found in PATH. Please install cc65 and ensure ld65 is available.")
endif
ifeq ($(GO),)
$(error "Go compiler not found in PATH. Please install Go (https://go.dev/dl/).")
endif

# --------------------------------------------------------------------
# Project variables
# --------------------------------------------------------------------
GAME      := Castlevania
SRCDIR    := src
OUTDIR    := out
ARCHIVE   := $(OUTDIR)/buildarchive
LINKCFG   := $(SRCDIR)/hirom.cfg   # build.sh uses hirom.cfg

# --------------------------------------------------------------------
# Phony targets
# --------------------------------------------------------------------
.PHONY: all clean run archive update-wram regen-banks spc

# --------------------------------------------------------------------
# Default target: full two-pass build + archive
# --------------------------------------------------------------------
all: $(OUTDIR)/$(GAME).sfc archive

# If spc.bin doesn't exist yet, auto-build it during all
ifeq ($(wildcard $(SRCDIR)/spc/spc.bin),)
all: spc
endif

# --------------------------------------------------------------------
# Asset generation via Go utilities
# --------------------------------------------------------------------

# Options assets
$(SRCDIR)/options.bin $(SRCDIR)/options_macro_defs.asm:
	$(GO) run utilities/generate_options_asm.go
	mv options.bin $(SRCDIR)/options.bin
	mv options_macro_defs.asm $(SRCDIR)/options_macro_defs.asm

# Tilemap assets
$(SRCDIR)/pause-bg2.bin $(SRCDIR)/msu1-credits.bin:
	$(GO) run utilities/generate_tilemaps.go
	mv pause-bg2.bin $(SRCDIR)/pause-bg2.bin
	mv msu1-credits.bin $(SRCDIR)/msu1-credits.bin

# Ensure WRAM routines file exists for first build (empty placeholder)
$(SRCDIR)/wram_routines.bin:
	@test -f $@ || (echo "Creating empty wram_routines.bin"; touch $@)

# --------------------------------------------------------------------
# Build rules
# --------------------------------------------------------------------

# Assemble main.asm (first pass)
$(OUTDIR)/main.o: $(SRCDIR)/main.asm \
                  $(SRCDIR)/options.bin \
                  $(SRCDIR)/options_macro_defs.asm \
                  $(SRCDIR)/pause-bg2.bin \
                  $(SRCDIR)/msu1-credits.bin \
                  $(SRCDIR)/wram_routines.bin | $(OUTDIR)
	$(CA65) $(SRCDIR)/main.asm -o $@ -g

# First link pass
$(OUTDIR)/first-pass.sfc: $(OUTDIR)/main.o
	$(LD65) -C $(LINKCFG) -o $@ $(OUTDIR)/main.o

# Update WRAM routines after first pass (overwrite placeholder)
update-wram: $(OUTDIR)/first-pass.sfc
	dd if=$< of=$(SRCDIR)/wram_routines.bin bs=1 skip=$$((0x1800)) count=$$((0x800))

# Final ROM (depends on updated WRAM)
$(OUTDIR)/$(GAME).sfc: update-wram
	$(CA65) $(SRCDIR)/main.asm -o $(OUTDIR)/main.o -g
	$(LD65) -C $(LINKCFG) -o $@ $(OUTDIR)/main.o

# --------------------------------------------------------------------
# Archiving and running
# --------------------------------------------------------------------

archive: $(OUTDIR)/$(GAME).sfc
	@mkdir -p $(ARCHIVE)
	@TIMESTAMP=$$(date '+%Y%m%d%H%M%S'); \
	FILENAME="$(ARCHIVE)/$(GAME)-$$TIMESTAMP.sfc"; \
	cp $(OUTDIR)/$(GAME).sfc $$FILENAME; \
	echo "Archived to: $$FILENAME"

run: $(OUTDIR)/$(GAME).sfc
ifneq ($(EMU),)
	@echo "Launching emulator: $(EMU)"
	$(EMU) $(OUTDIR)/$(GAME).sfc
else
	@echo "No supported SNES emulator found in PATH."
	@echo "Please install one of: Mesen-S (recommended), Higan, or Snes9x."
endif

# --------------------------------------------------------------------
# Optional: regenerate NES banks if source ROM changes
# --------------------------------------------------------------------
regen-banks:
	$(GO) run utilities/parseNesFileToBanks.go
	mv bank*.asm $(SRCDIR)/ || true
	mv tile_bank*.asm $(SRCDIR)/ || true
	@echo "Regenerated bank and tile_bank ASM files from NES ROM."

# --------------------------------------------------------------------
# Optional: SPC build using asar
# --------------------------------------------------------------------
spc: $(SRCDIR)/spc/spc.bin

$(SRCDIR)/spc/spc.bin: $(SRCDIR)/spc/spc.asm
	@if [ ! -x "$(ASAR)" ]; then \
		echo "Error: asar not found (expected in PATH or ./resources/asar.exe)."; \
		echo "Please install asar or place asar.exe in ./resources/"; \
		exit 1; \
	fi
	$(ASAR) $< $@
	@echo "Built SPC binary: $@"

# --------------------------------------------------------------------
# Housekeeping
# --------------------------------------------------------------------

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -rf $(OUTDIR) \
	       $(SRCDIR)/options.bin \
	       $(SRCDIR)/options_macro_defs.asm \
	       $(SRCDIR)/pause-bg2.bin \
	       $(SRCDIR)/msu1-credits.bin \
	       $(SRCDIR)/wram_routines.bin \
	       $(SRCDIR)/spc/spc.bin
