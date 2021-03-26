
# Most completion is set near the function that uses it or internally inside
# the command itself using https://github.com/robmuh/cmdtab for completion.

complete -C pdf pdf
complete -C md md
complete -C yt yt
complete -C gl gl
complete -C kn kn
complete -C auth auth
complete -C pomo pomo
complete -C config config
complete -F _docker d

if type gh >/dev/null 2>&1; then
  eval "$(gh completion -s bash)"
fi

if type pandoc >/dev/null 2>&1; then
  eval "$(pandoc --bash-completion)"
fi
