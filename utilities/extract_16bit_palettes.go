package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: extract_16bit_palettes <input_file>")
		os.Exit(1)
	}

	inputFile := os.Args[1]
	data, err := os.ReadFile(inputFile)
	if err != nil {
		fmt.Printf("Error reading file: %v\n", err)
		os.Exit(1)
	}

	// Extract background palettes (11 chunks starting at 0x20B100)
	extractPalettes(data, 0x20B100, "../src/16bit-tiles/bg_16bit_palette", 11)

	// Extract sprite palettes (11 chunks starting at 0x20B700)
	extractPalettes(data, 0x20B700, "../src/16bit-tiles/sprite_16bit_palette", 11)

	fmt.Println("Extraction complete!")
}

func extractPalettes(data []byte, startOffset int, namePrefix string, count int) {
	chunkSize := 128

	for i := 0; i < count; i++ {
		offset := startOffset + (i * chunkSize)
		endOffset := offset + chunkSize

		if endOffset > len(data) {
			fmt.Printf("Error: Not enough data at offset 0x%X\n", offset)
			continue
		}

		chunk := data[offset:endOffset]
		filename := fmt.Sprintf("%s_%02d.bin", namePrefix, i)

		err := os.WriteFile(filename, chunk, 0644)
		if err != nil {
			fmt.Printf("Error writing %s: %v\n", filename, err)
		} else {
			fmt.Printf("Extracted %s\n", filename)
		}
	}
}