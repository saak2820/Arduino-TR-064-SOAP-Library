#!/bin/bash


for pathname in examples/*/arduino_secrets.h.example; do
	[ -e "$pathname" ] || continue
	printf 'Processing "%s"\n' "$pathname" >&2
	
    #${var/Pattern/Replacement}
    new_file=${pathname/arduino_secrets.h.example/arduino_secrets.h};
	printf 'new_file "%s"\n' "$new_file" >&2
    cp "$pathname" "${new_file}";
done;

