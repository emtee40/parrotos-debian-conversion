#!/bin/bash

source scripts/install_packages.sh

headless() {
    local headless_packages
    mapfile -t headless_packages < config/headless-packages.txt

    install_packages "${headless_packages[@]}"
    echo "[!] Headless installation completed successfully."
}
