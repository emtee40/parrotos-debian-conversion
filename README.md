# Debian Conversion Script

## Overview

**Debian Conversion Script** is an installer script for ParrotOS. This project stands as a replacement for the [alternate-install](https://github.com/ParrotSec/alternate-install) which is no longer maintained. It is updated to the latest Parrot release.

## How to Use

Using this script is quite simple. Follow the steps below:

1. **Open a terminal window**
2. **Clone this repository**

   ```bash
   git clone https://gitlab.com/parrotsec/project/debian-conversion-script.git
   cd debian-conversion-script
   sudo chmod +x ./install.sh
   ./install.sh
   ```

## Menu Options

Upon running the script, a menu will appear:

    ========== ParrotOS Editions Installer ==========
    1) Install Core Edition
    2) Install Home Edition
    3) Install Security Edition
    4) Install Hack The Box Edition
    5) Install headless packages
    6) Exit
    =================================================

Choose the desired option by typing the corresponding number (e.g., type 1 to install the Core Edition packages).

## Available Editions

- **Core Edition**: Installs the minimal base system without any graphical interface or additional tools. Ideal for advanced users who want to customize their installation.

- **Home Edition**: Installs a user-friendly environment with a complete suite of daily use applications, including office software, multimedia tools, and general utilities.

- **Security Edition**: Installs a comprehensive suite of security tools and utilities for penetration testing, forensics, and vulnerability assessment.

- **Hack The Box Edition**: Installs tools and configurations optimized for use with Hack The Box, a popular online platform for practicing penetration testing and ethical hacking.

- **Headless packages**: Installs necessary packages for running ParrotOS without a graphical interface. Suitable for servers and remote systems.

## Compatibility

This script has been tested on Debian 12, including virtual machines and Docker containers.

## Contributions

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.
