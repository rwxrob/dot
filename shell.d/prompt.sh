grey=$'\033[38;2;110;110;110m'
purple=$'\033[38;2;211;134;155m'

cur-branch () {
  br=$(git branch --show-current)
  if [ -n "${br}" ]; then
    echo "${grey}:${purple}${br}"
  fi
}

PROMPT="%{$blue%}%1~$(cur-branch)%{$yellow%}$ %{$reset%}"
