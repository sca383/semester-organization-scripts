#!/bin/bash
# Usage ./new_course [base_dir] [course_name] <folder_Args>
# ex. ./new_course assignments, lab, notes
# Default if empty args: assignment, lectures
# Function: scaffolds a course folder inside the current semester (e.g. CMPT383/notes, CMPT383/assignments, CMPT383/lab

BASE_DIR=$1
COURSE_NAME=$2
COURSE_COMP_RANGE=("assignments" "lectures" "notes")

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: new_course.sh <base_dir> <course_name>"
    exit 1
fi

for comp in "${COURSE_COMP_RANGE[@]}"; do
    mkdir -p "$BASE_DIR/$COURSE_NAME/$comp"
    echo "Created subfolder $comp in $COURSE_NAME"
done