# switch php version

Switching between PHP versions in macOS via a bash script involves updating the symbolic links that point to the desired PHP version binaries. Here's a basic script to accomplish that:


`#!/bin/bash

# Define the PHP versions and their installation paths
PHP_VERSIONS=(
    "7.4"
    "8.0"
    # Add more versions if needed
)

PHP_INSTALL_PATH="/usr/local/php"

# Check if a valid PHP version is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 [php_version]"
    echo "Available PHP versions:"
    echo "${PHP_VERSIONS[@]}"
    exit 1
fi

# Check if the provided PHP version is installed
if [[ ! " ${PHP_VERSIONS[@]} " =~ " $1 " ]]; then
    echo "PHP version $1 is not installed."
    exit 1
fi

# Remove the existing symlink
if [ -L "/usr/local/bin/php" ]; then
    sudo rm /usr/local/bin/php
fi

# Create a new symlink to the desired PHP version binary
sudo ln -s "$PHP_INSTALL_PATH/$1/bin/php" /usr/local/bin/php

echo "Switched PHP version to $1"`
Save this script to a file (e.g., switch_php_version.sh) and make it executable using `chmod +x switch_php_version.sh`.

To switch between PHP versions, run the script with the desired PHP version as an argument. For example:


`./switch_php_version.sh 7.4`
This script assumes that you have PHP versions installed in /usr/local/php directory and that you're creating a symbolic link named php in /usr/local/bin pointing to the desired PHP version binary. Adjust the paths as needed based on your setup. Also, ensure you have necessary permissions to perform operations like creating symlinks (sudo might be needed).





