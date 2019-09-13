# Host
local username="%{$fg[cyan]%}%n"
local hostname="%{$fg[yellow]%}%M"
local host="${username}%{$fg[green]%}@${hostname}"

# Do color changing prompt
local promptstring=">>"
local return_status="%(?:%{$fg[blue]%}:%{$fg[red]%})$promptstring"

# Do path
local path_string="%{$fg[white]%}%4(c:.../:)%3~"

# Do some git
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
#ZSH_THEME_GIT_PROMPT_PREFIX=""
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}:("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}:)"

local gitprompt='$(git_prompt_info)'

# oh-my-zsh $(git_prompt_info) puts 'dirty' behind branch
git_custom_prompt() {
  # branch name (.oh-my-zsh/plugins/git/git.plugin.zsh)
  local branch=$(current_branch)
  if [ -n "$branch" ]; then
    # parse_git_dirty echoes PROMPT_DIRTY or PROMPT_CLEAN (.oh-my-zsh/lib/git.zsh)
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$branch$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT="${host}%{$reset_color%} %b ${path_string} 
${return_status} "
RPROMPT="${gitprompt}"

