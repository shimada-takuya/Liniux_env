if status is-interactive
    # Commands to run in interactive sessions can go here

    # bind
    fish_vi_key_bindings

    # proxy
    set -x HTTP_PROXY http://172.24.13.20:12080
    set -x HTTPS_PROXY http://172.24.13.20:12080

    # display
    set -x DISPLAY localhost:0.0

    # alias
    alias ssh='ssh -XY'

    # pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    set -x PATH $PYENV_ROOT/bin $PATH
    status is-login; and pyenv init --path | source
    if status is-interactive
        pyenv init - | source
    end

    # env
    set -x LESS '-R -M'
end

function fish_prompt
    printf "%s %s %s %s \n%s%s " (set_color blue)(echo $USER) (set_color white)(echo \@) (set_color red)(prompt_hostname) (set_color cyan)(prompt_pwd) (set_color magenta)(fish_git_prompt) (set_color green)(echo "->")
end

function fish_right_prompt
    printf "%s" (set_color yellow)(date +'%y-%d-%m %H:%M:%S')
end

function fish_greeting
end
