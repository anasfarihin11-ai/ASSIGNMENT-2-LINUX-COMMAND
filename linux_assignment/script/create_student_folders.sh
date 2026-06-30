#!/bin/bash
#===================================================================
# Script: create_student_folders.sh
# Description: Automated student submission workspace compiler (Part D)
#===================================================================

INPUT_FILE="$HOME/linux_assignment/student_list.txt"
SUBMISSIONS_DIR="$HOME/linux_assignment/student_submissions"
LOG_FILE="$HOME/linux_assignment/logs/folder_creation.log"

# 5.e: Handle errors gracefully (e.g., if input file is missing)
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' is missing!"
    exit 1
fi

# 2: Create the main project folder
mkdir -p "$SUBMISSIONS_DIR"

# Initialize counters for the summary (5.c)
total_students=0
declare -A unique_groups

# Start logging with a fresh timestamp header (5.d)
echo "=== Folder Creation Log: $(date) ===" > "$LOG_FILE"

# Process the file line by line
while IFS= read -r line || [ -n "$line" ]; do
    # 5.a: Skip empty or malformed lines
    [[ -z "${line//[[:space:]]/}" ]] && continue
    [[ "$line" != *,* ]] && continue

    # Parse Group Name and Matric Number
    group_name=$(echo "$line" | cut -d',' -f1 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
    matric_num=$(echo "$line" | cut -d',' -f2 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Double check for missing data fields
    [[ -z "$group_name" || -z "$matric_num" ]] && continue

    # 5.b: Replace spaces in group names with underscores
    group_clean="${group_name// /_}"

    # 3.a & 3.b: Define individual target directory path strings
    target_path="$SUBMISSIONS_DIR/$group_clean/$matric_num"

    # Create directories and log actions
    if [ ! -d "$target_path" ]; then
        mkdir -p "$target_path"
        echo "[SUCCESS] Created workspace: student_submissions/$group_clean/$matric_num" >> "$LOG_FILE"
        unique_groups["$group_clean"]=1
        ((total_students++))
    fi
done < "$INPUT_FILE"

# 5.c: Print a summary at the end showing performance metrics
echo "=== Folder Creation Summary ==="
echo "i.   Total students processed: $total_students"
echo "ii.  Number of groups created: ${#unique_groups[@]}"
echo "iii. List of all groups created:"
for grp in "${!unique_groups[@]}"; do
    echo "     - $grp"
done
echo "=============================="
