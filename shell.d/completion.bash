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
complete -C ./setup ./setup

if type gh &>/dev/null; then
	eval "$(gh completion -s bash)"
fi

if type pandoc &>/dev/null; then
	eval "$(pandoc --bash-completion)"
fi

if type kubectl &>/dev/null; then
	source <(kubectl completion bash)
	complete -o default -F __start_kubectl k
fi

if type minikube &>/dev/null; then
	source <(minikube completion bash)
	complete -o default -F __start_minikube mk
fi

if type kind &>/dev/null; then
	source <(kind completion bash)
fi

if type docker &>/dev/null; then
	complete -F _docker d
fi
