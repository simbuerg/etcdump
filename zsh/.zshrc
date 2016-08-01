[[ $- != *i* ]] && return
if which tmux 2>&1 > /dev/null; then
  #test -z "$TMUX" && (tmux attach || tmux new-session)
  test -z "$TMUX" && (tmux list-sessions)
fi

export LC_COLLATE="en_US.utf8"

source ${HOME}/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle fasd
antigen bundle python
antigen bundle sudo
antigen bundle ssh-agent
antigen bundle tmux
antigen bundle tmux-cssh

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zaw
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

######================Aliases===================########
alias popt="opt -load LLVMPolly.so"
alias pclang="clang -Xclang -load -Xclang LLVMPolly.so"
alias vmore="vim -u ~/.vimrc.more -"
#alias vim="nvim"
alias ta="tmux attach -t"
alias tn="tmux new-session -t"

zle -N zle-keymap-select
bindkey '^R' zaw-history

######==========================================########
undo_path=(${PATH})
undo_ld_run_path=(${LD_RUN_PATH})
undo_ld_library_path=(${LD_LIBRARY_PATH})

function env_history() {
  echo "PATH history:"
  for i in $(seq 0 $(( ${#undo_path} ))) ; do
    echo $i ${undo_path[$i]}
  done

  echo "LD_RUN_PATH history:"
  for i in $(seq 0 $(( ${#undo_ld_run_path} ))) ; do
    echo $i ${undo_ld_run_path[$i]}
  done

  echo "LD_LIBRARY_PATH history:"
  for i in $(seq 0 $(( ${#undo_ld_library_path} ))) ; do
    echo $i ${undo_ld_library_path[$i]}
  done
}

function env_set() {
  index=$1
  export PATH=${undo_path[$index]}
  export LD_RUN_PATH=${undo_ld_run_path[$index]}
  export LD_LIBRARY_PATH=${undo_ld_library_path[$index]}
}

function linkto() {
  if [ -d "$1/sbin" ] ; then
    PATH=$1/sbin:${PATH}
  fi

  if [ -d "$1/bin" ] ; then
    PATH=$1/bin:${PATH}
  else
    PATH=$1:${PATH}
  fi

  if [ -d "$1/lib" ] ; then
    LD_RUN_PATH=$1/lib:${LD_RUN_PATH}
    LD_LIBRARY_PATH=$1/lib:${LD_LIBRARY_PATH}
  else
    LD_LIBRARY_PATH=$1:${LD_LIBRARY_PATH}
  fi

  undo_path+="${PATH}"
  undo_ld_run_path+="${LD_RUN_PATH}"
  undo_ld_library_path+="${LD_LIBRARY_PATH}"
  export PATH
  export LD_RUN_PATH
  export LD_LIBRARY_PATH
  export undo_path
  export undo_ld_run_path
  export undo_ld_library_path
}

function Xrandr() {
  case "$1" in
    office)
      xrandr --output LVDS1 --off
      xrandr --output DP1 --auto
      xrandr --output DP2 --auto
      xrandr --output VGA1 --auto
      #xrandr --output DP1 --rotate left
      xrandr --output DP2 --right-of DP1
      xrandr --output VGA1 --right-of DP2
      xrandr --output DP2 --primary
      ;;
    beamer)
      xrandr --output VGA1 --auto \
             --output LVDS1 --below VGA1
      ;;
    home)
      xrandr --output DP1 --auto \
             --output LVDS1 --off
      ;;
    *)
      xrandr --output DP1 --off \
             --output DP2 --off \
             --output VGA1 --off
      xrandr --output LVDS1 --auto
      ;;
  esac
}

linkto $HOME/.local
linkto $HOME/opt/dmsw
linkto $HOME/src/tools/tmuxstart
linkto $HOME/src/tools/arc/arcanist
linkto $HOME/src/tools/gitkraken
linkto $HOME/.gem/ruby/2.2.0/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/./ruby/2.2.0/gems/tmuxinator-0.8.1/completion/tmuxinator.zsh ] && \
  source ~/./ruby/2.2.0/gems/tmuxinator-0.8.1/completion/tmuxinator.zsh
