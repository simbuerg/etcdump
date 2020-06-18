zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "simbuerg/3fa2cf910d40b96a84e36affc361254a", from:gist, use:bindkeys.zsh
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh, defer:3
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh
zplug "willghatch/zsh-saneopt", use:saneopt.plugin.zsh
zplug "/usr/lib/ruby/gems/2.7.0/gems/tmuxinator-2.0.1/completion", use:tmuxinator.zsh, from:local
zplug "/usr/share/fzf", use:completion.zsh, from:local
zplug "/usr/bin", use:virtualenvwrapper.sh, from:local
