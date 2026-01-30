# AsmAutoBuild

A minimalist Bash script to automate **NASM** assembly, linking, and execution. I built this to speed up my workflow while learning Assembly and Low-Level programming.

## Features
- Checks if the file exists.
- Automatically handles `nasm` and `ld` (elf_i386).
- Stops on errors (doesn't run broken code).
- Instant execution after successful build.

## Usage
```bash
chmod +x asmbuild.sh
./asmbuild.sh filename.asm
