#!/usr/bin/env bash
script_folder="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
workspaces_folder="/var/www/"

clone-repo()
{
    cd "${workspaces_folder}"
    if [ ! -d "${1#*/}" ]; then
        git clone "https://github.com/$1"
    else 
        echo "Already cloned $1"
    fi
}

# if [ "${CODESPACES}" = "true" ]; then
    # Remove the default credential helper
    sudo sed -i -E 's/helper =.*//' /etc/gitconfig

    # Add one that just uses secrets available in the Codespace
    git config --global credential.helper '!f() { sleep 1; echo "username=${GITHUB_USER}"; echo "password=${GITHUB_TOKEN}"; }; f'
# fi

repository='zyronix/hashtopolis-agent'
clone-repo "$repository"
