# acp5x-ucm-files
This repo is here to temporarily provide some missing ALSA configuration files needed to fix the audio on the ACP5x which the Steam Deck uses.

Using these ucm configs with kernel 6.1, I've been able to use the default sink with alsa, pulseaudio and pipewire on a fresh minimal Arch install on a Steam Deck.  CS35L41 DSP mode now works.  Everything seems to finally work as expected now.

The source of these files are from an [open PR in the ALSA Github](https://github.com/alsa-project/alsa-ucm-conf/pull/233) and are being redistributed unmodified and under the same license in an effort to fix the problem in the meantime.

An additional helper script is provided to install them, which hopefully works on most distros.

## Requirements
Only seems to work with kernel 6.1+, which is currently in testing/linux on Arch.

Tested kernels
- [x] 6.1.0-arch1-1
- [x] 6.1-rc8
- [x] 6.1-rc1
- [ ] 5.19
- [~] 5.15-arch
- [~] 5.13-arch
- [~] 5.11-arch

## Installing
Copy the files from `alsa` into their respetive share directories, which might be distro dependent.  On Arch, its `/usr/share/alsa`.

Or use the provided script

```
$ sudo ./install.sh
```
