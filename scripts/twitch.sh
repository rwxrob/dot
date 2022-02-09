#!/usr/bin/env bash
set -e

# If you prefer to not have dependencies on the helper commands for the
# following you can simply set them directly:

: "${TOKEN:="$(auth token twitch)"}"
: "${CLIENTID:="$(auth get id twitch)"}"
: "${CLIENTSEC:="$(auth get secret twitch)"}"
: "${TWITCH_ID:=447179030}"
: "${TWITCH_USER:=rwxrob}"
: "${TWITCH_LANG:=en}"
: "${TWITCH_GAME:="Science \u0026 Technology"}"
: "${TWITCH_GAMEID:=509670}"
: "${TWITCH_TITLE:="https://github.com/rwxrob/boost"}"

# Title changes the Title stream info (Go Live notification cannot be
# changed from API). If the special 'default' title is passed it will
# use the output of the `config twitch.title` command. Otherwise, the
# arguments will be combined into a single script and an isosec
# identifier added to the end which is 16 characters plus a space (ex:
# "Title [20210508163250]") Twitch titles have 140 character limit but
# this command limits them to 123 characters since every title will have
# an isosec identifier added to the end which is 16 characters plus
# a space (ex: "Title [20210508163250]")

title() {
  test -z "$1" && echo "$TWITCH_TITLE" && return
  if test "${1%% *}" = default; then
    title="$TWITCH_TITLE"
  else
    title="$*"
  fi
  resp=$(curl -sS -X PATCH "https://api.twitch.tv/helix/channels?broadcaster_id=$TWITCH_ID" \
    -H "Authorization: Bearer $TOKEN" \
    -H "Client-Id: $CLIENTID" \
    -H 'Content-Type: application/json' \
    --data-raw '{"game_id":"'$TWITCH_GAMEID'", "title":"'"$title"'", "broadcaster_language":"'$TWITCH_LANG'"}' | jq -r '[.status,.message] | @tsv')
}

current() {
  curl -sS -X GET "https://api.twitch.tv/helix/channels?broadcaster_id=$TWITCH_ID" \
    -H "Authorization: Bearer $TOKEN" \
    -H "Client-Id: $CLIENTID" \
    -H 'Content-Type: application/json' | jq .data[0]
}

categories() {
  curl -sSG -X GET 'https://api.twitch.tv/helix/search/categories' \
    -H "Authorization: Bearer $TOKEN" \
    -H "Client-Id: $CLIENTID" \
    --data-urlencode "query=$*" | jq -r '.data[] | .id + " " + .name'
}

## ------------------------------- main -------------------------------

command="$1"
test -n "$command" && shift

case "$command" in
title) title "$@" ;;
current) current "$@" ;;
categories) categories "$@" ;;
esac
