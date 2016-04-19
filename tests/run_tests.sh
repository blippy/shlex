#!/usr/bin/env bash
PATH=../src:$PATH

run () {
	echo "====================================================="
	echo "Running input: $1"
	shlex <$1
	echo "Run finished"
	echo
}

run in/in01.txt
run in/in02.txt
