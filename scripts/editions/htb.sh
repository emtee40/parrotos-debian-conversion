#!/bin/bash

source scripts/install_packages.sh

htb() {
    local htb_packages
    mapfile -t htb_packages < config/htb-packages.txt

    install_packages "${htb_packages[@]}"
    echo "[!] Hack The Box Edition packages installation completed successfully."
}
