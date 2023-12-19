#!/bin/bash

# Make this script executable
# >>> chmod +x ~/script/prepare_apps.sh
# >>> bash ~/script/prepare_apps.sh

echo -e "🖐️ --- Checking Homebrew... -------------------------------------------------------"

# Check if Homebrew is installed, and install it if not
if ! command -v brew &>/dev/null; then
    echo -e "\t ❌ Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo -e "\t ✅ Homebrew is installed successfully"
else
    echo -e "\t ✅ Homebrew is already installed"
fi

echo -e "✅ --- Homebrew Checks Completed --------------------------------------------------"

echo

# List of formulae to install via Homebrew

to_tap=(
    homebrew/cask-fonts
    homebrew/services
    koekeishiya/formulae
    microsoft/git
    minio/stable
    oven-sh/bun
    stripe/stripe-cli
)

formulaes_to_install=(
    autojump
    bat
    bun
    lazygit
    lsd
    luajit
    minio
    neovim
    nvm
    pnpm
    pyenv
    rm-improved
    skhd
    yabai
    yadm
    yamlfmt
    yarn
    fd
    pngpaste
    tmux
    fzf
)

# List of casks to install via Homebrew
casks_to_install=(
    alacritty
    font-geist-mono-nerd-font
    git-credential-manager
    karabiner-elements
    orbstack
    spaceid
    appcleaner
    stats
    onyx
    keka
    kekaexternalhelper
    imageoptim
    dozer
    whatsapp
)

echo -e "🖐️  --- Preparing Homebrew Taps ------------------------------------------------"
# Loop through the list and install the applications
for tap in "${to_tap[@]}"; do
    if brew tap "$tap" &>/dev/null; then
        echo -e "\t ✅ $tap is already tapped."
    else
        echo -e "\t Installing $tap..."
        brew tap "$tap"
    fi
done

echo -e "✅ --- All Homebrew Taps are installed -----------------------------------------"

echo -e "🖐️  --- Preparing Homebrew Formulaes ------------------------------------------------"
# Loop through the list and install the applications
for formulae in "${formulaes_to_install[@]}"; do
    if brew list "$formulae" &>/dev/null; then
        echo -e "\t ✅ $formulae is already installed."
    else
        echo -e "\t Installing $formulae..."
        brew install "$formulae"
    fi
done

echo -e "✅ --- All Homebrew Formulaes are installed -----------------------------------------"

echo

echo -e "🖐️  --- Preparing Homebrew Casks ----------------------------------------------------"

# Loop through the list and install the applications
for cask in "${casks_to_install[@]}"; do
    if brew list "$cask" &>/dev/null; then
        echo -e "\t ✅ $cask is already installed."
    else
        echo -e "\t Installing $cask..."
        brew install --cask "$cask"
    fi
done

echo -e "✅ --- All Homebrew Casks are installed --------------------------------------------"

echo

echo -e "🖐️  --- Setting up NVM -------------------------------------------------------------"

# Source NVM to make it available in the current shell
source ~/.nvm/nvm.sh

# Check if Node.js is already installed
if ! nvm ls | grep -q "lts/*"; then
    # Install the latest LTS version of Node.js
    echo -e "\t Installing the latest LTS version of Node.js..."
    nvm install --lts

    # Set the latest LTS version as the default
    nvm alias default "lts/*"
    echo -e "\t ✅ Node.js (LTS) is installed succesfully."
else
    echo -e "\t ✅ Node.js (LTS) is already installed."
fi

# Display Node.js and NPM versions
echo -n -e "\t Node.js version: "
node -v

echo -n -e "\t NPM version: "
npm -v

echo -e "✅ --- NVM setup completed --------------------------------------------------------"

echo

echo -e "✅ --- You're good to go now ------------------------------------------------------"
