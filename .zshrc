#############################################################################
## KEYBINDING ###############################################################
#############################################################################

bindkey -v

#############################################################################
## PROMPT ###################################################################
#############################################################################

#PROMPT='
#%F{blue}%n%f @ %F{red}%m%f % %F{cyan}[%d]%f 
# %F{green}%%%f '
#RPROMPT='%F{cyan}%D %* %f'
#RPROMPT='%F{cyan}[%d]%f'
#PS1="$(powerline-shell --shell zsh $?)"

PROMPT_INS='
%F{blue}%n%f @ %F{red}%m%f % %F{cyan}[%d]%f 
%F{yellow}(ins)%f %F{green}%%%f '
PROMPT_NOR='
%F{blue}%n%f @ %F{red}%m%f % %F{cyan}[%d]%f 
%F{red}(cmd)%f %F{green}%%%f '
PROMPT_VIS='
%F{blue}%n%f @ %F{red}%m%f % %F{cyan}[%d]%f 
%F{magenta}(vis)%f %F{green}%%%f '

PROMPT=$PROMPT_INS

function zle-line-pre-redraw {
  if [[ $REGION_ACTIVE -ne 0 ]]; then
    NEW_PROMPT=$PROMPT_VIS
  elif [[ $KEYMAP = vicmd ]]; then
    NEW_PROMPT=$PROMPT_NOR
  elif [[ $KEYMAP = main ]]; then
    NEW_PROMPT=$PROMPT_INS
  fi

  if [[ $PROMPT = $NEW_PROMPT ]]; then
    return
  fi

  PROMPT=$NEW_PROMPT

  zle reset-prompt
}

function zle-keymap-select zle-line-init {
  case $KEYMAP in
    vicmd)
    PROMPT=$PROMPT_NOR
    ;;
    main|viins)
    PROMPT=$PROMPT_INS
    ;;
  esac
  zle reset-prompt
}

RPROMPT='%F{green} %D{%Y/%m/%d} %* %f'

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-pre-redraw


#############################################################################
## COMPINIT #################################################################
#############################################################################

autoload -U compinit
compinit
#zstyle ':completion:*:default' menu select=2
## Jd404X?t$NI=<($r6/2=$9$k
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
#zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
#zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
#zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
## %^%C%A<oJL$rJL!9$KI=<(
#zstyle ':completion:*' group-name ''
## %;%Q%l!<%?$r@_Dj$9$k
#zstyle ':completion:*' list-separator '-->'
#zstyle ':completion:*:manuals' separate-sections true
## L>A0$G?'$rIU$1$k$h$&$K$9$k
#autoload colors
#colors
# LS_COLORS$r@_Dj$7$F$*$/
#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# %U%!%$%kJd408uJd$K?'$rIU$1$k
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# cheat-sheet
#cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
#zle -N cheat-sheet
#bindkey "^[^h" cheat-sheet
# Jd40M=B,$r9T$&
#autoload predict-on
#predict-on
# syntax highlight
#if [ -f ~/local/zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#  source ~/local/zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#fi

#############################################################################
## ENV ######################################################################
#############################################################################

#export DISPLAY=:0.0
export DISPLAY=localhost:0.0
export HTTP_PROXY=http://172.24.13.20:12080
export HTTPS_PROXY=http://172.24.13.20:12080

#export

#if [ `ps aux | grep XWin | wc -l` -eq 0 ] ;then
#       startxwin -- -listen tpc &
#fi

#############################################################################
## ALIAS ####################################################################
#############################################################################

alias ls='ls --color'
alias ssh='ssh -XY'
alias matlab='matlab -nosplash -nodesktop -r'
