#!/bin/bash

#Pre-Installation

# Connect to the Internet
# wifi-menu

# Update the system clock
timedatectl set-ntp true

# Partition the disks
parted /dev/sda mklabel gpt
echo "mkpart ESP fat32 1MiB 200MiB
set 1 boot on
mkpart primary ext4 200MiB 100%
quit
" | parted /dev/sda

# Format the partitions
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

# Mount the partitions
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

# Select the mirrors
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
grep -E -A 1 ".*Germany.*$" /etc/pacman.d/mirrorlist.bak | sed '/--/d' > /etc/pacman.d/mirrorlist

# Install the base packages
pacstrap -i /mnt base base-devel

# Configure the system
genfstab -U /mnt > /mnt/etc/fstab

# Copy the scripts to the new system
cp -R ~/Installation/ /mnt/

# Change root into the new system and start second Script
echo "Execute Arch-Installation.sh"
arch-chroot /mnt /bin/bash
