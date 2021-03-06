#!/usr/bin/env sh

link="$(sed 's;.*\(http[^ ]*\).*;\1;' <<< "$1")"
turl="$(curl -s "http://api.bitly.com/v3/shorten?login=pancakesbot&apiKey=R_ac2adceb07f01d8faca52bb77c67293b&longUrl=${link%#*}&format=txt")"
(( ${#link} > 80 )) && tiny=1 || tiny=0

# handle youtube links
link="$(sed 's;.*youtube\..*v=\([^&]\+\).*;http://youtube.com/embed/\1;' <<< "$link")"
link="$(sed 's;.*youtu\.be/\(.\+\);http://youtube.com/embed/\1;' <<< "$link")"

titl="$(curl -s "$link" | sed -n 's;.*<title>\([^<]*\)</title>.*;\1;p')"
(( tiny )) && printf -- "%s :: %s\n" "$turl" "$titl" || printf -- "%s\n" "$titl"
