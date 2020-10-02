open () {
  # TODO improve the mime handling
  case $PLATFORM in
    mac) open $* ;;
    windows) telln 'Not yet supported.';;
    linux) xdg-open $*;;
  esac
} && export -f open
