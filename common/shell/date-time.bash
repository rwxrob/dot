
############################### Date / Time ##############################

tstamp () {
  echo -n $1
  date '+%Y%m%d%H%M%S'
}

tstampfile () {
  declare path="$1"
  declare pre=${path%.*}
  declare suf=${path##*.}
  echo -n $pre.$(tstamp)
  [[  "$pre" != "$suf" ]] && echo .$suf
}

now () {
  return echo "$1" $(date "+%A, %B %e, %Y, %l:%M:%S%p")
}

now-s () {
  echo "$1" $(date "+%A, %B %e, %Y, %l:%M %p")
}

epoch () {
  date +%s
}

watchnow () {
  declare -i delay="${1:-10}"
  havecmd setterm && setterm --cursor off
  trapterm 'setterm --cursor on; clear'
  while true; do 
    clear
    echo -n $(now-s) |lolcat
    now-s > ~/.now
    sleep $delay
  done
}

weekday () {
  echo $(lower $(date +"%A"))
}

month () {
  echo $(lower $(date +"%B"))
}

year () {
  echo $(lower $(date +"%Y"))
}

week () {
  date +%W
}

# Calls the compact ncal variation with Mondays first and including the
# week count during the year. I prefer keeping track of blogs and such by
# the week of the year and not more complicated months and dates. (No one
# ever plugs in a specific month and day into a long blog URL. They just
# want it to be short).

cal () {
  declare exe=$(which ncal)
  if [[ -z "$exe" ]]; then
    cal $* 
    return $?
  fi
  $exe -M -w $*
}
