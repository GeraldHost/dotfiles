COLOR_REST="$(tput sgr0)"
COLOR_GREEN="$(tput setaf 2)"

function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo '('$branch') '
    fi
}

function working_dir() {
    dir=$(printf '%q\n' "${PWD##*/}")
    if [[ $dir == "" ]]; then
        :
    else
        echo $dir
    fi
}

export PS1='$(working_dir) $(git_branch)'\$' '


export PATH=/Users/rico/.cargo/bin:/Users/rico/.nvm/versions/node/v10.12.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.composer/vendor/bin:/Users/rico/Library/Python/3.7/bin:/Users/rico/.cargo/bin:/Users/rico/.nvm/versions/node/v10.12.0/bin:$HOME/.cargo/bin:/Users/rico/.cargo/bin:/Users/rico/.nvm/versions/node/v10.12.0/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd --type f --hidden'

alias n='nvim';
alias nf='nvim $(fzf)';
