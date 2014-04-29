#!/usr/bin/env sh

UNI=${1:-"metric"}
LOC=${2:-"Batman"}

info="$(curl -s "http://api.openweathermap.org/data/2.5/find?q=$LOC&units=$UNI" | jq '.list[0].main' | sed -n -e "s/ //g; s/\"humidity\":/Humidité\ de\ /g p; s/\"temp\":/température\ de\ /g p" | awk 'BEGIN {ORS=" "} {print} END {print "\n"}')"

if [ "$1" == "-h" ]; then
  printf -- "usage: :temp <units> <location>. By default it's metric and Batman. \n"
else
  printf -- "%s \n" "$info"
fi
