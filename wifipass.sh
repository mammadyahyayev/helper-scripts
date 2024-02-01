#!/bin/bash

#########################################
#           HOW TO USE GUIDE?           #
#########################################
# The script will help you to find WI-FI's password.

# How to run:
# ./wifipass.sh "WIFI-NAME"

# Example illustrated at the below:
# ./wifipass.sh "TP-LINK-241241"
# Result: Password: XXXXXXXXXXXX

# Note: don't forget to put quotes around WI-FI name.

#########################################
#           HOW TO USE GUIDE?           #
#########################################

wifiname="$1"

result=$(netsh wlan show profile name="$wifiname" key=clear | findstr Key)

# IFS=': ' read -r text password <<< "$result"

split=(${result//: / })

echo "Password: ${split[2]}"
