if status is-interactive
  # Commands to run in interactive sessions can go here
end

starship init fish | source

function fish_greeting
  cutefetch $(printf %b '-k\n-b\n-p' | shuf -n 1) $(shuf -i 1-13 -n 1)
end
