#!/bin/bash

raw_count=$(makoctl list | wc -l)
lines_per_message=3

COUNT=$((raw_count / lines_per_message))

if makoctl mode | grep -q "mute"; then
    echo " ${COUNT}"
else
    echo ""
fi
