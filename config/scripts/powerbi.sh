#!/bin/bash
set -e
# ================================
# Power BI Desktop on Arch (Wine)
# ================================

# 1. Enable multilib and install Wine + Winetricks
echo "[1/5] Installing Wine and Winetricks..."
sudo pacman -S --needed wine wine-mono wine-gecko winetricks wget

# 2. Create Wine Prefix
WINEPREFIX="$HOME/wine-powerbi"
export WINEPREFIX
echo "[2/5] Creating Wine prefix at $WINEPREFIX..."
mkdir -p "$WINEPREFIX"
WINEARCH=win64 wineboot --init

# 3. Install dependencies (.NET + fonts)
echo "[3/5] Installing required components (dotnet48, corefonts)..."
WINEPREFIX="$HOME/wine-powerbi" winetricks -q dotnet48 corefonts

# 4. Download Power BI Desktop
PBI_URL="https://download.microsoft.com/download/8/8/0/880bca75-79dd-466a-927d-1abf1f5454b0/PBIDesktopSetup_x64.exe"
PBI_EXE="$HOME/Downloads/PBIDesktopSetup_x64.exe"
if [ ! -f "$PBI_EXE" ]; then
    echo "[4/5] Downloading Power BI Desktop..."
    wget -O "$PBI_EXE" "$PBI_URL"
else
    echo "[4/5] Power BI installer already exists in Downloads."
fi

# 5. Install Power BI Desktop
echo "[5/5] Running Power BI installer..."
WINEPREFIX="$HOME/wine-powerbi" wine "$PBI_EXE"

echo "=============================================="
echo "✅ Power BI installation finished!"
echo "To launch Power BI Desktop, run:"
echo "WINEPREFIX=$HOME/wine-powerbi wine \"C:\\Program Files\\Microsoft Power BI Desktop\\bin\\PBIDesktop.exe\""
echo "=============================================="
