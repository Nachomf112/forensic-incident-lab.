#!/usr/bin/env bash
set -euo pipefail

# Forensic Incident Lab - Evidence Collection (Linux)
# Recolecta artefactos básicos y genera hashes SHA256
# Ejecutar con permisos suficientes (idealmente sudo) en entorno controlado.

TS="$(date -u +'%Y%m%d_%H%M%S_UTC')"
OUT_DIR="evidence/logs/collection_${TS}"
HASH_FILE="collection/hashes_${TS}.txt"

mkdir -p "$OUT_DIR"
mkdir -p "collection"

echo "[+] Starting evidence collection: $TS" | tee -a "$HASH_FILE"
echo "[+] Output: $OUT_DIR" | tee -a "$HASH_FILE"
echo "" | tee -a "$HASH_FILE"

# 1) Identidad del sistema
{
  echo "## SYSTEM INFO"
  date -u
  hostnamectl 2>/dev/null || true
  uname -a
} > "${OUT_DIR}/system_info.txt"

# 2) Usuarios y sesiones
{
  echo "## LOGGED USERS"
  who
  echo ""
  echo "## LAST LOGINS"
  last -n 50 2>/dev/null || true
} > "${OUT_DIR}/users_sessions.txt"

# 3) Procesos y servicios
{
  echo "## PROCESSES"
  ps auxww
  echo ""
  echo "## SYSTEMD SERVICES"
  systemctl list-units --type=service --all 2>/dev/null || true
} > "${OUT_DIR}/processes_services.txt"

# 4) Red: sockets/conexiones
{
  echo "## NETWORK (ss)"
  ss -tulpn 2>/dev/null || true
  echo ""
  echo "## ROUTES"
  ip route 2>/dev/null || true
  echo ""
  echo "## INTERFACES"
  ip a 2>/dev/null || true
} > "${OUT_DIR}/network_state.txt"

# 5) Logs relevantes (dependen de distro)
# Debian/Kali: /var/log/auth.log, /var/log/syslog (si existen)
for f in /var/log/auth.log /var/log/syslog /var/log/kern.log; do
  if [ -f "$f" ]; then
    cp -a "$f" "$OUT_DIR/"
  fi
done

# 6) Journal (últimas 24h) si existe
if command -v journalctl >/dev/null 2>&1; then
  journalctl --since "24 hours ago" --no-pager > "${OUT_DIR}/journal_last24h.txt" 2>/dev/null || true
fi

# Hashes de todo lo recolectado
echo "## SHA256 HASHES" | tee -a "$HASH_FILE"
(
  cd "$OUT_DIR"
  sha256sum * 2>/dev/null || true
) | tee -a "$HASH_FILE"

echo "" | tee -a "$HASH_FILE"
echo "[+] Done. Hashes stored in: $HASH_FILE" | tee -a "$HASH_FILE"
