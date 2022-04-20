#! /bin/bash
echo "---"

set -e

info () {
  printf "\r  [\033[00;34m..\033[0m] %s \n" "$1"
}

user () {
  printf "\r  [\033[0;33m??\033[0m] %s \n" "$1"
}

success () {
  printf "\r\033[2K [\033[00;32mOK\033[0m] %s \n" "$1"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] %s \n" "$1"
  echo ''
  exit
}

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git clone https://github.com/Homebrew/brew homebrew
    brew update --force --quiet
    eval "$(homebrew/bin/brew shellenv)"

    chmod -R go-w "$(brew --prefix)/share/zsh"

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap homebrew/cask
    
    success "Installed homebrew"
  fi
}

install_versions_manager_and_languages() {
  read -r -p "Do you want to install languages (python, golang, ruby, ...)? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install asdf
    rm -rf ~/.asdf/shims && asdf reshim
    success "Installed asdf"

    read -r -p "python? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      asdf plugin-add python
      asdf install python 3.10.2
      asdf global python 3.10.2
      success "Installed python"
    fi

    read -r -p "golang? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      asdf plugin-add golang
      asdf install golang latest
      success "Installed golang"
    fi

    read -r -p "ruby? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      asdf plugin-add ruby
      asdf install ruby latest
      success "Installed ruby"
    fi

    read -r -p "flutter? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      brew install android-sdk
      brew install android-studio
      brew install haxm
      brew cask install adoptopenjdk8
      asdf plugin-add flutter
      asdf install flutter 2.10.3-stable
      asdf global flutter 2.10.3-stable
      success "Installed flutter"
    fi
  fi
  
}

install_kafka() {
  read -r -p "Do you want to install kafka? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install kafka

    success "Installed kafka"
  fi
}

install_devops() {
  read -r -p "Do you want to install devops tools? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    read -r -p "colima? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      brew install colima
      success "Installed colima"
    fi

    read -r -p "k8s? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      brew install minikube
      brew install helm
      brew install hyperkit
      brew install kubectx
      success "Installed k8s"
    fi
    
    read -r -p "pstree? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      brew install pstree
      success "Installed pstree"
    fi
  fi
}

setup_penetration_tools() {
  read -r -p "Do you want to install some penetration tools ? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install owasp-zap
    brew install nmap
    brew install openconnect
    brew install openvpn
    
    chmod +x ./tools/beef/install
    ./tools/beef/install
    
    success "Installed penetration tools"
  fi
}

setup_performance_testing_tools()) {
  read -r -p "Do you want to install some performance testing tools ? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install artillery
  
    success "Installed performance testing tools"
  fi
}

setup_git() {
  read -r -p "Do you want to setup git? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install gh 
    success "Installed GitHub CLI"
    
    git config --global user.email "thieunguyen.it@gmail.com"
    git config --global user.name  "Thieu Nguyen"
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    git config --global color.ui true
    git config --global color.diff-highlight.oldNormal "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal "green bold"
    git config --global color.diff.meta "11"
    git config --global color.diff.frag "magenta bold"
    git config --global color.diff.commit "yellow bold"
    git config --global color.diff.old "red bold"
    git config --global color.diff.new "green bold"
    git config --global color.diff.whitespace "red reverse"

    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status

    success "Setup Git Successfully"
  fi
}

install_fish() {
  read -r -p "Do you want to install fish? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install fish

    sudo chsh -s "$(which fish)"
    
    success "Installed fish"
  fi
}

install_font() {
  read -r -p "Do you want to install font? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    brew tap homebrew/cask-fonts
    brew install font-hack-nerd-font

    success "Installed font!"
  fi
}

install_terminal() {
  read -r -p "Do you want to install alacritty? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install alacritty
    rm -rf ~/.config/alacritty
    cd ~/.dotfiles/config && stow alacritty -t ~/

    success "Installed alacritty terminal"
  fi

  read -r -p "Do you want to install Wezterm? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]]; then
    brew tap wez/wezterm
    brew install --cask wez/wezterm/wezterm

    success "Installed wezterm terminal"
  fi

  read -r -p "Do you want to install Kitty? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]]; then
    brew install --cask kitty

    success "Installed kitty terminal"
  fi
}

install_neovim() {
  read -r -p "Do you want to install neovim? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    info "Installing neovim"
    brew install lua
    brew install neovim

    # reduce keyrepeat for faster typing in vim
    defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

    success "Installed neovim"
  fi
}

install_astronvim() {
  read -r -p "Do you want to install AstroNvim? (y|N) " response
  if [[ $response =~ (y|yes|Y) ]]; then
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak
    rm -rf ~/.local/share/nvim
    rm -rf ~/.cache/nvim
  
    mkdir -p ~/.config/nvim

    git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
    nvim +PackerSync

    success "Installed AstroNvim configuration"
  fi
}

install_tmux() {
  read -r -p "Do you want to install tmux? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install tmux
    rm -rf ~/.tmux.conf
    cd ~/.dotfiles/config && stow tmux -t ~/

    rm -rf ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    success "Installed tmux"
  fi
}

install_window_manager() {
  read -r -p "Do you want to install window manager? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install koekeishiya/formulae/yabai
    sudo yabai --install-sa
    sudo yabai --load-sa
    brew services start yabai
    # Follow https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#macos-big-sur---automatically-load-scripting-addition-on-startup
    # to setup automatically load scripting addition on startup

    brew install koekeishiya/formulae/skhd
    brew services start skhd

    success "Installed window manager! Remember to disable System Integrity Protection (SIP)"
  fi
}

install_tools() {
  read -r -p "Do you want to install some fancy tools ? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install ripgrep
    brew install neofetch
    brew install languagetool
    brew install pgcli
    brew install mongocli
    brew install bat
    brew install httpie
    brew install diff-so-fancy
    brew install exa
    brew install fzf
    brew install fd
    brew install autojump
    brew install asciinema
    brew install ack
    brew install nnn
    brew install bpytop
    brew install jq

    # Install htop (https://github.com/htop-dev/htop)    
    brew install ncurses automake autoconf gcc
    brew install htop
    
    # Lazygit (https://github.com/jesseduffield/lazygit)
    brew install jesseduffield/lazygit/lazygit
   
    "$(brew --prefix)"/opt/fzf/install

    brew install isacikgoz/taps/tldr

    success "Installed some fancy tools"
  fi
}

install_cutefetch() {
  read -r -p "Do you want to install cutefetch? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]]; then
    cd /usr/local/bin/
    cp ~/.dotfiles/config/cutefetch/cutefetch .
    chmod a+x ./cutefetch
  fi
}

install_ytplay() {
  # A Python script to play media from YouTube without needing API keys.
  # https://github.com/cybardev/ytpy
  read -r -p "Do you want to install ytpy (Play Youtube from terminal)? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]]; then
    brew install mpv
    brew install youtube-dl
    brew install ffmpeg

    cd /usr/local/bin/
    cp ~/.dotfiles/config/ytplay/ytplay .
    chmod a+x ./ytplay
  fi
}

link_all_dotfiles() {
  brew install stow
  
  rm -rf ~/.config/fish
  rm -rf ~/.config/alacritty
  rm -rf ~/.config/wezterm
  rm ~/.tmux.conf
  rm -rf ~/.zshrc
  rm -rf ~/.config/skhd
  rm -rf ~/.config/bpytop

  mkdir -p ~/.config/fish
  mkdir -p ~/.config/wezterm
  mkdir -p ~/.config/neofetch

  cd ~/.dotfiles/config && \
    stow alacritty -t ~/.config && \
    stow wezterm -t ~/.config/wezterm && \
    stow neofetch -t ~/.config/neofetch
    stow starship -t ~/.config && \
    stow fish -t ~/.config/fish && \
    stow tmux -t ~/
  success "Linked all configurations"

  mkdir -p ~/.config/skhd
  cd ~/.dotfiles/config && stow skhd -t ~/.config/skhd
  success "Linked window manager"

  mkdir -p ~/.config/nvim/lua/user
  cd ~/.dotfiles/config && stow nvim -t ~/.config/nvim/lua/user
  success "Linked neovim"

  mkdir -p ~/.config/bpytop
  cd ~/.dotfiles/config && stow bpytop -t ~/.config/bpytop
  success "Linked other tools"
}

install_homebrew
setup_git
install_ninja
install_versions_manager_and_languages
install_kafka
install_devops
setup_penetration_tools
setup_performance_testing_tools
install_font
install_terminal
install_neovim
install_astronvim
install_tmux
install_window_managr
link_all_dotfiles
install_tools

echo "---"

echo "Finish Install!"
