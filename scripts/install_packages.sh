#!/bin/bash

# Function to install packages
install_packages() {
    if [ $# -eq 0 ]; then
        handle_error "No packages specified for installation."
    fi
    run "apt install -y $*" "Installing packages: $*"
}
