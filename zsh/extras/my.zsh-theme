# Put your custom themes in this folder.
# Example:

#gives linebreak
#only four dirs starting with~ (%4~)
PROMPT='$fg_bold[blue] [ $fg[red]%n@%m:%4~$(git_prompt_info)$fg[yellow]$fg_bold[blue] ]$reset_color 
$ '
# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[green]("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"
