#!/bin/bash

shopt -s nullglob

files=(./input/*.{jpg,JPG,jpeg,JPEG,png,PNG}) 

if [ ${#files[@]} -eq 0 ]; then
    echo "No image files found."
else
    for file in "${files[@]}"; do
        filename="${file##*/}"  # Extract only the filename
        echo "Processing $filename"
        node app.js -i "input/$filename"
    done
fi
