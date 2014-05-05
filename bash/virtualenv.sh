# load virtualenvwrapper if installed
[ -x /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

has_virtualenv() {
    if [ -e .venv ]; then
        workon `cat .venv`
    fi
}

virtualenv_cd() {
    builtin cd "$@" && has_virtualenv
}

# Create virtualenv named after current directory
# and also install dependencies from config/dev.txt
# if it exists
mkcurvirtualenv() {
    NAME=$(basename $PWD)
    
    if mkvirtualenv --no-site-packages $NAME; then
        workon $NAME
        if [ -f $(pwd)/config/dev.txt ]; then
            pip install -r $(pwd)/config/dev.txt
        fi
    fi
}

# Automatically activate virtualenvs if .venv file exists
alias cd="virtualenv_cd"
