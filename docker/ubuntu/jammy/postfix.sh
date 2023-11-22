#!/bin/bash

# configs after preinst.
# written by how2flow(Steve Jeong).

ID="${1:-user}"
PASSWORD="${2:-docker}"
GROUP="${3:-user}"

download_app_configs() {
  local home="/home/"${ID}""

  if [ ! -d "${home}" ]; then
    echo "There is no account..."
  fi

  # download configs
  if [ -x "$(command -v wget)" ]; then
    wget -O "${home}"/.gitconfig $WGET_FLAG "https://raw.githubusercontent.com/how2flow/config/master/ubuntu/gitconfig"
    wget -O "${home}"/.tmux.conf $WGET_FLAG  "https://raw.githubusercontent.com/how2flow/config/master/ubuntu/tmux.conf"
    wget -O "${home}"/.vimrc $WGET_FLAG "https://raw.githubusercontent.com/how2flow/config/master/ubuntu/vimrc"

    # download configs for vim plugin.
    mkdir -p "${home}"/.vim/colors
    git clone "https://github.com/VundleVim/Vundle.vim.git" "${home}"/.vim/bundle/Vundle.vim
    wget -O "${home}"/.vim/colors/gruvbox.vim $WGET_FLAG "https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim"

    # permission
    chown -R ${ID}:${GROUP} ${home}/.vim ${home}/.gitconfig ${home}/.tmux.conf ${home}/.vimrc
  fi

  echo "Finish Download app configs"
}

id_config() {
  # set root password
  echo "root:${PASSWORD}" | chpasswd
  
  # set user groups
  groupadd --gid 1000 "${GROUP}"
  
  # set user ID
  useradd --system --create-home --home-dir /home/"${ID}" \
  --shell /bin/bash --gid "${GROUP}" --uid 1001 "${ID}"
  
  # set user password
  echo "$ID:${PASSWORD}" | chpasswd

  echo "Finish ID config"
}

bash_config() {
  local bashrc="/home/"${ID}"/.bashrc"

  # bashrc user confs
  if [ -f "${bashrc}" ]; then
    echo "set bashrc"
    echo "alias tmux='tmux -2'" >> "${bashrc}"
    echo "set -o vi" >> "${bashrc}"
  fi

  echo "Finish bash config"
}

sudo_config() {
  local sudoers_conf="/etc/sudoers"

  # remove sudo warning message
  if [ -x "$(command -v sudo)" ]; then
    usermod -aG sudo "${ID}"
    touch /home/"${ID}"/.sudo_as_admin_successful
  fi

  # sudoers config
  echo "%$ID ALL=(ALL) ALL" >> "${sudoers_conf}"

  echo "Finish sudo config"
}

main() {
  id_config
  bash_config
  sudo_config
  download_app_configs
}

main
