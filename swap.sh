#!/bin/sh

#########################################
#           HOW TO USE GUIDE?           #
#########################################
# The script will help you to increase or decrease swap file size in Linux.

# How to run:
# ./swap.sh 3G
# ./swap.sh 3G /swap


if [ ! "$#" -ge 1 ]; then
    echo "Usage: $0 {size}"
    echo "Example: $0 4G"
    echo "(Default path: /swapfile)"
    echo "Optional path: Usage: $0 {size} {path}"
    exit 1
fi

SUDO=''

# Check if invoking user is root
if [ "$(id -u)" -ne 0 ]; then
    echo "Root access is required, please run as root or enter sudo password if prompted." >&2
    exit 1;
fi

SWAP_SIZE=$1
SWAP_PATH="/swapfile"
if [ ! -z "$2" ]; then
    SWAP_PATH=$2
fi


$SUDO fallocate -l $SWAP_SIZE $SWAP_PATH
$SUDO chmod 600 $SWAP_PATH
$SUDO mkswap $SWAP_PATH
$SUDO swapon $SWAP_PATH
echo "$SWAP_PATH   none    swap    sw    0   0" | $SUDO tee /etc/fstab -a # Add to fstab
