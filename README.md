# acp5x-ucm-files
This repo is here to temporarily provide some missing ALSA UCM configuration files needed to fix the audio on the ACP5x which the Steam Deck uses.

The source of these files are from an [open PR in the ALSA Github](https://github.com/alsa-project/alsa-ucm-conf/pull/233) and are being redistributed unmodified and under the same license in an effort to fix the problem in the meantime.

An additional helper script is provided to install them, which hopefully works on most distros.

## Notice
It is worth mentioning that Valve has **still not submitted** the ALSA UCM configurations SteamOS uses to upstream (and a whole bunch of other stuff), even 1.5+ years after being in use.  Instead Valve is hiding all their work on their GPL-violating private gitlab instance, where they're modifying open-source-licenced code, but not making their modifications publically available, and refusing to comply with GPL source requests.  Another gitlab user has created an unofficial mirror by taking apart packages from the SteamOS repo, which can be found [here](https://gitlab.com/evlaV).  Valve refuses to comply with license requirements and open practices for Linux distrubutions.  Valve also refuses to provide any open documentation of the hardware they sell, which is critical to allowing them to be operated with free software.  They're objectively worse than nvidia.

Valve is not a good Linux citizen, folks.

## Requirements
Only seems to work with kernel 6.1+, which is currently in testing/linux on Arch.

## Testing
Using these ucm configs with kernel 6.1, I've been able to use the default sink with alsa, pulseaudio and pipewire on a fresh minimal Arch install on a Steam Deck.  CS35L41 DSP mode now works.  Everything seems to finally work as expected now.

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
