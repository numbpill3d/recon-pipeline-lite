#!/usr/bin/env bash
# recon-lite.sh — free lite pipeline for GitHub funnel
set -euo pipefail
TARGETS="${1:-targets.txt}"
OUTDIR="${2:-out}"
mkdir -p "$OUTDIR"
subfinder -dL "$TARGETS" -silent -o "$OUTDIR/subs.txt" || true
httpx -l "$OUTDIR/subs.txt" -silent -o "$OUTDIR/live.txt" || true
katana -list "$OUTDIR/live.txt" -d 2 -silent -o "$OUTDIR/urls.txt" || true
grep -E '\.js($|\?)' "$OUTDIR/urls.txt" | sort -u > "$OUTDIR/js.txt" || true
nuclei -l "$OUTDIR/live.txt" -severity medium,high,critical -silent -o "$OUTDIR/nuclei.txt" || true
echo "[+] done. results in $OUTDIR/"
