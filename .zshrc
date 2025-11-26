ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:/opt/android-sdk/platform-tools:/opt/android-sdk/tools
export LIBVA_DRIVER_NAME=nvidia
export MOZ_DISABLE_RDD_SANDBOX=1

# Lazy-load NVM for faster startup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
nvm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}
node() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  node "$@"
}
npm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  npm "$@"
}

export PATH="$HOME/.config/composer/vendor/bin:$PATH"
source "${ZINIT_HOME}/zinit.zsh"
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
bindkey -v

# Load and cache compinit (runs full check only once per day)
autoload -U compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

HISTSIZE=5000
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-color "${(s.:.)LS_COLORS}" 
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:z:*' fzf-preview 'ls --color $realpath'
alias ls="ls -l --color"
alias grep="rg"
eval "$(fzf --zsh)"


export EDITOR=nvim
export VISUAL=nvim
alias vim="nvim"
alias pacman='sudo pacman'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias ..="cd .."
alias ...="cd ../../"
alias shutdown="shutdown -h now"
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#echo "Hello, $USER! Today is $(date '+%A, %B %d, %Y')"
if [ -f /usr/bin/fastfetch ];  then 
  fastfetch
fi
