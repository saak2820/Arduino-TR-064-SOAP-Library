#!/bin/bash
for filename in examples/arduino_secrets.h.example; do
    [ -e "$filename" ] || continue
    cp $filename arduino_secrets.h
done