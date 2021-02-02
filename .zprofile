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

fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(fzf --preview 'bat {-1} --color=always')" && nvim "$file"
}

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  #[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export FZF_DEFAULT_COMMAND='fd --type f --hidden -E .git'

alias n='nvim';
alias nf='nvim $(fzf)';
alias wk='cd ~/Workspace';

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Users/rico/.local/bin:$PATH"
export PATH="/Users/rico/bin/Sencha/Cmd/7.2.0.84:$PATH"

export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
