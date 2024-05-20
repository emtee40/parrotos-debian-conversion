#!/bin/bash

source scripts/install_packages.sh

security() {
    local security_packages
    mapfile -t security_packages < config/security-packages.txt

    install_packages "${security_packages[@]}"
    echo "[!] Security Edition packages installation completed successfully."
}
