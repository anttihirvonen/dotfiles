# load virtualenvwrapper if installed (.virtualenvwrapper.sh
# should be a symlink to real file)
[ -x ~/.virtualenvwrapper.sh ] && source ~/.virtualenvwrapper.sh

has_virtualenv() {
    if [ -e .venv ]; then
        workon `cat .venv`
    fi
}

virtualenv_cd() {
    builtin cd "$@" && has_virtualenv
}

# Automatically activate virtualenvs if .venv file exists
alias cd="virtualenv_cd"
