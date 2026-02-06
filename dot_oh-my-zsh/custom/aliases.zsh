alias l="ls -FlaG"

alias v="nvim"

alias k="kubectl"
complete -F __start_kubectl k
alias kns="kubens"
alias kcx="kubectx"
alias kon="kubeon"
alias kof="kubeoff"

alias sbtDebug="DEBUG_REVOLVER=true sbt"

# brew
alias buu="brew update && brew upgrade"

# vault
alias vl="~/Documents/commercetools/vault/vl.sh"

alias magic="sed -E '1s/^/[/; $ ! s/(^.+$)/\1,/; $ s/$/]/' | jq"

# dotfiles git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# vault login
alias vs='export VAULT_ADDR=https://vault.sre.europe-west1.gcp.commercetools.com && vault login -method=oidc -path=oidc/gsuite'
alias vp='export VAULT_ADDR=https://vault.services.europe-west1.gcp.commercetools.com && vault login -method=oidc -path=oidc/gsuite'

# kubernetes
alias boot='k port-forward svc/bootstrap-ws 4001:8080'

# get projects distribution
alias pd="curl -s http://localhost:4001/clusters | jq '.db' | jq '.[] | to_entries | map(select(.value.projects != []) | del(.value.server)) | map({(.key): .value.projects})' | jq -s 'add | add'"

alias tf="~/bin/terraform"
