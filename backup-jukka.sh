#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

readonly SOURCE_DIR="/Users/jukka/google-drive"
readonly BACKUP_DIR="/Volumes/Backup_3_1/google-drive-backup/jukka"
readonly DATETIME="$(date '+%Y-%m-%d_%H-%M-%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="${BACKUP_DIR}/latest"

cp -Rl "${LATEST_LINK}/" "${BACKUP_PATH}"

rsync -av --delete "${SOURCE_DIR}/" "${BACKUP_PATH}"

rm -rf "${LATEST_LINK}"
ln -s "${DATETIME}" "${LATEST_LINK}"
