package main

import (
	"flag"
	"fmt"
	"io"
	"os"
	"path/filepath"
)

func main() {
	inputFile := flag.String("input", "", "Input ROM file")
	outputDir := flag.String("output", ".", "Output directory")
	flag.Parse()

	if *inputFile == "" {
		fmt.Println("Usage: extract_16bit_tiles -input <rom_file> -output <output_dir>")
		os.Exit(1)
	}

	file, err := os.Open(*inputFile)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error opening file: %v\n", err)
		os.Exit(1)
	}
	defer file.Close()

	// Seek to ROM location 0x188000


	chunkSize := 0x8000
	buffer := make([]byte, chunkSize)

	// Extract 8 files
	for i := 0; i < 8; i++ {
		startOffset := int64(0x188000 + i*0x10000)
		if _, err := file.Seek(startOffset, io.SeekStart); err != nil {
			fmt.Fprintf(os.Stderr, "Error seeking to offset: %v\n", err)
			os.Exit(1)
		}

		n, err := file.Read(buffer)
		if err != nil && err != io.EOF {
			fmt.Fprintf(os.Stderr, "Error reading chunk %d: %v\n", i, err)
			os.Exit(1)
		}

		if n == 0 {
			fmt.Fprintf(os.Stderr, "Reached end of file at chunk %d\n", i)
			break
		}

		outFilename := filepath.Join(*outputDir, fmt.Sprintf("tiles-16bit-%d.bin", i))
		outFile, err := os.Create(outFilename)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error creating output file: %v\n", err)
			os.Exit(1)
		}

		if _, err := outFile.Write(buffer[:n]); err != nil {
			fmt.Fprintf(os.Stderr, "Error writing to output file: %v\n", err)
			outFile.Close()
			os.Exit(1)
		}
		outFile.Close()

		fmt.Printf("Extracted %s (%d bytes)\n", outFilename, n)
	}
}