export EDITOR=vim
export FZF_COMPLETION_OPTS="--preview 'more 100 {}'"
export GPG_TTY="$(tty)"
export GREN_GITHUB_TOKEN=d306fa9d7304ad0094eade0128998e1728dddafb
export PROMPT_GEOMETRY_EXEC_TIME=true
export QT_QPA_PLATFORMTHEME=qt5ct
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GOPATH=$HOME/git/go
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Configure my history
HISTFILE=$HOME/.zhistory
HISTSIZE=102400
SAVEHIST=204800

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt SHARE_HISTORY

alias popt="opt -load LLVMPolly.so"
alias pclang="clang -Xclang -load -Xclang LLVMPolly.so"
alias vmore="vim -u ~/.vimrc.more -"
alias ta="tmux attach -t"
alias tn="tmux new-session -t"
