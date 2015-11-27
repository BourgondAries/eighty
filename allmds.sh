#! /bin/bash

	shopt -s globstar
	all=$(find . -name "*.md")
	for file in $all; do
		echo $file
		contents=$(cat $file | eighty)
		printf '%s' "$contents" > $file
	done
