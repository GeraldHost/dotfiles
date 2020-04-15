COLOR_REST="$(tput sgr0)"
COLOR_GREEN="$(tput setaf 2)"
COLOR_MAGENTA="$(tput setaf 5)"
COLOR_CYAN="$(tput setaf 6)"
COLOR_YELLOW="$(tput setaf 3)"

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

function parent_working_dir() {
    dir=$(cd .. && echo "${PWD##*/}")
    if [[ $dir == "" ]]; then
        :
    else
        echo $dir
    fi
}
export PS1='$COLOR_MAGENTA$(parent_working_dir)$COLOR_YELLOW/$COLOR_CYAN$(working_dir)$COLOR_GREEN $(git_branch)🦀$COLOR_REST\n\$ '


export PATH=/Users/rico/.cargo/bin:/Users/rico/.nvm/versions/node/v10.12.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.composer/vendor/bin:/Users/rico/Library/Python/3.7/bin:/Users/rico/.cargo/bin:/Users/rico/.nvm/versions/node/v10.12.0/bin:$HOME/.cargo/bin:/Users/rico/.cargo/bin:/Users/rico/.nvm/versions/node/v10.12.0/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH


export FZF_DEFAULT_COMMAND='fd --type f --hidden'

alias n='nvim';
alias nf='nvim $(fzf)';

