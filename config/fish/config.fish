set fish_greeting ""
set -gx TERM xterm-256color

source ~/.dotfiles/config/fish/alias/init.fish # alias
source ~/.dotfiles/config/fish/functions/init.fish # function

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end
