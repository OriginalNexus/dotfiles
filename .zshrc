# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Init zpack
[[ -d "${HOME}/.zpack" ]] || git clone https://github.com/originalnexus/zpack.git "${HOME}/.zpack"
source "${HOME}/.zpack/zpack.zsh"

# ohmyzsh libraries
zpack bundle omz-lib

# ohmyzsh plugins
zpack omz plugins/git
zpack omz plugins/sudo
zpack omz plugins/docker
zpack omz plugins/docker-compose
zpack omz plugins/kubectl
zpack omz plugins/helm
zpack omz plugins/golang
zpack omz plugins/gcloud

# Other plugins
[[ $+commands[az] == 1 ]] && zpack snippet https://github.com/Azure/azure-cli/raw/dev/az.completion

# Programs
zpack bundle bat --catppuccin
zpack bundle exa
zpack bundle fzf --catppuccin --preview
zpack bundle plow

zpack release vmware-tanzu/velero         --completion 'velero completion zsh > _velero'
zpack release Azure/kubelogin             --completion 'kubelogin completion zsh > _kubelogin'
zpack release doitintl/kube-no-trouble
zpack release wagoodman/dive
zpack release fluxcd/flux2                --completion 'flux completion zsh > _flux'
zpack release cloudflare/cf-terraforming  --completion 'cf-terraforming completion zsh > _cf-terraforming'

[[ $+commands[kubectl] == 1 ]] && zpack snippet --bin https://github.com/kvaps/kubectl-node-shell/raw/master/kubectl-node_shell
[[ $+commands[boundary] == 1 ]] && complete -o nospace -C boundary boundary

# zsh-users
zpack bundle zsh-users --catppuccin

# Theme
zpack bundle powerlevel10k

zpack apply

# User config
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
