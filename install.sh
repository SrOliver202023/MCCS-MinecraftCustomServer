#!/bin/bash

src_dir=$(find . -mindepth 1 -maxdepth 1 -type d)

dest_dir="."

for file in "$src_dir"/*; do
    filename=$(basename "$file")
    if [ -e "$dest_dir/$filename" ]; then
        echo "Arquivo '$filename' já existe no destino. Pulando..."
    else
        mv "$file" "$dest_dir"
    fi
done

rm -rf $src_dir

chmod +x ./start.sh

./start.sh
