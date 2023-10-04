#!/bin/bash

# Make this script executable
# >>> chmod +x ~/script/prepare_apps.sh
# >>> bash ~/script/prepare_apps.sh

# Check if Homebrew is installed, and install it if not
if ! command -v brew &>/dev/null; then
    echo -e ">>> ❌ Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo -e ">>> ✅ Homebrew is already installed."
fi

echo -e ">>> ✅ Homebrew checks competed."

echo -e ">>> =================================================="

# List of applications to install via Homebrew
apps_to_install=(
    autojump
    rm-improved
    bat
    yabai
    bun
    nvm
    minio
    luajit
    neovim
    pyenv
    yamlfmt
    yarn
    alacritty
    karabiner-elements
    font-sf-mono-nerd-font-ligaturized
    spaceid
    orbstack
)

echo -e ">>> Preparing homebrew apps..."

# Loop through the list and install the applications
for app in "${apps_to_install[@]}"; do
    if brew list "$app" &>/dev/null; then
        echo -e ">>> ✅ $app is already installed."
    else
        echo -e ">>> Installing $app..."
        brew install "$app"
    fi
done

echo -e ">>> ✅ All apps has been installed."

echo -e ">>> =================================================="

echo -e ">>> Preparing nvm..."

# Source NVM to make it available in the current shell
source ~/.nvm/nvm.sh

# Check if Node.js is already installed
if ! nvm ls | grep -q "lts/*"; then
    # Install the latest LTS version of Node.js
    echo -e ">>> Installing the latest LTS version of Node.js..."
    nvm install --lts

    # Set the latest LTS version as the default
    nvm alias default "lts/*"
else
    echo -e ">>> ✅ Node.js (LTS) is already installed."
fi

# Display Node.js and NPM versions
echo -n ">>> Node.js version: "; node -v

echo -n ">>> NPM version: "; npm -v

echo -e ">>> ✅ Apps preparation completed."
