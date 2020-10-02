
trapterm () {
  declare handler="$1"
  # TODO replace this with a pop/push alternative to preserve keep others
  trap "$handler; echo $'\b\b'; trap -- - SIGINT SIGTERM" SIGTERM SIGINT
}
