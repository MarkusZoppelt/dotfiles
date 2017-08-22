autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' formats ' %b'
zstyle ':vcs_info:git*' actionformats ' %b|%a'

git_dirty() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null;
    if [[ $? -eq 1 ]]; then
        echo "%F{red}✗%f "
    else
        echo "%F{magenta}✔%f "
    fi
}

git_prompt_info() {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

needs_push() {
  if [[ $(git cherry -v @{upstream} 2>/dev/null) == "" ]]
  then
    echo ""
  else
    echo "%{$fg_bold[magenta]%}☁%{$reset_color%} "
  fi
}

precmd() {
    vcs_info
    print -P '\n%F{green}%m:%F{blue}%~'
}

simple_prompt() {
	precmd(){}
	export RPROMPT=''
	export PROMPT='%F{green}%~ %F{green}❯ %f' 
}

git_prompt() {
	precmd() {
	    vcs_info
	}
	export RPROMPT='`git_dirty`%F{241}$vcs_info_msg_0_%f `needs_push`'
}

simple_prompt
git_prompt
