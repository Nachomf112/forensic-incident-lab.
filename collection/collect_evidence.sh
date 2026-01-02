#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Forensic Incident Lab - Evidence Collection (Linux)
# Author: Ignacio Menárguez Fernández
# Purpose: Initial DFIR evidence collection with chain of custody
# Notes:
#  - Execute ideally with sudo
#  - Timestamped (UTC)
#  - Separation of logs and hashes
# ============================================================

# --- Timestamp (UTC) ---
TS="$(date -u '+%Y%m%d_%H%M%S_UTC')"

# --- Paths ---
OUT_DIR="evidence/logs/collection_${TS}"
LOG_FILE="${OUT_DIR}/collection.log"
HASH_FILE="collection/hashes_${TS}.sha256"

# --- Prepare directories ---
mkdir -p "$OUT_DIR"
mkdir -p collection

# --- Start log ---
{
  echo "[+] Starting evidence collection"
  echo "Timestamp (UTC): $TS"
  echo "Collector user: $(whoami)"
  echo "UID: $(id -u)"
  echo "Execution path: $(pwd)"
  echo "Hostname: $(hostname 2>/dev/null || echo unknown)"
  echo "----------------------------------------"
} >> "$LOG_FILE"

# ============================================================
# 1) System identification
# ============================================================
{
  echo "## SYSTEM INFO"
  date -u
  uname -a
} > "${OUT_DIR}/system_info.txt"

# ============================================================
# 2) Logged users & sessions
# ============================================================
{
  echo "## LOGGED USERS"
  who
  echo
  echo "## LAST LOGINS (last 50)"
  last -n 50 2>/dev/null || true
} > "${OUT_DIR}/users_sessions.txt"

# ============================================================
# 3) Processes & services
# ============================================================
{
  echo "## RUNNING PROCESSES"
  ps auxww
  echo
  echo "## SYSTEMD SERVICES"
  systemctl list-units --type=service --all 2>/dev/null || true
} > "${OUT_DIR}/processes_services.txt"

# ============================================================
# 4) Network information
# ============================================================
{
  echo "## NETWORK CONNECTIONS (ss)"
  ss -tulpen 2>/dev/null || true
  echo
  echo "## ROUTING TABLE"
  ip route 2>/dev/null || true
  echo
  echo "## NETWORK INTERFACES"
  ip addr 2>/dev/null || true
} > "${OUT_DIR}/network_info.txt"

# ============================================================
# 5) Scheduled tasks & persistence
# ============================================================
{
  echo "## CRON (system)"
  ls -la /etc/cron* 2>/dev/null || true
  echo
  echo "## CRON (current user)"
  crontab -l 2>/dev/null || true
} > "${OUT_DIR}/persistence.txt"

# ============================================================
# 6) Loaded kernel modules
# ============================================================
{
  echo "## LOADED KERNEL MODULES"
  lsmod 2>/dev/null || true
} > "${OUT_DIR}/kernel_modules.txt"

# ============================================================
# 7) Binary integrity snapshot (basic)
# ============================================================
{
  echo "## BINARIES (ls -l /bin /usr/bin)"
  ls -l /bin /usr/bin 2>/dev/null || true
} > "${OUT_DIR}/binaries_snapshot.txt"

# ============================================================
# Hash generation (chain of custody)
# ============================================================
echo "[+] Generating SHA256 hashes" >> "$LOG_FILE"
find "$OUT_DIR" -type f -exec sha256sum {} \; > "$HASH_FILE"

# ============================================================
# End
# ============================================================
{
  echo "----------------------------------------"
  echo "[+] Evidence collection completed"
  echo "Evidence directory: $OUT_DIR"
  echo "Hashes file: $HASH_FILE"
} >> "$LOG_FILE"

