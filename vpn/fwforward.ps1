# Forwards traffic to the host OS (from within WSL2) enabling same VPN for
# both. You will likely want to put this into a script and enable scripts for
# the "CurrentUser":
#
#   Set-ExecutionPolicy Bypass -Scope CurrentUser -Force
#
# You'll also want to force your DNS to resolve under your control:
#
#   sudo vi /etc/wsl.conf
#
# Then change:
#
#   [network]
#   generateResolveConf = false
#
# Then edit:
#
#   sudo vi /run/resolveconf/resolve.conf
#
# Then add the domain name servers directly:
#
#   search <subdomain> <domain>
#   nameserver <ip>
#   nameserver <ip>
#   nameserver <ip>

New-NetFirewallRule -DisplayName "WSL" -Direction Inbound -InterfaceAlias "vEthernet (WSL)" -Action Allow

New-NetFirewallRule -DisplayName "WSL" -Direction Outbound -InterfaceAlias "vEthernet (WSL)" -Action Allow

Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000
