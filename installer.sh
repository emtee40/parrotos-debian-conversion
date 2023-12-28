#!/bin/bash

# Check if the user ID is not 0 (not root)
function check_sudo() {
    if [ "$(id -u)" != 0 ]; then
        echo "Error: This script requires sudo privileges. Please run it with sudo."
        exit 1
    fi
}

# Prints an error message and exits the script
function handle_error() {
    local error_message="$1"
    echo "Error: $error_message"
    exit 1
}

# Executes a command and handles errors
function run() {
    local command="$1"
    local description="$2"

    echo "Executing: $description"

    eval "$command"
    local exit_code=$?

    if [ $exit_code -ne 0 ]; then
        handle_error "Command failed: $description"
    fi
}

# Main functions

# Description: Installs a list of packages.
function install_packages() {
    local packages=("$@")

    # Ensure there are packages to install
    if [ ${#packages[@]} -eq 0 ]; then
        handle_error "No packages specified for installation."
    fi

    # Install the specified packages
    run "apt install -y ${packages[*]}" "Installing packages: ${packages[*]}"
}

# Installs the Parrot OS Core packages.
function core() {
    run "apt update" "updating package lists"
    run "apt install -y bash wget gnupg" "installing required packages"

    run "wget -qO- https://deb.parrotsec.org/parrot/misc/parrotsec.gpg | apt-key add -" "adding GPG key"

    run "cp /etc/apt/sources.list /etc/apt/sources.list" "copying sources.list"
    run "cp -r /etc/apt/sources.list.d/* /etc/apt/sources.list.d" "copying sources.list.d"
    run "cp /etc/apt/listchanges.conf /etc/apt/listchanges.conf" "copying listchanges.conf"

    run "apt update" "updating package lists"

    run "cp /etc/os-release /etc/os-release" "copying os-release"
    run "apt update" "updating package lists"
    run "apt upgrade -y" "upgrading packages"

    run "apt install -y parrot-core" "installing parrot-core"

    echo "ParrotOS Core installation completed successfully."
}

function home() {
    local home_packages=(
        parrot-interface-home
        desktop-base
        base-files
        anonsurf
        parrot-drivers
        parrot-menu
        parrot-desktop-mate
        parrot-wallpapers
        parrot-meta-privacy
        parrot-configs-zsh
        parrot-displaymanager
        firefox
        vscodium
    )

    install_packages "${home_packages[@]}"
}

function security() {

}

function htb() {

}