#!/bin/sh
# =================================
# Sound viewer
# ------------
# [May 2020] - Mina PECHEUX
#
# Based on the work by Yu-Jie Lin
# (Public Domain)
# Github: https://gist.github.com/manugarri/1c0fcfe9619b775bb82de0790ccb88da

display_usage() {
  echo ""
  echo "usage :"
  echo "$0 [--help] -a audio_input -v video_input [-o output_file]"
  echo ""
  echo "-a/--audio: name of the audio file to add to the video (WITHOUT its extension)"
  echo "-v/--video: name of the video file to add audio to (WITHOUT its extension)"
  echo "-o/--output: name of the processed (merged) file (WITHOUT its extension)"
  echo ""
}

for key in "$@"
do

case $key in
  --help|-h)
  echo help
  display_usage
  exit 0
  shift
  ;;
  --audio|-a)
  AUDIO=$2
  shift
  ;;
  --video|-v)
  VIDEO=$2
  shift
  ;;
  --output|-o)
  OUTPUT=$2
  shift
  ;;
  *)    # unknown option
  shift
  ;;
esac
done

if [[ -z $AUDIO ]]; then
  echo "No audio input file provided :("
  exit 1
fi

if [[ -z $VIDEO ]]; then
  echo "No video input file provided :("
  exit 1
fi

if [[ -z $OUTPUT ]]; then
  OUTPUT="${VIDEO}_processed"
  echo "Output name auto-generated: $OUTPUT"
fi

ffmpeg -i ${VIDEO}.mp4 -i ${AUDIO}.wav -c:v copy -map 0:v:0 -map 1:a:0 -c:a aac -b:a 192k ${OUTPUT}.mp4
