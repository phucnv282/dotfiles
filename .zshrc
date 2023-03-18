# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/phucnv/.oh-my-zsh"
export DISABLE_SCOPE_LOWERCASE=1

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
  web-search
)

ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh
export PATH=$PATH:~/.local/bin:/usr/local/go/bin:$HOME/go/bin:${KREW_ROOT:-$HOME/.krew}/bin
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
alias k=kubectl
complete -F __start_kubectl k
alias kctx="k ctx"
alias kns="k ns"
alias lf="ll --group-directories-first"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/phucnv/.linkerd2/bin
