#!/data/data/com.termux/files/usr/bin/bash
# Environment: Google Pixel 6 (Oriole)
# Author: WesleyXtermux
# Compatibility: ARM64 ONLY

SHADOW="/data/data/com.termux/files/usr/share/aether-sync/shadow"
ARCH=$(uname -m)

# Security Check: Architecture
if [ "$ARCH" != "aarch64" ]; then
    echo "[ERROR] This environment requires ARM64 architecture."
    exit 1
fi

echo "[BUILD] Deploying Pixel 6 Forensic Layers..."

# Creating Google-specific paths
mkdir -p "$SHADOW/data/system/pinner"
mkdir -p "$SHADOW/data/misc/profiles/cur/0/com.google.android.gms"
mkdir -p "$SHADOW/system/product/priv-app/PixelLauncher"

# Injecting Ghost build.prop for Pixel 6
printf "ro.product.model=Pixel 6\nro.product.brand=google\nro.build.version.release=14\nro.build.tags=release-keys" > "$SHADOW/system/build.prop"

echo "[SUCCESS] Pixel 6 environment ready in Shadow."
