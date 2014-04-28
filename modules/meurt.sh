#!/usr/bin/env sh

source ./lib/maitre.sh

if est $1 ; then
  # Ça ne tue que le robot, hein... ?
  printf -- "/quit \n" && killall bash && killall ii
else
  printf -- "Tu n'es pas mon maître. \n"
fi
