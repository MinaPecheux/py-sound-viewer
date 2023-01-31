# Sound Viewer (Python)

_[May 2020 - Update in Jan 2023]_

**Acknowledgments:** Based on the work by Yu-Jie Lin
(Public Domain)
Github: https://gist.github.com/manugarri/1c0fcfe9619b775bb82de0790ccb88da

**License:** CC0 (Public Domain) _- see the file in the archive for more info_

## TL;DR

![demo](demo.gif)

A test audio file of some fingers snapping is provided with the scripts to easily try out the project (it will create the video above).

Here is the entire process to get a fully finished video:

  0. (optional) Start a virtual environment
  1. Install the Python packages:

      ```~$ pip install -r requirements.txt```

  2. Convert the test audio file, which is mono, to stereo:

      ```~$ bash convert_to_stereo.sh test```

  3. Create the video from the sound file:

      ```~$ python main.py -m bars -c "#ddddff" --output test_stereo```

  4. Merge the video and the audio:

      ```~$ bash add_audio_to_video.sh -a test_stereo -v test_stereo```

  5. Your final video is now available: it's the `test_stereo_processed.mp4` file :)

## Options

The Python script accepts the following options:

- `-m`/`--method`: the type of graph to create - can be: `bars`, `spectrum`, `wave` or `rain`
- `-c`/`--color`: the color of the visualizatio - can be a specific color in hexadecimal format (e.g. `"#ddddff"`) or `"hue_rotate"` _(default)_ to have the color auto-update throughout the film
- `--output`/`--no-output`: whether to save the result in a file or display it directly

## Disclaimers
  - All bash scripts use ffmpeg, so you need to install it first if you don't have it yet (https://ffmpeg.org/).
  - For now, the project only works with .wav and .mp4 files.
  - All scripts and commands except file names WITHOUT their extension.
  - The Python script doesn't automatically merge the audio and video (see step 4).
