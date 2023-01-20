#!/bin/bash

jq '.[]' flashcards.json  | jq -r -s 'add | .[]' | xargs -t -I {} say -o "audio/{}.aiff" {}
jq '.[]' flashcards.json  | jq -r -s 'add | .[]' | xargs -t -I {} ffmpeg -y -i audio/{}.aiff audio/{}.mp3
#jq '.[]' flashcards.json  | jq -r -s 'add | .[]' | xargs -t -I {} base64 -i audio/{}.mp3 -o audio/{}.mp3.base64