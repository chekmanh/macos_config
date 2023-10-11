# Fri 06 Dec 2019 05:14:59 PM UTC

# zmodload zsh/zprof

while read FILE
do
  . $FILE
done < <({ fd -t f ".zsh" ~/.config/zsh/extras/lib ; fd -t f "plugin.zsh" ~/.config/zsh/extras/plugins ; })

# zsh vim mode wait
export KEYTIMEOUT=0

[[ -f ~/.config/zsh/extras/my.zsh-theme ]] && . ~/.config/zsh/extras/my.zsh-theme

autoload -U compinit && compinit

# include . files in *
# setopt GLOB_DOTS
setopt CORRECT
setopt auto_cd

# bash compatible alias
[[ -f ~/.config/bash/aliases ]] && . ~/.config/bash/aliases

# ctrl+s ctrl+q
stty -ixon

# up down search
# and also in vicmd mode viins
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '' up-line-or-search
bindkey '' down-line-or-search
bindkey -M vicmd k up-line-or-search
bindkey -M vicmd j down-line-or-search

bindkey -M vicmd g_ vi-end-of-line
bindkey -M vicmd _ beginning-of-line

bindkey -s -M vicmd '' 'iclear\n'
bindkey '' autosuggest-execute

# open up vifm from both modes
bindkey -s '' 'f\n'
bindkey -s -M vicmd '' 'if\n'

bindkey -M vicmd '^R' fzf-history-widget

# remove weird execute command prompt
bindkey -M vicmd -r ":"

# exit tab completion menu with escape // breaks everything?
# bindkey '\e\e' send-break
# bindkey -M vicmd '\e\e' send-break

# if ends on text use editor
alias -s {tex,java,c,txt,hs,js,pdf,mp4,mp3,mkv,jpg,png}=xdg-open

alias -g H='| head -n'
alias -g T='| tail -n'
# color multiline exclude number caseinsensitive
alias -g G='| grep'
# auto alias sed to perl ...
alias -g S='| sedp'
alias -g L="| less"
# no no 
# alias -g UB="/usr/bin/"
# no errors shown
alias -g NE="2> /dev/null"
alias -g NO="&> /dev/null"
alias -g BA="&> /dev/null &!"

alias -g C='| xclip -selection clipboard -r'
alias -g V='|& vim -'


## History command configuration
setopt bang_hist                # Treat the '!' character specially during expansion.
setopt hist_beep                # Beep when accessing nonexistent history.
setopt hist_expire_dups_first   # Expire duplicate entries first when trimming history.
setopt hist_find_no_dups        # Do not display a line previously found.
setopt hist_ignore_all_dups     # Delete old recorded entry if new entry is a duplicate.
setopt hist_ignore_dups         # ignore duplicated commands history list
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_reduce_blanks       # Remove superfluous blanks before recording entry.
setopt hist_save_no_dups        # Don't write duplicate entries in the history file.
setopt hist_verify              # show command with history expansion to user before running it
setopt inc_append_history       # Write to the history file immediately, not when the shell exits.
unsetopt extended_history       # record timestamp of command in HISTFILE

# setopt share_history          # share command history data
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# use the vi navigation keys in menu completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

zstyle ':completion:*:*:(v|gvim):*' file-patterns '^*.(fdb_latexmk|fls|vrb|aux|log|pdf|class|nav|out|toc|snm|bbl|blg|bcf|run.xml):source-files' '*:all-files'
zstyle ':completion:*:*:(vlc|mpv):*' file-patterns '^*.vtt' '*:all-files'
zstyle ':completion:*:*:(str):*' file-patterns '*.(pdf|epub)' '*:all-files'

# make function 1 complete like 2.
compdef alert=time
compdef loopexec=time
compdef nointernet=time

compdef _manga-dl manga-dl
compdef _mpvfolder mpvfolder

# has to be here to not be overwritten
[[ -f /opt/homebrew/Cellar/fzf/0.42.0/shell/completion.zsh ]] && . /opt/homebrew/Cellar/fzf/0.42.0/shell/completion.zsh
[[ -f /opt/homebrew/Cellar/fzf/0.42.0/shell/key-bindings.zsh ]] && . /opt/homebrew/Cellar/fzf/0.42.0/shell/key-bindings.zsh
# man zshzle
bindkey -M vicmd '\ec' vi-change
bindkey -M viins '\ec' vi-change
bindkey -M vicmd '\ed' vi-delete
bindkey -M viins '\ed' vi-delete
