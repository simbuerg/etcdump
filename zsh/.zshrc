[[ $- != *i* ]] && return
if which tmux 2>&1 > /dev/null; then test -z "$TMUX" && (tmux list-sessions)
fi

source $HOME/.zplug/init.zsh

# Configure my history
HISTFILE=$HOME/.zhistory
HISTSIZE=102400
SAVEHIST=204800

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
# Configure my history

export LC_COLLATE="en_US.utf8"

######================Aliases===================########
alias popt="opt -load LLVMPolly.so"
alias pclang="clang -Xclang -load -Xclang LLVMPolly.so"
alias vmore="vim -u ~/.vimrc.more -"
alias ta="tmux attach -t"
alias tn="tmux new-session -t"

export EDITOR=vim
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
      xrandr --output LVDS-1 --off
      xrandr --output DP-1 --auto
      xrandr --output DP-2 --auto
      xrandr --output VGA-1 --auto
      xrandr --output DP-1 --rotate left
      xrandr --output DP-2 --right-of DP-1
      xrandr --output VGA-1 --left-of DP-1
      xrandr --output DP-2 --primary
      ;;
    beamer)
      xrandr --output VGA-1 --auto \
             --output LVDS-1 --below VGA-1
      ;;
    hdmi)
      xrandr --output HDMI-1 --auto \
             --output LVDS-1 --left-of HDMI-1
      ;;
    home)
      xrandr --output DP-1 --auto \
             --output LVDS-1 --off
      ;;
    *)
      xrandr --output DP-1 --off \
             --output DP-2 --off \
             --output VGA-1 --off
      xrandr --output LVDS-1 --auto
      ;;
  esac
}

linkto $HOME/.local
linkto $HOME/opt/dmsw

zplug "mafredri/zsh-async", \
  from:github
zplug "sindresorhus/pure", \
  use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions", \
  use:zsh-autosuggestions.zsh, from:github, defer:3
zplug "simbuerg/3fa2cf910d40b96a84e36affc361254a", \
  from:gist, use:bindkeys.zsh
zplug "zsh-users/zsh-syntax-highlighting", \
  use:zsh-syntax-highlighting.zsh, from:github
zplug "/usr/lib/ruby/gems/2.4.0/gems/tmuxinator-0.9.0/completion/", \
  use:tmuxinator.zsh, from:local
zplug "/usr/share/fzf/", \
  use:"*.zsh", from:local

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
