#.bashrc

# key binding
set -o vi
bind '"jj":vim-movement-mode'

#Prompt
#PS1="\w $ "
export PS1='\n\[\e[0m\]\t \[\e[94m\]\u \[\e[0m\]@ \[\e[95m\]\h\[\e[0m\] : \[\e[96m\]\w\[\e[0m\] \n\[\e[1;0m\]$ \[\e[0m\]'

#emacs cmd
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"

#server ssh login
alias sshlx="ssh -XY lx"
#alias sshsusy11="ssh -XY susy11"
alias sshna11="ssh -XY na11"
alias sshna14="ssh -XY na14"
alias sshna17="ssh -XY na17"
alias sshna19="ssh -XY na19"
alias sshsusy11="ssh -XY shimada@10.37.0.231"
alias sshsusy16="ssh -XY susy16"
alias sshsusy12="ssh -XY susy12"
alias sshnicsusy12="ssh -XY nicsusy12"
alias sshppwww="ssh -XY ppwww"

#gcc, g++ PATH
export PATH=/usr/local/bin:$PATH

#pyenv PATH
export PATH=/usr/local/var/pyenv/shims:$PATH

#EVAL cmd
eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors ~/.dircolors-solarized/dircolors.ansi-dark`

#PYENV
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#X11
export LIBGL_ALWAYS_INDIRECT=1

#ROOT PATH
. ~/local/root_build/bin/thisroot.sh
export LD_LIBRARY_PATH=/usr/local/var/pyenv/versions/2.7.16/lib/python2.7:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$ROOTSYS/lib:$DYLD_LIBRARY_PATH

#pyROOT
export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH

#Gmsh PATH
export PATH=/Applications/Gmsh.app/Contents/MacOS:$PATH

#Elmer PATH
export PATH=/Applications/ElmerGUI.app/Contents/bin:$PATH
export ELMER_HOME=/Applications/ElmerGUI.app/Contents/.
export ELMER_POST_HOME=/Applications/ElmerGUI.app/Contents/share/elmerpost
export TK_LIBRARY=/Applications/ElmerGUI.app/Contents/tcltk/tk8.5
export TCL_LIBRARY=/Applications/ElmerGUI.app/Contents/tcltk/tcl8.5
export DYLD_LIBRARY_PATH=/Applications/ElmerGUI.app/Contents/lib

#ls short cut
alias ls="gls --color=auto"
alias ll="ls -l"
alias la="ls -a"

#Jupyter ssh
alias jupyter-susy16="ssh -L 9999:10.37.0.236:9999 shimada@10.37.0.236 -Y -f -N"
#alias jupyter-susy16="ssh -L 8080:localhost:8080 shimada@10.37.0.236 -Y -f -N"


