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

}

function security() {

}

function htb() {

}