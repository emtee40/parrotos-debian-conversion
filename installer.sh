#!/bin/bash

# Check if the user ID is not 0 (not root)
function check_sudo() {
    if [ "$(id -u)" != 0 ]; then
        echo "Error: This script requires sudo privileges. Please run it with sudo."
        exit 1
    fi
}

#### Main functions ####

function core() {

}

function home() {

}

function security() {

}

function htb() {

}