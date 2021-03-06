#!/usr/bin/env bash

# This script was modified by Fábio Assunção <fabio23gt@gmail.com>
# Date 2018-02-12
# See the original in https://github.com/codecasts/ambientum/blob/master/installer.sh

################################################################################################################
#                                                                                                              #
# To automatically set codions/docker-commands on your terminal, please use:                                   #
# curl -sSL https://raw.githubusercontent.com/codions/docker-commands/master/setup.sh | bash                   #
#                                                                                                              #
################################################################################################################

# mode
set -e

# Detect user terminal
USER_SHELL=$(basename $SHELL)

# Detect operating system
OPERATIONAL_SYSTEM="$(uname -s)"

# If Upgrade is set, do not auto register for auto init
UPGRADE_ONLY=false

# enable all repositories if any specified
if [[ $1 == "upgrade" ]]; then
    UPGRADE_ONLY=true
fi

# define scripts url
############################################################################################################################
# For manual installation use                                                                                              #
# 1 - curl https://raw.githubusercontent.com/codions/docker-commands/master/commands/commands.bash -o ~/.codionsdocker_rc  #
# 2 - source ~/.codionsdocker_rc                                                                                           #
############################################################################################################################
BASH_SCRIPT_URL="https://raw.githubusercontent.com/codions/docker-commands/master/commands/commands.bash"
ZSH_SCRIPT_URL="https://raw.githubusercontent.com/codions/docker-commands/master/commands/commands.bash"
FISH_SCRIPT_URL="https://raw.githubusercontent.com/codions/docker-commands/master/commands/commands.fish"
GITBASH_SCRIPT_URL="https://raw.githubusercontent.com/codions/docker-commands/master/commands/commands.git-bash"


# greet
function greet() {
    echo -e "\n"
    echo -e "=========================================="
    echo -e "== codions/docker-commands Setup Script =="
    echo -e "=========================================="
    echo -e "\n\n"
}

function setup_fish() {
    # info
    echo -e "Setting up codions/docker-commands for Fish at ~/.codionsdocker_rc"

    # download script file
    curl -s $FISH_SCRIPT_URL > ~/.codionsdocker_rc

    # If not upgrade, auto source file
    if [ $UPGRADE_ONLY == false ]; then
        echo "source ~/.codionsdocker_rc" >> ~/.config/fish/config.fish
    fi

    echo -e "Congratulations, codions/docker-commands successfully configured Fish\n\n"
}

function setup_bash() {
    # info
    echo -e "Setting up codions/docker-commands for Bash"

    # download script file
    curl -s $BASH_SCRIPT_URL > ~/.codionsdocker_rc

    # If not upgrade, auto source file
    if [ $UPGRADE_ONLY == false ]; then
        echo "source ~/.codionsdocker_rc" >> ~/.bashrc
    fi

    echo -e "Congratulations, codions/docker-commands successfully configured Bash\n\n"
}

function setup_zsh() {
    # info
    echo -e "Setting up codions/docker-commands for ZSH"

    # download script file
    curl -s $ZSH_SCRIPT_URL > ~/.codionsdocker_rc

    # If not upgrade, auto source file
    if [ $UPGRADE_ONLY == false ]; then
        echo "source ~/.codionsdocker_rc" >> ~/.zshrc
    fi

    echo -e "Congratulations, codions/docker-commands successfully configured ZSH\n\n"
}

function setup_gitbash() {
    # info
    echo -e "Setting up codions/docker-commands for Git Bash (Windows)"

    # download script file
    curl -s $GITBASH_SCRIPT_URL > ~/.codionsdocker_rc

    # not automatically yet
    echo "Please, manually source ~/.codionsdocker_rc"
}

# Welcome users
greet

# depending on shell, trigger the correct setup function
case "$USER_SHELL" in
    "bash")
        setup_bash
        ;;
    "fish")
        setup_fish
        ;;
    "zsh")
       setup_zsh
       ;;
    "gitbash")
        setup_gitbash
        ;;
    *)
        #
    ;;
esac

echo -e "\n\ncodions/docker-commands is set to automatically be sources at terminal session start.\n"

if [ $UPGRADE_ONLY == false ]; then
    echo -e "In case of codions/docker-commands commands are not working, please use:\n"
    echo -e "source ~/.codionsdocker_rc\n\n"
fi