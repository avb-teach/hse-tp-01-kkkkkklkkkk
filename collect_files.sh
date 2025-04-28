#!/bin/bash

input_dir="$1"
output_dir="$2"

find "$input_dir" -type f | while read file; do
    filename=$(basename "$file")
    target="$output_dir/$filename"
    
    if [[ -e "$target" ]]; then
        count=1
        while [[ -e "$output_dir/${filename%.*}$count.${filename##*.}" ]]; do
            ((count++))
        done
        target="$output_dir/${filename%.*}$count.${filename##*.}"
    fi

    cp "$file" "$target"
done