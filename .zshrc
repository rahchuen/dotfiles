PLATFORM=$(uname -s)

if [[ $PLATFORM = 'Darwin' ]]; then
  alias ls='ls -G'
  alias la='ls -a -G'
  alias ll='ls -l -G'
  alias grep='grep -G'
  alias fgrep='fgrep -G'
  alias egrep='egrep -G'
elif [[ $PLATFORM = 'Linux' ]]; then
  alias ls='ls --color=auto'
  alias la='ls -a --color=auto'
  alias ll='ls -l --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

export HISTFILE="$HOME/.zshistory"
export HISTSIZE=1000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# The following lines were added by compinstall

zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt \
 -  %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename $HOME/.zshrc

autoload -Uz compinit
compinit

# End of lines added by compinstall

[ ! -f "$HOME/.vim/autoload/plug.vim" ] && \
  curl -sfSL --proto-redir -all,https \
  -o "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ ! -d "$HOME/.zplug" ] && \
  curl -sfSL --proto-redir -all,https \
  https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | \
  zsh

source "$HOME/.zplug/init.zsh"

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "junegunn/fzf", \
  dir:"$HOME/.fzf", \
  hook-build:"bash $HOME/.fzf/install --all --no-bash"

zplug "pyenv/pyenv-installer", \
  hook-build:"[ ! -d $HOME/.pyenv ] && bash bin/pyenv-installer"

zplug "clvv/fasd", \
  use:fasd, \
  as:command

zplug "stedolan/jq", \
  from:gh-r, \
  as:command, \
  rename-to:jq

zplug "peco/peco", \
  from:gh-r, \
  as:command, \
  rename-to:peco

zplug "BurntSushi/ripgrep", \
  from:gh-r, \
  as:command, \
  rename-to:rg

zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "subnixr/minimal"

zplug "chriskempson/base16-shell", use:"scripts/base16-outrun-dark.sh", defer:0

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load #--verbose

eval "$(fasd --init auto)"
alias v="f -e vim" # quick opening files with vim

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rachel/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rachel/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rachel/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rachel/google-cloud-sdk/completion.zsh.inc'; fi

export MNML_USER_CHAR="༼ つ ◕_◕ ༽つ"
