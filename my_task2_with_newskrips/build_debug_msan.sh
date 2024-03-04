#!/bin/bash

if ! clang -std=c99 -DDEBUG -fcolor-diagnostics -fsanitize=memory -fno-omit-frame-pointer -fPIE -pie -g ./*.c -o app.exe; then
	exit 1
fi

exit 0
