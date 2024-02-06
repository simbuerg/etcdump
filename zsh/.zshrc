[[ $- != *i* ]] && return

source ~/.znap/zsh-snap/znap.zsh

znap prompt sindresorhus/pure

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source willghatch/zsh-saneopt

znap fpath _kubectl 'kubectl completion zsh'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#414141"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1

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

function zshaddhistory() {
    echo "${1%%$'\n'}⋮${PWD}   " >> ~/.zsh_history_ext
}

linkto $HOME/.local
linkto $HOME/git/go
linkto $HOME/go
linkto $HOME/opt/dmsw
linkto $HOME/.node_modules/
linkto $HOME/.yarn/

# [ -n "$SSH_AUTH_SOCK" ] && gpgconf --create-socketdir
# [ -n "$SSH_AUTH_SOCK" ] || gpgconf --launch gpg-agent
gpgconf --launch gpg-agent

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux-window-name() {
	($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
}

add-zsh-hook chpwd tmux-window-name
