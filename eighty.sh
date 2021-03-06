#! /bin/bash

	maxcharacters=80
	if [[ $# -eq 1 ]]; then
		maxcharacters=$1
	fi
	characters=0
	locked=0
	foundnewline=0

	while IFS= read -r -N 1 i; do
		if [[ $foundnewline -eq 1 ]]; then
			if [[ $i = $'\n' ]]; then
				printf '%s' $'\n\n'
				characters=0
			else
				printf '%s' " $i"
			fi
			foundnewline=0
		elif [[ $locked -eq 1 ]]; then
			if [[ $i = $'\n' ]]; then
				locked=0
			fi
			printf "%c" "$i"
		elif [[ "$characters" -eq "0" ]]; then
			if [[ "$i" = $'\t' ]]; then
				locked=1
			elif [[ $i != $'\n' ]]; then
				((characters += 1))
			fi
			printf "%c" "$i"

		else
			if [[ "$i" = $'\n' ]]; then
				((characters += 1))
				foundnewline=1
			else
				((characters += 1))
				if [[ $characters -gt $maxcharacters ]]; then
					if [[ "$i" = ' ' ]]; then
						printf '\n'
						characters=0
					else
						printf '%s' "$i"
					fi
				else
					printf '%s' "$i"
				fi
			fi
		fi
	done
