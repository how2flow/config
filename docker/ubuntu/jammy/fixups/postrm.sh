#!/bin/bash

# configs after preinst.
# written by how2flow(Steve Jeong).

ID="${1:-user}"
PASSWORD="${2:-docker}"
GROUP="${3:-user}"

remove_app_configs() {
  local home="/home/"${ID}""
  local config_list=(".gitconfig" ".tmux.conf" ".vimrc")

  if [ -e "/postfix.sh" ]; then

    for idx in ${config_list[@]}; do
      rm -rf "${home}/${idx}"
    done
  fi
}

restore_default_bash_configs() {
  local bashrc="/home/${ID}/.bashrc"
  local default="/etc/skel/.bashrc"

  cp ${default} ${bashrc}
}

main() {
  remove_app_configs
  restore_default_bash_configs
}

main
