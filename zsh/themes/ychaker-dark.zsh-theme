source ~/dev/zsh-git-prompt/zshrc.sh

# local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'
local user='%{$fg[magenta]%}%n%{$reset_color%}'
local date_time='%{$fg[cyan]%}%D{[%I:%M:%S]}%{$reset_color%}'
local pwd='%{$fg_bold[cyan]%}%~%{$reset_color%}'

local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

git_prompt='$(git_super_status)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}± %{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[cyan]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="${user} ${pwd}$ "
RPROMPT="${date_time} ${git_prompt} ${git_branch} ${rvm} ${return_code}"
