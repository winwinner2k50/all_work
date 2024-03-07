#!/bin/bash

status="0"

pass="\033[1;32mPASS\033[0m"
fail="\033[1;31mFAIL\033[0m"

one_level_tab="    "

# Check options
tabs=""
verbose_opt=""



prefix="testing on"
if [ $status == "0" ]; then
	builds=("debug" "debug_asan" "debug_msan" "debug_ubsan")
	for build in "${builds[@]}"; do
		./build_"$build".sh
		if t_output=$(./func_tests/scripts/func_tests.sh "$tabs""$one_level_tab" "$verbose_opt" 2>&1); then
			echo -e "$tabs""$prefix" "$build": "$pass"
		else
			status="1"
			echo -e "$tabs""$prefix" "$build": "$fail"
		fi
		if [ -n "$t_output" ]; then
			echo "$t_output"
		fi
	done
fi

exit $status
