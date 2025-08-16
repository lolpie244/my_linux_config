#!/bin/bash

BAT="/sys/class/power_supply/BAT0/power_now"

if [ -f "$BAT" ]; then
    WATTS=$(awk '{printf "%.1f", $1 / 1000000}' "$BAT")
else
    WATTS="N/A"
fi

echo "󱐋 ${WATTS}"
