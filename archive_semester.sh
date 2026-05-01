#!/bin/bash
# Usage ./archive_semester [active_dir] [-c]
# Function: moves a completed semester folder into an archive/ directory,  compressing it optionally

COMPRESS_FLAG=${2:-"no"} # need to figure out what to put for default

if [[ -z "$1" ]]; then
    read -p "Please enter the directory for base directory to archive: " BASE_DIR
else
    BASE_DIR=$1 
fi

ACTIVE_DIR="$(realpath "$BASE_DIR")/active"
ARCHIVE_DIR="$(realpath "$BASE_DIR")/archive"

read -p "This will archive all active semesters. Continue? (y\n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo "Cancelled operation."
    exit 0
fi

if [[ -d "$ACTIVE_DIR" ]]; then
    echo "Active directory exists"
    for semester in "$ACTIVE_DIR"/*/; do
        SEMESTER_NAME=$(basename "$semester")
        if [[ "$COMPRESS_FLAG" == "-c" ]]; then
            mkdir -p "$ARCHIVE_DIR"
            (cd "$ACTIVE_DIR" && zip -r "$ARCHIVE_DIR/$SEMESTER_NAME.zip" "$SEMESTER_NAME" && rm -rf "$SEMESTER_NAME")
            echo "Archived and compressed $SEMESTER_NAME"
        else
            mv "$semester" "$ARCHIVE_DIR/"
            echo "Archived $SEMESTER_NAME"
        fi
        echo "All semesters from current directory archived."
    done
else
    echo "Active directory not found. Unable to archive."
    exit 1
fi


