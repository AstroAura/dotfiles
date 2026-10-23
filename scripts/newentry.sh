#!/usr/bin/env bash

JOURNAL_DIR="$HOME/journal"

read -rp "Which year? (Use jopen before newentry!) " YEAR
read -rp "Which month? (Use jopen before newentry!) " MONTH
FILENAME="$(date '+%B %-d,%Y').md"
FILEPATH="$JOURNAL_DIR/$YEAR/$MONTH/$FILENAME"

if [[ -f "$FILEPATH" ]]; then
    echo "Entry already exists: $FILEPATH"
    exit 1
fi

mkdir -p "$JOURNAL_DIR/$YEAR/$MONTH"
echo "# $(date '+%Y-%m-%d %H:%M')" > "$FILEPATH"
echo "Created: $FILEPATH"
