#!/usr/bin/env sh

if [ $1 == "-h" ]; then
  printf "usage: :calc <equation>. For more information, see the manual of BC. \n"
  else
  /usr/bin/printf -- "%f \n" "$(bc -l ./lib/maths.bc <<< $1)"
fi
