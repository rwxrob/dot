source <(kubectl completion bash)
source <(minikube completion bash)
complete -o default -F __start_kubectl k
complete -o default -F __start_minikube mk


