# Automated Linux Backup

A Bash script for creating timestamped compressed backups.

## Features
- Creates a tar.gz archive
- Adds a timestamp to the backup filename
- Generates a SHA256 checksum
- Checks source and destination paths

## Run

```bash
chmod +x backup.sh
./backup.sh sample_data "$HOME/backups"
```

## Verify checksum

```bash
cd "$HOME/backups"
sha256sum -c *.sha256
```

## Requirements
Bash, tar, coreutils.

## Learning notes
Test with sample_data first. Keep backups on a separate disk or
storage location for important data.
