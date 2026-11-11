#!/bin/bash
set -euo pipefail

# Usage: bash get_books.sh BUCKET BOOK_DIR
bucket="$1"
book_dir="$2"

mkdir -p "$book_dir"
book_dir="$(realpath "$book_dir")"

aws s3 cp "s3://$bucket/" "$book_dir/" --recursive --exclude "*" --include "*.txt"

echo "File path" > book_list.txt
find "$book_dir" -name "*.txt" | sort >> book_list.txt

echo "Wrote $(( $(wc -l < book_list.txt) - 1 )) book files to book_list.txt"
