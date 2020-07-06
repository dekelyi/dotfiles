# vim: foldmethod=marker
source ~/.local/share/zinit/bin/zinit.zsh
eval "$(starship init zsh)"

# {{{ aliases
alias _=sudo
alias exal='exa --icons -Flaigh'
alias yay='yay --pacman powerpill'
export MANPAGER='nvim +Man!'
export MANWIDTH=999

if [ -z "$EDITOR" ]; then
	export EDITOR='nvim' VISUAL='nvim'
fi
# }}}

# {{{ zinit plugins
zinit wait lucid for \
	atinit"zicompinit; zicdreplay" \
	light-mode zdharma/fast-syntax-highlighting \
	atload'bindkey "^[[A" history-substring-search-up; bindkey "^[[B" history-substring-search-down' \
	light-mode zsh-users/zsh-history-substring-search \
	atload"!\_zsh\_autosuggest\_start" \
	light-mode zsh-users/zsh-autosuggestions \

zinit wait lucid for \
	light-mode	Aloxaf/fzf-tab

zinit as"completion" mv"yadm.zsh_completion -> _yadm" for \
	https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/completion/yadm.zsh_completion
# }}}

# {{{ completions style
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
local extract="
# trim input(what you select)
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract"$(echo $aliases[exal]) --color=always "'$realpath'
eval $(zstyle -L | grep ':fzf-tab:complete:cd:*' | sed 's/:cd:/:ls:/')
# }}}

# {{{ options
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
setopt auto_cd
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# }}}
