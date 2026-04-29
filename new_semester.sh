#!/bin/bash
# Usage: ./new_semester [semester_name] [BASE_DIR]
# ex. ./new_semester [~/Documents/School] fall_2026
# Function: Creates fresh semester directory with a standard subdirectory scaffold (e.g. courses/, notes/, assignments/, resources/)
# new_semester.sh
#   ├── ask for base dir (or take as argument)
#   ├── ask for semester name (or take as argument)
#   ├── create the semester folder
#   ├── ask for courses in a loop
#   │     "add a course (or press enter to finish): " → CMPT 471 created
#   │     "add a course (or press enter to finish): " → MATH 240 created
#   │     "add a course (or press enter to finish): " → [enter] → done
#   └── for each course → call new_course.sh

SCRIPT_DIR="$(dirname "$0")"

if [[ -z "$1" ]]; then
    read -p "Please enter the directory for the semester directory to be created: " BASE_DIR
else
    BASE_DIR=$1
fi

if [[ -z "$2" ]]; then
    read -p "Please enter the semester name" SEMESTER_NAME
else
    SEMESTER_NAME=$2
fi

mkdir -p "$BASE_DIR/$SEMESTER_NAME"
echo "Created semester folder: $BASE_DIR/$SEMESTER_NAME"

while true; do
    read -p "Add a course (or press enter to finish): " course_input
    if [[ -z "$course_input" ]]; then
        break
    fi
    "$SCRIPT_DIR/new_course.sh" "$BASE_DIR/$SEMESTER_NAME" "$course_input"
done

echo "Semester $SEMESTER_NAME directory set up done"