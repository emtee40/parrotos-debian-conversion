#!/bin/bash

# Function to check if the user is root
function check_sudo() {
    if [ "$(id -u)" != 0 ]; then
        echo "Error: This script requires sudo privileges. Please run it with sudo." >&2
        exit 1
    fi
}

# Function to handle errors
function handle_error() {
    local error_message="$1"
    echo "Error: $error_message" >&2
    exit 1
}

# Function to execute a command and handle errors
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

# Function to install packages
function install_packages() {
    local packages=("$@")

    if [ ${#packages[@]} -eq 0 ]; then
        handle_error "No packages specified for installation."
    fi

    run "apt install -y ${packages[*]}" "Installing packages: ${packages[*]}"
}

# Function to install Core Edition packages
function core() {
    local core_packages=(
        bash 
        wget 
        gnupg
    )

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

# Function to install Home Edition packages
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
        parrot-themes
        parrot-displaymanager
        firefox-esr
        parrot-firefox-profiles
        vscodium
    )

    install_packages "${home_packages[@]}"
    echo "[!] Home Edition packages installation completed successfully."
}

# Function to install Security Edition packages
function security() {
    local security_packages=(
        parrot-interface-home
        desktop-base
        base-files
        anonsurf
        parrot-drivers
        parrot-menu
        parrot-desktop-mate
        parrot-wallpapers
        parrot-tools-full
        parrot-themes
        parrot-displaymanager
        firefox-esr
        parrot-firefox-profiles
        vscodium
    )

    install_packages "${security_packages[@]}"
    echo "[!] Security Edition packages installation completed successfully."
}

# Function to install Hack The Box Edition packages
function htb() {
    local htb_packages=(
        parrot-interface-home
        desktop-base
        base-files
        anonsurf
        parrot-drivers
        parrot-menu
        parrot-desktop-mate
        parrot-wallpapers
        parrot-tools-full
        parrot-themes
        parrot-displaymanager
        hackthebox-icon-theme
        win10-icon-theme
        firefox-esr
        parrot-firefox-profiles
        vscodium
    )

    install_packages "${htb_packages[@]}"
    echo "[!] Hack The Box Edition packages installation completed successfully."
}

# Function to install headless edition packages
function headless() {
    local headless_packages=(
        parrot-core-lite
        base-files
        parrot-apps-basics
        parrot-drivers
    )

    install_packages "${headless_packages[@]}"
    echo "[!] Headless installation completed successfully."
}

# Function to display menu
function display_menu() {
    echo "========== ParrotOS Editions Installer =========="
    echo "1) Install Core Edition: Minimal installation for server use."
    echo "2) Install Home Edition: Full desktop environment for daily use."
    echo "3) Install Security Edition: Tools for security testing and auditing."
    echo "4) Install Hack The Box Edition: Customized environment for Hack The Box labs."
    echo "5) Install Headless Edition: Minimal installation without GUI for servers."
    echo "6) Exit"
    echo "================================================="
}

# Main script

check_sudo
while true; do
    display_menu
    read -p "Enter the option number: " option

    case $option in
        1) core ;;
        2) home ;;
        3) security ;;
        4) htb ;;
        5) headless ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
