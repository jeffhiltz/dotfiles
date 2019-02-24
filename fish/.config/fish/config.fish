set PATH $HOME/esp/xtensa-esp32-elf/bin $PATH

# MOTD
function echo_color
  printf "\033[0;90m$argv[1]\033[0m\n"
end
echo_color "c-k  Delete everything right of cursor"
echo_color "c-u  Delete everything left of cursor"
echo_color "c-t  Swap with previous character"
echo_color "c-w  Delete left to word boundary"

