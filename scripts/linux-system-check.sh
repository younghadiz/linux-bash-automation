#!/bin/bash

echo "======================================"
echo " Linux System Check"
echo "======================================"
echo ""

echo "1. Distribution Information"
echo "---------------------------"
if [ -f /etc/os-release ]; then
    cat /etc/os-release
else
    echo "No /etc/os-release file found."
fi

echo ""
echo "2. Package Manager Check"
echo "------------------------"
if command -v apt >/dev/null 2>&1; then 
    echo "APT package manager is available."
    apt --version | head -n 1
elif command -v apt-get >/dev/null 2>&1; then
    echo "APT-GET package manager is available."
    apt-get --version | head -n 1
elif command -v yum >/dev/null 2>&1; then
    echo "YUM package manager is available."
    yum --version | head -n 1
else
    echo "No apt, apt-get, or yum package manager found."
fi

echo ""
echo "3. CLI Editor Check"
echo "-------------------"
for editor in nano vi vim; do
    if command -v "$editor" >/dev/null 2>&1; then
        echo "$editor is installed: $(command -v "$editor")"
    else
        echo "$editor is not installed."
    fi
done

echo ""
echo "4. Software Center / Software Manager Check"
echo "-------------------------------------------"
if command -v mintinstall >/dev/null 2>&1; then
    echo "Linux Mint Software Manager is available."
elif command -v gnome-software >/dev/null 2>&1; then
    echo "GNOME Software Center is available."
elif command -v snap-store >/dev/null 2>&1; then
    echo "Snap Store is available."
else
    echo "No common graphical software center detected."
fi

echo ""
echo "5. Shell Check"
echo "--------------"
echo "Current shell from SHELL environment variable: $SHELL"
echo "Current user: $USER"

echo ""
echo "6. Kernel Check"
echo "---------------"
uname -a

echo ""
echo "Linux system check completed."