# ========================================================================
# Rumbleminzie's SNES Castlevania Port - Optimized Makefile
# Supports: Linux, macOS, Termux, MSYS2
# ========================================================================

# ---- Platform Detection & Configuration ----
UNAME_S := $(shell uname -s)
EXE := $(if $(filter MINGW%,$(UNAME_S)),.exe)
TIMESTAMP := $(shell date '+%Y%m%d%H%M%S')

# ---- Project Layout ----
GAME := Castlevania
SRCDIR := src
OUTDIR := out
ARCHDIR := $(OUTDIR)/buildarchive

# ---- Tool Paths ----
CA65 := ca65$(EXE)
LD65 := ld65$(EXE)
GO := go$(EXE)
ASAR := asar$(EXE)

# Emulator discovery (prioritized)
EMU := $(or $(shell command -v Mesen-S$(EXE) 2>/dev/null),\
            $(shell command -v higan$(EXE) 2>/dev/null),\
            $(shell command -v snes9x$(EXE) 2>/dev/null))

# ---- Generated Files ----
GEN_FILES := $(SRCDIR)/options.bin \
             $(SRCDIR)/options_macro_defs.asm \
             $(SRCDIR)/pause-bg2.bin \
             $(SRCDIR)/msu1-credits.bin

SPC_BIN := $(SRCDIR)/spc/spc.bin
WRAM_BIN := $(SRCDIR)/wram_routines.bin

# ---- Build Targets ----
ROM := $(OUTDIR)/$(GAME).sfc
OBJ := $(OUTDIR)/main.o

# ========================================================================
# Targets
# ========================================================================

.PHONY: all clean run archive extract_wram rebuild_wram spc check-tools help

all: $(ROM) archive
	@echo "[OK] Build complete: $(ROM)"

help:
	@echo "Available targets:"
	@echo "  all              - Build ROM and archive (default)"
	@echo "  spc              - Build SPC audio binary"
	@echo "  run              - Build and launch in emulator"
	@echo "  extract_wram     - Extract WRAM routines from ROM"
	@echo "  rebuild_wram     - Rebuild with extracted WRAM"
	@echo "  archive          - Archive current ROM"
	@echo "  check-tools      - Verify required tools"
	@echo "  clean            - Remove all generated files"

check-tools:
	@echo "Checking required tools..."
	@command -v $(CA65) >/dev/null || (echo "ERROR: ca65 not found" && exit 1)
	@command -v $(LD65) >/dev/null || (echo "ERROR: ld65 not found" && exit 1)
	@command -v $(GO) >/dev/null || (echo "ERROR: go not found" && exit 1)
	@echo "[OK] All required tools found"

# ---- Directory Setup ----
$(OUTDIR) $(ARCHDIR):
	@mkdir -p $@

# ---- Generate Files (Consolidated) ----
$(SRCDIR)/options.bin $(SRCDIR)/options_macro_defs.asm: | $(OUTDIR)
	@echo "Generating options..."
	@$(GO) run utilities/generate_options_asm.go
	@mv -f options.bin $(SRCDIR)/ && mv -f options_macro_defs.asm $(SRCDIR)/

$(SRCDIR)/pause-bg2.bin $(SRCDIR)/msu1-credits.bin: | $(OUTDIR)
	@echo "Generating tilemaps..."
	@$(GO) run utilities/generate_tilemaps.go
	@mv -f pause-bg2.bin $(SRCDIR)/ && mv -f msu1-credits.bin $(SRCDIR)/

# ---- SPC Binary ----
spc: $(SPC_BIN)

$(SPC_BIN): $(SRCDIR)/spc/spc.asm
	@if command -v $(ASAR) >/dev/null 2>&1; then \
		echo "Building SPC..."; \
		$(ASAR) $< $@; \
		echo "[OK] Built: $@"; \
	else \
		echo "[SKIP] asar not found, skipping SPC build"; \
		touch $@; \
	fi

# ---- WRAM Initialization ----
$(WRAM_BIN):
	@echo "Creating placeholder WRAM binary..."
	@touch $@

# ---- Main Assembly & Linking ----
$(OBJ): $(SRCDIR)/main.asm $(GEN_FILES) $(WRAM_BIN) $(SPC_BIN) | $(OUTDIR)
	@echo "Assembling..."
	@$(CA65) $< -o $@ -g

$(ROM): $(OBJ) | $(OUTDIR)
	@echo "Linking..."
	@$(LD65) -C $(SRCDIR)/hirom.cfg -o $@ $<
	@echo "[OK] ROM generated: $@"

# ---- WRAM Extraction & Rebuild ----
extract_wram: $(ROM)
	@echo "Extracting WRAM routines..."
	@if command -v xxd >/dev/null 2>&1; then \
		xxd -s 0x1800 -l 0x800 -r $(ROM) $(WRAM_BIN); \
	else \
		dd if=$(ROM) of=$(WRAM_BIN) bs=1 skip=6144 count=2048 2>/dev/null; \
	fi
	@echo "[OK] Extracted: $(WRAM_BIN)"

rebuild_wram: extract_wram $(OBJ)
	@echo "Rebuilding ROM with WRAM..."
	@$(LD65) -C $(SRCDIR)/hirom.cfg -o $(ROM) $(OBJ)
	@echo "[OK] Rebuild complete: $(ROM)"

# ---- Archiving ----
archive: $(ROM) | $(ARCHDIR)
	@cp $(ROM) $(ARCHDIR)/$(GAME)-$(TIMESTAMP).sfc
	@echo "[OK] Archived to: $(ARCHDIR)/$(GAME)-$(TIMESTAMP).sfc"

# ---- Run in Emulator ----
run: all
	@if [ -n "$(EMU)" ]; then \
		echo "Launching: $(EMU)"; \
		$(EMU) $(ROM) &; \
	else \
		echo "Error: No SNES emulator found in PATH"; \
		echo "Install one of: Mesen-S (recommended), Higan, or Snes9x"; \
		exit 1; \
	fi

# ---- Cleanup ----
clean:
	@echo "Cleaning..."
	@rm -rf $(OUTDIR) $(GEN_FILES) $(WRAM_BIN) $(SPC_BIN)
	@echo "[OK] Clean complete"

# ========================================================================
# Debug Targets (Optional - Remove if not needed)
# ========================================================================

.PHONY: info
info:
	@echo "Platform: $(UNAME_S)"
	@echo "CA65: $$(command -v $(CA65) 2>/dev/null || echo 'not found')"
	@echo "LD65: $$(command -v $(LD65) 2>/dev/null || echo 'not found')"
	@echo "GO: $$(command -v $(GO) 2>/dev/null || echo 'not found')"
	@echo "ASAR: $$(command -v $(ASAR) 2>/dev/null || echo 'not found')"
	@echo "EMU: $$(echo $(EMU) | grep -o '[^/]*$$' || echo 'not found')"
	@echo "Timestamp: $(TIMESTAMP)"
