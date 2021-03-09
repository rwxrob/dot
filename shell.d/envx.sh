autoload envx

if [[ -e "$HOME/.env" ]]; then
  envx $HOME/.env
fi
