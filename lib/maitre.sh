#!/usr/bin/env sh

maitre="Saucisse"

est()
{
	if [ "$1" == "$maitre" ]; then
		true
	else
		false
	fi
}
