#!/bin/bash

# written by how2flow(Steve Jeong).

DISTRO=""

install_packages() {
  # prefix pacakges: git sudo ssh tmux vim wget
  apt-get update && apt-get install -y --no-install-recommends git sudo ssh tmux vim wget

  # installl certificates
  apt-get install --reinstall -y ca-certificates
  
  if [ -x "$(command -v brltty)" ]; then
    apt-get remove brltty
  fi

  echo "Finish install base pacakges"
}

ssh_config() {
  local release=$(cat /etc/*-release)
  local ssh_config="/etc/ssh/ssh_config"

  DISTRO="${release##*=}"
  case "${DISTRO}" in
    jammy)
      if [ -x "$(command -v ssh)" ]; then
        echo "    HostKeyAlgorithms +ssh-rsa" >> "${ssh_config}"
        echo "    PubkeyAcceptedKeyTypes +ssh-rsa" >> "${ssh_config}"
      fi
      ;;
  esac

  echo "Finish ssh config"
}

main() {
  install_packages
  ssh_config
}

main
