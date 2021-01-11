#!/bin/bash
export DEVTOOLS_DIRECTORY="$HOME/.devtools"

# Install required software for devtools
setup_host() {
  apt-get install --quiet -y git
}

# Install devtools in user home directory
setup_devtools() {
  if [[ -d $DEVTOOLS_DIRECTORY ]]; then
    cd "$DEVTOOLS_DIRECTORY" || exit
    git fetch --all
    git reset --hard origin/main
  else
    mkdir -p "$DEVTOOLS_DIRECTORY"
    git clone https://github.com/1elf-me/devtools.git "$DEVTOOLS_DIRECTORY"
  fi

  chmod +x "$DEVTOOLS_DIRECTORY/devtools"

  if [[ ! -f "/usr/local/bin/devtools" ]]; then
    ln -s "$DEVTOOLS_DIRECTORY/devtools" /usr/local/bin/devtools
  fi
}

setup_host
setup_devtools
