#!/bin/sh

src_config_dir="alsa/ucm2/AMD/acp5x/"
alsa_ucm2_dir="/usr/share/alsa/ucm2/"
alsa_ucm2_config_dir="/usr/share/alsa/ucm2/conf.d/"

printf "%s\n" "Checking environment..."

# Make sure ucm2 directory exists
if [ ! -d "${alsa_ucm2_dir}" ]; then
    printf "%s\n" "Directory ${alsa_ucm2_dir} does not exist."
    printf "%s\n" "Aborting."
    exit 1
fi

# Make sure ucm2 config dir exists
if [ ! -d "${alsa_ucm2_config_dir}" ]; then
    printf "%s\n" "Directory ${alsa_ucm2_config_dir} does not exist."
    printf "%s\n" "Aborting."
    exit 2
fi

# Make sure src config dir exists relative to cwd
if [ ! -d "${src_config_dir}" ]; then
    printf "%s\n" "Directory ${src_config_dir} does not exist."
    printf "%s\n" "Aborting."
    exit 3
fi

# Create directories
printf "%s\n" "Creating directories..."
if ! mkdir -p "${alsa_ucm2_dir}/AMD/acp5x/"; then
    printf "%s\n" "Failed to create directory."
    printf "%s\n" "Aborting."
    exit 4
fi

if ! mkdir -p "${alsa_ucm2_config_dir}/acp5x/"; then
    printf "%s\n" "Failed to create directory."
    printf "%s\n" "Aborting."
    exit 5
fi

# Copy config files into appropriate directory
printf "%s\n" "Copying files..."
if ! cp "${src_config_dir}/acp5x.conf" "${alsa_ucm2_dir}/AMD/acp5x/"; then
    printf "%s\n" "Failed to copy file: acp5x.conf."
    printf "%s\n" "Aborting."
    exit 6
fi

if ! cp "${src_config_dir}/HiFi.conf" "${alsa_ucm2_dir}/AMD/acp5x/"; then
    printf "%s\n" "Failed to copy file: HiFi.conf"
    printf "%s\n" "Aborting."
    exit 7
fi

# Create symlink
printf "%s\n" "Creating symlink..."
if ! cd "${alsa_ucm2_config_dir}/acp5x/"; then
    printf "%s\n" "Failed to change directory"
    printf "%s\n" "Aborting."
    exit 8
fi

if ! ln -sf "../../AMD/acp5x/acp5x.conf"; then
    printf "%s\n" "Failed to create symlink."
    printf "%s\n" "Aborting."
    exit 9
fi

# Done
printf "%s\n" "Success."

