#! /bin/bash

	shopt -s globstar
	find . -type f -name '*.md' -print0 | while IFS= read -r -d '' file; do
		echo "$file"
		contents=$(cat "$file" | eighty)
		printf '%s' "$contents" > "$file"
	done
