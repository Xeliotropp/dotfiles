# --------------------------------------------------------ZCOMET SETUP--------------------------------------------------------
if [[ ! -e ~/.zcomet/bin ]]; then
  git clone --depth=1 https://github.com/agkozak/zcomet.git ~/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# -------------------------------------------------------HISTORY--------------------------------------------------------------
HISTSIZE=1000
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space \
       hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# -------------------------------------------------------PLUGINS--------------------------------------------------------------
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

zcomet compinit

zcomet load Aloxaf/fzf-tab

# -------------------------------------------------------FZF------------------------------------------------------------------
if [[ ! -f ~/.fzf-zsh-cache ]]; then
  fzf --zsh > ~/.fzf-zsh-cache
fi
source ~/.fzf-zsh-cache

# -------------------------------------------------------VI MODE--------------------------------------------------------------
bindkey -v
export KEYTIMEOUT=1

# -------------------------------------------------------TOOLS--------------------------------------------------------------
# zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
else
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh \
        && eval "$(zoxide init zsh)"
fi

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [[ -d "$FNM_PATH" ]]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env --use-on-cd --shell zsh)"
fi


# ----------------------------------------------------ALIASES-----------------------------------------------------------------
alias yayf="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
alias cd="z"
alias shutdown="shutdown -h now"
alias ls="ls -lh --color=always --group-directories-first"
alias mkdir="mkdir -p"

# -------------------------------------------------------PROMPT---------------------------------------------------------------
PROMPT='%F{#ed8796}[%*] %F{#a6da95}%n%F{reset}@%F{#8aadf4}%m %F{#eed49f}%~ %# '
echo "Здравей, свят!"

# -------------------------------------------------------SDKMAN---------------------------------------------------------------
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
  unfunction sdk
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk "$@"
}

