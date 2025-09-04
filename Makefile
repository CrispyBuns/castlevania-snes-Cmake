# --------------------------------------------------------------------
# Rumbleminzie's SNES Castlevania Port - Makefile
# --------------------------------------------------------------------

# Detect platform
UNAME_S := $(shell uname -s)
IS_MSYS := $(findstring MINGW,$(UNAME_S))
EXE_SUFFIX :=
ifeq ($(IS_MSYS),MINGW)
	EXE_SUFFIX := .exe
endif

# Detecting executables (must be in PATH)
CC65 := $(shell which cc65$(EXE_SUFFIX) 2>/dev/null)
CA65 := $(shell which ca65$(EXE_SUFFIX) 2>/dev/null)
LD65 := $(shell which ld65$(EXE_SUFFIX) 2>/dev/null)
ASAR := $(shell which asar$(EXE_SUFFIX) 2>/dev/null)
GO   := $(shell which go$(EXE_SUFFIX) 2>/dev/null)
EMU  := $(shell which Mesen-S$(EXE_SUFFIX) 2>/dev/null || which higan$(EXE_SUFFIX) 2>/dev/null || which snes9x$(EXE_SUFFIX) 2>/dev/null)

# Check required tools
ifeq ($(CA65),)
$(error "ca65 not found in PATH")
endif
ifeq ($(LD65),)
$(error "ld65 not found in PATH")
endif
ifeq ($(GO),)
$(error "go not found in PATH")
endif

# Project variables
GAME := Castlevania
OUTDIR := out
SRCDIR := src
TIMEROM := $(OUTDIR)/buildarchive
SPC_BIN := $(SRCDIR)/spc/spc.bin

.PHONY: all clean run archive extract_wram rebuild_wram spc

# --------------------------------------------------------------------
# Default target: full two-pass build + archive
# --------------------------------------------------------------------
all: spc $(OUTDIR)/$(GAME).sfc archive

# Create output and archive directories
$(OUTDIR):
	mkdir -p $(OUTDIR)
	mkdir -p $(TIMEROM)

# Generate options and macro defs via Go
$(SRCDIR)/options.bin $(SRCDIR)/options_macro_defs.asm:
	$(GO) run utilities/generate_options_asm.go
	mv options.bin $(SRCDIR)/options.bin
	mv options_macro_defs.asm $(SRCDIR)/options_macro_defs.asm

# Generate tilemaps via Go
$(SRCDIR)/pause-bg2.bin $(SRCDIR)/msu1-credits.bin:
	$(GO) run utilities/generate_tilemaps.go
	mv pause-bg2.bin $(SRCDIR)/pause-bg2.bin
	mv msu1-credits.bin $(SRCDIR)/msu1-credits.bin

# Assemble SPC if asar is available
spc: $(SPC_BIN)

$(SPC_BIN): $(SRCDIR)/spc/spc.asm
ifeq ($(ASAR),)
	@echo "asar not found in PATH, skipping SPC build"
	@touch $(SPC_BIN)
else
	@echo "Building SPC binary..."
	$(ASAR) $< $@
	@echo "Built SPC binary: $@"
endif

# Ensure WRAM routines exist on first build
$(SRCDIR)/wram_routines.bin:
	@echo "Creating empty wram_routines.bin for first build"
	touch $(SRCDIR)/wram_routines.bin

# Build main object
$(OUTDIR)/main.o: $(SRCDIR)/main.asm $(SRCDIR)/options.bin $(SRCDIR)/pause-bg2.bin \
                  $(SRCDIR)/msu1-credits.bin $(SRCDIR)/wram_routines.bin $(SPC_BIN) | $(OUTDIR)
	$(CA65) $(SRCDIR)/main.asm -o $@ -g

# Link ROM
$(OUTDIR)/$(GAME).sfc: $(OUTDIR)/main.o | $(OUTDIR)
	$(LD65) -C $(SRCDIR)/hirom.cfg -o $@ $(OUTDIR)/main.o

# Extract WRAM routines
extract_wram: $(OUTDIR)/$(GAME).sfc
	dd if=$(OUTDIR)/$(GAME).sfc of=$(SRCDIR)/wram_routines.bin bs=1 skip=$$((0x1800)) count=$$((0x800))

# Rebuild with WRAM routines included
rebuild_wram: extract_wram
	$(CA65) $(SRCDIR)/main.asm -o $(OUTDIR)/main.o -g
	$(LD65) -C $(SRCDIR)/hirom.cfg -o $(OUTDIR)/$(GAME).sfc $(OUTDIR)/main.o

# Archive with timestamp
archive: $(OUTDIR)/$(GAME).sfc
	mkdir -p $(TIMEROM)
	@TIMESTAMP=$$(date '+%Y%m%d%H%M%S'); \
	FILENAME="$(TIMEROM)/$(GAME)-$$TIMESTAMP.sfc"; \
	cp $(OUTDIR)/$(GAME).sfc $$FILENAME; \
	echo "Archived to: $$FILENAME"

# Run in emulator
run: all
ifneq ($(EMU),)
	@echo "Launching emulator: $(EMU)"
	$(EMU) $(OUTDIR)/$(GAME).sfc
else
	@echo "No supported SNES emulator found in PATH."
	@echo "Please install one of: Mesen-S (recommended), Higan, or Snes9x."
endif

# Clean
clean:
	rm -rf $(OUTDIR) $(SRCDIR)/options.bin $(SRCDIR)/options_macro_defs.asm \
	       $(SRCDIR)/pause-bg2.bin $(SRCDIR)/msu1-credits.bin \
	       $(SRCDIR)/wram_routines.bin $(SPC_BIN)
