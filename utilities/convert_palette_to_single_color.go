package main

import (
	"fmt"
	"os"
)

func main() {
	// Paste your 64 values here
	input := []int{
		99,41,16,0,0,0,0,24,49,74,82,74,66,0,0,0,
		173,90,66,26,24,24,49,74,107,132,148,140,123,0,0,0,
		255,181,148,115,107,107,132,156,189,222,231,231,206,74,0,0,
		255,222,214,206,198,198,206,222,231,239,247,247,239,0,0,0,
	}

	if len(input) != 64 {
		fmt.Fprintf(os.Stderr, "Input must contain exactly 64 values\n")
		os.Exit(1)
	}

	var result []uint16
	for i, val := range input {
		if val < 0 || val > 255 {
			fmt.Fprintf(os.Stderr, "Invalid value at position %d: %d\n", i, val)
			os.Exit(1)
		}
		shifted := uint16((val >> 3))
		result = append(result, shifted)
	}

	for i := 0; i < 64; i += 8 {
		fmt.Print(".word ")
		for j := 0; j < 8; j++ {
			fmt.Printf("$%04X", result[i+j])
			if j < 7 {
				fmt.Print(", ")
			}
		}
		fmt.Println()
	}
}
