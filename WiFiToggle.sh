#!/usr/bin/env bash
set -eu

# WiFiToggle.sh - Switch the wi-fi On/Off.

if [[ "`networksetup -getairportpower en0`" =~ "On" ]]; then
  networksetup -setairportpower en0 Off
else
  networksetup -setairportpower en0 On
fi

exit 0
