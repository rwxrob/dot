
# Most completion is set near the function that uses it or internally inside
# the command itself using https://github.com/robmuh/cmdtab for completion.

if [ -r /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
fi

complete -C pdf pdf
complete -C md md
complete -C gh gh
complete -C kn kn
complete -C auth auth
complete -C live live
