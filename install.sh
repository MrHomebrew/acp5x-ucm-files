#!/bin/sh

local src_config_dir="alsa/ucm2/AMD/acp5x/"
local alsa_ucm2_dir="/usr/share/alsa/ucm2/"
local alsa_ucm2_config_dir="/usr/share/alsa/ucm2/conf.d/"

# Make sure ucm2 directory exists
if [ ! -d "${alsa_ucm2_dir}" ]; then
    printf "%s" "Directory ${alsa_ucm2_dir} does not exist."
    printf "%s" "Aborting."
    exit 1
fi

# Make sure ucm2 config dir exists
if [ ! -d "${alsa_ucm2_config_dir}" ]; then
    printf "%s" "Directory ${alsa_ucm2_config_dir} does not exist."
    printf "%s" "Aborting."
    exit 2
fi

# Make sure src config dir exists relative to cwd
if [ ! -d "${src_config_dir}" ]; then
    printf "%s" "Directory ${src_config_dir} does not exist."
    printf "%s" "Aborting."
    exit 3
fi

# Create directories
sudo mkdir -p "${alsa_ucm2_dir}/AMD/acp5x/"
sudo mkdir -p "${alsa_ucm2_config_dir}/acp5x/"

# Copy config files into appropriate directory
sudo cp "${src_config_dir}/acp5x.conf" "${alsa_ucm2_dir}/AMD/acp5x/"
sudo cp "${src_config_dir}/HiFi.conf" "${alsa_ucm2_dir}/AMD/acp5x/"

# Create symlink
cd "${alsa_ucm2_config_dir}/acp5x/"
sudo ln -s "../../AMD/acp5x/acp5x.conf"

# Done
printf "%s" "Done."

