#!/bin/bash
for filename in Data/*.txt; do
    [ -e "$filename" ] || continue
    cp $filename arduino_secrets.h
done