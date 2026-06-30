#!/bin/bash
# ==============================================================================
# Script Name: file_organizer.sh
# Description: Organizes documents and config files into structured directories.
# ==============================================================================

TARGET_DIR="$HOME/linux_assignment"
DOC_DIR="$TARGET_DIR/Documents"
OTH_DIR="$TARGET_DIR/Others"
IMG_DIR="$TARGET_DIR/Images"

# Create directories if they don't exist [cite: 50, 51]
mkdir -p "$DOC_DIR" "$OTH_DIR" "$IMG_DIR"

# Track counts for report summary [cite: 55]
moved_docs=0
moved_others=0

echo "Starting file organization within: $TARGET_DIR/documents/"

# Loop through current files inside the target documents directory
# Note: Assignment requires organizing the files we initialized in Part A.
if [ -d "$TARGET_DIR/documents" ]; then
    for file in "$TARGET_DIR/documents"/*; do
        [ -e "$file" ] || continue # Handle empty directory edge case
        
        filename=$(basename "$file")
        extension="${filename##*.}"
        
        case "$extension" in
            txt|md|pdf) [cite: 52]
                mv "$file" "$DOC_DIR/" [cite: 53]
                ((moved_docs++))
                ;;
            csv|conf) [cite: 54]
                mv "$file" "$OTH_DIR/" [cite: 54]
                ((moved_others++))
                ;;
            *)
                # Leave other extensions untouched or extend logic here
                ;;
        esac
    done
fi

# Print summary [cite: 55]
echo "----------------------------------------"
echo "Organization Complete Summary:"
echo "Files moved to Documents/ : $moved_docs"
echo "Files moved to Others/    : $moved_others"
echo "----------------------------------------"
