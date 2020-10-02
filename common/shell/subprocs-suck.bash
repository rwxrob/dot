 
perg () {
  declare exp="$1"; shift
  if [[ -z "$*" ]]; then
    while IFS= read -r line; do
      [[ $line =~ $exp ]] && echo "$line"
    done
    return
  fi
  for file in $*; do
    while IFS= read -r line; do
      [[ $line =~ $exp ]] && echo "$line"
    done < "$file"
  done
}

lower () {
  echo ${1,,}
}

upper () {
  echo ${1^^}
}

linecount () {
   IFS=$'\n'
   declare a=($1)
   echo ${#a[@]}
}

# These are so much faster than basename and dirname.

basepart () {
  echo ${1##*/}
}

dirpart () {
  echo ${1%/*}
}


# A friendlier cat that does not invoke a subshell.

kat () {
	declare line
  if [[ -z "$*" ]]; then
    while IFS= read -r line; do
      [[ $line =~ $exp ]] && echo "$line"
    done
    return
  fi
  for file in $*; do
    while IFS= read -r line; do
      echo "$line"
    done < "$file"
  done
}

# Same as kat but skips blank and lines with optional whitespace that
# begin with a comment character (#).

katlines () {
  for file in $*; do
    while IFS= read -r line; do
      [[ $line =~ ^\ *(#|$) ]] && continue
      echo "$line"
    done < "$file"
  done
}

# Moves an existing thing to the same path and name but with
# ".preserved.<tstamp>" at the end and echoes the new location. Usually
# preferable to destroying what was previously there. Can be used to roll
# back changes transactionally.

preserve () {
  declare target="${1%/}"
  [[ ! -e "$target" ]] && return 1
  declare new="$target.preserved.$(tstamp)"
  mv "$target" "$new" 
  echo "$new" 
}

# Lists all the preserved files by matching the .preserved<tstamp> suffix.
# If passed an argument limits to only those preserved files matching that
# name (prefix).

lspreserved () {
  declare -a files
  if [[ -z "$1" ]]; then
      files=(*.preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  else
      files=("$1".preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  fi
  for i in "${files[@]}"; do
    echo "$i"
  done
}

lastpreserved () {
  mapfile -t  a < <(lspreserved "$1")
  declare n=${#a[@]}
  echo "${a[n-1]}"
}

rmpreserved () {
  while IFS= read -r line; do
    rm -rf "$line"
  done < <(lspreserved)
}

# Undos the last preserve performed on the given target.

unpreserve () {
  declare last=$(lastpreserved "$*")
  [[ -z "$last" ]] && return 1
  mv "$last" "${last%.preserved*}"
}

trash () {
  [[ -z "$TRASH" ]] && return 1
  mkdir -p "$TRASH"
  mv "$*" "$TRASH"
}

stringscan () {
  declare buf="$1"
  declare handle=(echo)
  [[ -n "$2" ]] && handle=($2)
  for (( i=0; i<${#buf}; i++ )); do 
    ($handle ${buf:$i:1})
  done
}

firstline () {
  declare line
  declare IFS=
  read -r line <"$1"
  echo $line
}

lastline () {
  # Tail is fastest because it does a seek to the end of file.
  tail -1 "$1"
}

lastcmdline () {
  lastline "$HOME/.bash_history"
}

lastcmd () {
  declare cl=$(lastcmdline)
  echo ${cl%% *}
}

