#!/bin/bash

source scripts/run.sh
source scripts/install_packages.sh

core() {
    local core_packages
    mapfile -t core_packages < config/core-packages.txt

    run "apt update" "Updating package lists"
    install_packages "${core_packages[@]}"
    run "wget -qO- https://deb.parrotsec.org/parrot/misc/parrotsec.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/parrot-archive-keyring.gpg" "Adding GPG key"
    run "cp config/etc/apt/sources.list /etc/apt/sources.list" "Copying sources.list"
    run "cp -r config/etc/apt/sources.list.d/* /etc/apt/sources.list.d" "Copying sources.list.d"
    run "cp config/etc/apt/listchanges.conf /etc/apt/listchanges.conf" "Copying listchanges.conf"
    run "apt update" "Updating package lists"
    run "cp config/etc/os-release /etc/os-release" "Copying os-release"
    run "apt update" "Updating package lists"
    run "apt upgrade -y" "Upgrading packages"
    run "apt install -y parrot-core" "Installing parrot-core"

    echo "[!] Core Edition packages installation completed successfully."
}