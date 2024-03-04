#!/bin/bash

status="0"

pass="\033[1;32mPASS\033[0m"
fail="\033[1;31mFAIL\033[0m"

one_level_tab="    "

verbose_opt="-v"

prefix="build"
builds=("release" "debug" "debug_asan" "debug_msan" "debug_ubsan")

for build in "${builds[@]}"; do
	if [ $status == "0" ]; then
		#./clean.sh
		if t_output=$(./build_"$build".sh 2>&1); then
			echo -e "$tabs""$prefix" "$build": "$pass"
		else
			status="1"
			echo -e "$tabs""$prefix" "$build": "$fail"
		fi

		if [ "$verbose_opt" == '-v' ]; then
			if [ -n "$t_output" ]; then
				while IFS= read -r line; do
					echo -e "$tabs""$one_level_tab""$line"
				done <<< "$t_output"
			fi
		fi
	fi
done

exit $status
