#!/bin/bash

if ! clang -std=c99 -DDEBUG -fcolor-diagnostics -fsanitize=undefined -fno-omit-frame-pointer -g ./*.c -o app.exe; then
	exit 1
fi

exit 0
