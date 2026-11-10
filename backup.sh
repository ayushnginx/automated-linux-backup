#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: ./backup.sh SOURCE_DIRECTORY BACKUP_DIRECTORY"
    exit 1
fi

SOURCE=$(realpath "$1")
DEST=$(realpath -m "$2")

if [[ ! -d "$SOURCE" ]]; then
    echo "Error: source directory does not exist."
    exit 1
fi

if [[ "$DEST" == "$SOURCE" || "$DEST" == "$SOURCE/"* ]]; then
    echo "Error: backup destination must be outside the source directory."
    exit 1
fi

mkdir -p "$DEST"

STAMP=$(date +%Y%m%d-%H%M%S)
NAME=$(basename "$SOURCE")
ARCHIVE="$DEST/${NAME}-${STAMP}.tar.gz"

tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$NAME"
sha256sum "$ARCHIVE" > "$ARCHIVE.sha256"

echo "Backup completed:"
echo "$ARCHIVE"
echo "Checksum saved: $ARCHIVE.sha256"
