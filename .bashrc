#.bashrc

#LOCAL_HOME=$HOME
LOCAL_HOME=$PWD

# key binding
set -o vi
bind '"jj":vim-movement-mode'

#############################################################
## git
if type "git" > /dev/null 2>&1 ; then
	export GIT_EDITOR=vim
	export GIT_COMMITTER_NAME=shimada
	export GIT_COMMITTER_EMAIL=shimada@mesw.co.jp
	## SSH
	#export GIT_SSH=""
	## COMPLETION
	source $LOCAL_HOME/.git-conf/git-completion.bash
	## PROMPT
	source $LOCAL_HOME/.git-conf/git-prompt.sh
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWUPSTREAM="auto"
	GIT_PS1_SHOWCOLORHINTS=true

#Prompt
	export PS1="\n\[\e[0m\]\$(TZ=JST-9 date '+%H:%M:%S') \[\e[94m\]\u \[\e[0m\]@ \[\e[95m\]\h\[\e[0m\] : \[\e[96m\]\w\[\e[0m\] \[\e[92m\]\$(__git_ps1) \[\e[0m\] \n\[\e[94m\] > $ \[\e[0m\]"
else

#Prompt
	export PS1="\n\[\e[0m\]\$(TZ=JST-9 date '+%H:%M:%S') \[\e[94m\]\u \[\e[0m\]@ \[\e[95m\]\h\[\e[0m\] : \[\e[96m\]\w\[\e[0m\] \n\[\e[94m\] > $ \[\e[0m\]"
fi

#############################################################
## alias
alias ssh="ssh -XY"

alias ls='ls --color=always'
alias l="ls"
alias ll="ls -l"

alias vim="vim -u $LOCAL_HOME/.vimrc"


#############################################################
## pyenv
if [ -d $LOCAL_HOME/.pyenv ]; then
	export PYENV_ROOT="$LOCAL_HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi

#############################################################
## venv
if [ -d $LOCAL_HOME/.venv ]; then
	source $LOCAL_HOME/.venv/bin/activate
fi




#############################################################
# Env
export LESS='-R'


