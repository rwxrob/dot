#!/usr/bin/env bash

## Runs the passed command (assuming the first argument is another
## command) anytime anything in the current or any subdirectory
## (recursively) changes for any reason (also see changed).

onchange () {
  local dir="${PWD}"
  haschanged "${dir}"
  local count=$?
  if (( $count > 0 ));then
    "$@"
  fi
}

while true; do
  onchange "$@"
  sleep .5
done
