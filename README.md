# acp5x-ucm-files
This repo is here to temporarily provide some missing ALSA configuration files needed to fix the audio on the ACP5x which the Steam Deck uses.

The source of these files are from an [open PR in the ALSA Github](https://github.com/alsa-project/alsa-ucm-conf/pull/233) and are being redistriubed unmodified and under the same license in an effort to fix the problem in the meantime.

An additional helper script is provided to install them, which, hopefully, works on most distros.

## Installing
Copy the files from `alsa` into their respetive share directories, which might be distro dependent.  On Arch, its `/usr/share/alsa`.

Or use the provided script

```
$ sudo ./install.sh
```
