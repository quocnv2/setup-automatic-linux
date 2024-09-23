#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install essential development tools
echo "Installing essential development tools..."
sudo apt-get install -y build-essential curl wget git software-properties-common

# Install Git and configure user if not installed
if command_exists git; then
    echo "Git is already installed. Skipping..."
else
    echo "Installing Git..."
    sudo apt-get install -y git]
    # Configure Git with your name and email if not done already
    # git config --global user.name "Your Name"
    # git config --global user.email "your.email@example.com"
fi

# Install NVM (Node Version Manager) if not installed
if [ -d "$HOME/.nvm" ]; then
    echo "NVM is already installed. Skipping..."
else
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
    # Load NVM
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install Node.js (LTS Version) using NVM if not installed
if command_exists node; then
    echo "Node.js is already installed. Skipping..."
else
    echo "Installing Node.js (LTS version)..."
    nvm install --lts
    nvm alias default 'lts/*'
fi

# Install Python and related tools if not installed
if command_exists python3 && command_exists pip3; then
    echo "Python and pip are already installed. Skipping..."
else
    echo "Installing Python and related tools..."
    sudo apt-get install -y python3 python3-pip python3-venv
    pip3 install --upgrade pip
fi

# Install Docker if not installed
if command_exists docker; then
    echo "Docker is already installed. Skipping..."
else
    echo "Installing Docker..."
    sudo apt-get remove -y docker docker-engine docker.io containerd runc
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
fi

# Install Docker Compose if not installed
if command_exists docker-compose; then
    echo "Docker Compose is already installed. Skipping..."
else
    echo "Installing Docker Compose..."
    DOCKER_COMPOSE_VERSION="1.29.2"
    sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Install VS Code if not installed
if command_exists code; then
    echo "Visual Studio Code is already installed. Skipping..."
else
    echo "Installing Visual Studio Code..."
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt-get update -y
    sudo apt-get install -y code
fi

# Install Google Chrome if not installed
if command_exists google-chrome-unstable; then
    echo "Google Chrome Dev is already installed. Skipping..."
else
    echo "Installing Google Chrome Dev..."
    wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb
    sudo apt install -y ./google-chrome-unstable_current_amd64.deb
    rm google-chrome-unstable_current_amd64.deb
fi



# Install MySQL and PostgreSQL if not installed
if command_exists mysql && command_exists psql; then
    echo "MySQL and PostgreSQL are already installed. Skipping..."
else
    echo "Installing MySQL and PostgreSQL..."
    sudo apt-get install -y mysql-server mysql-client
    sudo apt-get install -y postgresql postgresql-contrib
fi

# Install Redis if not installed
if command_exists redis-server; then
    echo "Redis is already installed. Skipping..."
else
    echo "Installing Redis..."
    sudo apt-get install -y redis-server
fi

# Install common tools if not installed
if command_exists htop && command_exists vim && command_exists tmux && command_exists zsh; then
    echo "Common tools (htop, vim, tmux, zsh) are already installed. Skipping..."
else
    echo "Installing additional tools..."
    sudo apt-get install -y htop vim tmux zsh
fi

# Install Oh My Zsh if not installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed. Skipping..."
else
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Snap and common snaps if not installed
if command_exists snap; then
    echo "Snap is already installed. Installing common snaps..."
    snap_installed() {
        snap list | grep "$1" >/dev/null 2>&1
    }
    if snap_installed postman; then
        echo "Postman is already installed. Skipping..."
    else
        sudo snap install postman
    fi
    if snap_installed slack; then
        echo "Slack is already installed. Skipping..."
    else
        sudo snap install slack --classic
    fi
    if snap_installed spotify; then
        echo "Spotify is already installed. Skipping..."
    else
        sudo snap install spotify
    fi
else
    echo "Installing Snap..."
    sudo apt install -y snapd
    sudo snap install postman
    sudo snap install slack --classic
    sudo snap install spotify
fi

# Install Heroku CLI if not installed
if command_exists heroku; then
    echo "Heroku CLI is already installed. Skipping..."
else
    echo "Installing Heroku CLI..."
    curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
fi


# Clean up
echo "Cleaning up..."
sudo apt-get autoremove -y && sudo apt-get clean

echo "Development environment setup completed successfully. Please restart your terminal or log out and log in again to apply changes."
