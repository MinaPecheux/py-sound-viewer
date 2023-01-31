#!/bin/sh
# =================================
# Sound viewer
# ------------
# [May 2020] - Mina PECHEUX
#
# Based on the work by Yu-Jie Lin
# (Public Domain)
# Github: https://gist.github.com/manugarri/1c0fcfe9619b775bb82de0790ccb88da

if [[ $# -lt 1 ]]; then
  echo "No input file provided :("
  exit 1
fi

INPUT=$1
ffmpeg -i $INPUT.wav -ac 2 ${INPUT}_stereo.wav
