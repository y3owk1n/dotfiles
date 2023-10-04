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

# List of applications to install via Homebrew
apps_to_install=(
	alacritty
	autojump
	bat
	bun
	font-sf-mono-nerd-font-ligaturized
	git-credential-manager-core
	karabiner-elements
	lazygit
	lsd
	luajit
	minio
	neovim
	nvm
	orbstack
	pnpm
	pyenv
	rm-improved
	skhd
	spaceid
	yabai
	yadm
	yamlfmt
	yarn
)

echo -e "🖐️  --- Preparing Homebrew Apps ----------------------------------------------------"

# Loop through the list and install the applications
for app in "${apps_to_install[@]}"; do
	if brew list "$app" &>/dev/null; then
		echo -e "\t ✅ $app is already installed."
	else
		echo -e "\t Installing $app..."
		brew install "$app"
	fi
done

echo -e "✅ --- All Homebrew apps are installed --------------------------------------------"

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
