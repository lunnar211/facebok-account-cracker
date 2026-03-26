#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# install.sh — Dependency installer for Facebook Account Security Tester
# Supports both Termux (Android) and standard Linux / macOS.
# ─────────────────────────────────────────────────────────────────────────────

set -euo pipefail

echo "[*] Installing dependencies for Facebook Account Security Tester..."

# ── Detect environment ────────────────────────────────────────────────────────
if command -v pkg &>/dev/null; then
    echo "[*] Termux environment detected."
    pkg update -y
    pkg install -y python python-pip
    pip install --upgrade pip
    pip install requests
else
    echo "[*] Standard Linux / macOS environment detected."
    if command -v apt-get &>/dev/null; then
        sudo apt-get update -y
        sudo apt-get install -y python3 python3-pip
    elif command -v brew &>/dev/null; then
        brew install python3
    fi
    python3 -m pip install --upgrade pip
    python3 -m pip install requests
fi

echo ""
echo "[✔] Installation complete!"
echo ""
echo "Usage:"
echo "  python3 hack.py <email> [wordlist]"
echo "  python3 hack.py                        # interactive mode"

