#!/bin/sh
set -e
V=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -sSLO "https://dl.k8s.io/release/${V}/bin/linux/amd64/kubectl"
curl -sSLO "https://dl.k8s.io/${V}/bin/linux/amd64/kubectl.sha256"
echo "$(head -1 kubectl.sha256) kubectl" | sha256sum --check
cp kubectl /usr/bin && chmod +x /usr/bin/kubectl
