#!/bin/bash

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

echo "Switched PHP version to $1"
