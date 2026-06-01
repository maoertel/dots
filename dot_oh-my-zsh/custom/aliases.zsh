alias l="ls -FlaG"

alias v="nvim"
alias c="claude"
alias cr="claude --resume"
alias o="opencode"
alias omai="$HOME/Documents/Projekte/oh-my-ai-shell/target/debug/omai"
# alias oktapus="$HOME/Documents/Projekte/oktapus/target/debug/oktapus"
# Claude Code through the agentgateway (oktapus forward :8765). A function, not
# an alias, so `ag --resume <id>` / `ag -c` keep the gateway envs too. Plain
# `claude` stays direct-to-Anthropic; the gateway is opt-in via ag/agr.
ag() {
  ANTHROPIC_BASE_URL=http://127.0.0.1:8765 \
  ANTHROPIC_AUTH_TOKEN=ignored \
  ANTHROPIC_MODEL='claude-opus-4-8[1m]' \
  ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-8[1m]' \
  ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-6' \
  ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4-5' \
  ENABLE_TOOL_SEARCH=true \
  claude "$@"
}
agr() { ag --resume "$@"; }   # resume through the gateway: agr <id>

# k8s
alias k="kubectl"
alias kns="kubens"
alias kcx="kubectx"
alias kon="kubeon"
alias kof="kubeoff"

# terraform
alias tf="terraform"

# brew
alias buu="brew update && brew upgrade"

# vault
alias vs='export VAULT_ADDR=https://vault.sre.europe-west1.gcp.commercetools.com && vault login -method=oidc -path=oidc/gsuite'
alias vp='export VAULT_ADDR=https://vault.services.europe-west1.gcp.commercetools.com && vault login -method=oidc -path=oidc/gsuite'
