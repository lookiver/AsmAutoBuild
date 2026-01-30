#!/bin/bash

# Assign the first argument to FILE variable
FILE=$1

# 1. Check: Is the filename argument provided?
if [ -z "$FILE" ]; then
    echo "Error: Please provide a filename. Usage: ./asmbuild file.asm"
    exit 1
fi

# 2. Check: Does the file exist in the current directory?
if [ -f "$FILE" ]; then
    echo "Starting build process..."
    
    # Strip the extension to get the base filename
    BASENAME="${FILE%.*}"

    # 3. Step: Assemble with NASM
    echo "Assembling with NASM (elf32)..."
    nasm -f elf32 "$FILE" -o "$BASENAME.o"

    # Check if the last command (nasm) was successful
    if [ $? -eq 0 ]; then
        
        # 4. Step: Link with LD
        echo "Linking with LD (elf_i386)..."
        ld -m elf_i386 -s -o "$BASENAME" "$BASENAME.o"
        
        # Check if the last command (ld) was successful
        if [ $? -eq 0 ]; then
            # 5. Step: Execute the binary
            echo "Execution: ./$BASENAME"
            echo "---------------------------"
            ./"$BASENAME"
            echo -e "\n---------------------------"
        else
            echo "Error: Linker (ld) stage failed."
        fi
    else
        echo "Error: Assembly (nasm) stage failed."
    fi

else
    # File not found error
    echo "Error: File '$FILE' not found in the current directory"
    exit 1
fi
