# Environment variables

# You may need to manually set your language environment
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

### Homebrew's sbin
#
fish_add_path "/usr/local/sbin:$PATH"

### Python
#
fish_add_path /usr/local/opt/python/libexec/bin:$PATH

### OpenSSL
#
fish_add_path "/usr/local/opt/openssl/bin:$PATH"

### Neovim
#
set -gx PATH "$HOME/neovim/bin" $PATH

### Editor
#
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim

### Fzf
#
set -gx FZF_COMPLETION_TRIGGER '**'
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -gx FZF_DEFAULT_OPTS '--height 90% --layout reverse --border --color "border:#b877db" --preview="bat --color=always {}"'

### TLDR
#
set -gx TLDR_OS osx

### Yabai
#
set -gx YABAI_CERT yabai-cert

### Bat
#
set -gx BAT_THEME TwoDark

### Starship
#
set -gx STARSHIP_CONFIG ~/.dotfiles/config/starship/starship.toml

### Fisher
#
set -U fisher_path ~/.dotfiles/config/fish/fisherman

### Fish shell
#
set -U fish_greeting # remove greeting message

### ZK Notes
set -gx ZK_NOTEBOOK_DIR ~/personal-notes

### Rust
#
set -gx RUST_WITHOUT rust-docs

### Neovim
set -gx NVIM_COLORSCHEME kanagawa
