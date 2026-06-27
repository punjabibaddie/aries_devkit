#!/usr/bin/env bash
# setup_check.sh

echo "====SETUP CHECK===="
echo "Hostname : $(hostname)"
echo "Username : $(whoami)"
echo "OS and Kernel : $(uname -a)"
echo "Date : $(date)"

echo '--- Tool check ---'
for TOOL in git python3 pip3 ros2; do
    if command -v $TOOL &>/dev/null; then
        echo "  [OK]  $TOOL"
    else
        echo "  [MISSING]   $TOOL not installed"
    fi
done

DISK=$(df -h / | awk 'NR==2 {print $4}')
#extracting 2nd row value of 4th column
echo "Free disk : $DISK"
DISKO=$(df / | awk 'NR==2 {print $4}')
if [ "$DISKO" -lt 5120000 ]; then
    echo '[LOW DISK]'
fi

echo "====SETUP CHECK COMPLETE===="

echo "===IMPROVEMENT DONE HERE==="