[[ $- != *i* ]] && return
[[ "${TERM}" = "xterm-kitty" ]] && alias d="kitty +kitten diff"

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "simbuerg/3fa2cf910d40b96a84e36affc361254a", from:gist, use:bindkeys.zsh
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh, defer:3
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh
zplug "willghatch/zsh-saneopt", use:saneopt.plugin.zsh
zplug "/usr/lib/ruby/gems/2.6.0/gems/tmuxinator-0.15.0/completion/", use:tmuxinator.zsh, from:local
zplug "/usr/share/fzf/", use:"*.zsh", from:local
zplug "/usr/bin", use:virtualenvwrapper.sh, from:local
zplug load
bindkey -e

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
      sh ~/.screenlayout/office.sh
      ;;
    beamer)
      sh ~/.screenlayout/beamer_mirror_1024.sh
      ;;
    home)
      xrandr --output DP-1 --auto \
             --output LVDS-1 --off
      ;;
    *)
      sh ~/.screenlayout/laptop-only.sh
      ;;
  esac
}

linkto $HOME/.local
linkto $HOME/opt/dmsw
linkto $HOME/.gem/ruby/2.5.0
linkto $HOME/.node_modules/

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
