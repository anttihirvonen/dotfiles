# Dotfiles

These are my dotfiles for development work on *nix-based systems. As I develop on both Mac and Linux and also over SSH, I've tried to set everything up so the programs (like Vim) work and look pretty much the same in different environments.

# Installation

`git clone https://github.com/anttihirvonen/dotfiles.git && cd dotfiles && git submodule init && git submodule update`

Clone the repository and run `rake install`. This symlinks all the dotfiles from the home directory to the cloned repository. Note that the old files are lost in this process!

## Extra steps

TODO: document everything that needs to be done to successfully set up a dev environment (other than installing dotfiles)

### Mac

### Linux


# Links

[Inconsolata – the best programming font](http://www.levien.com/type/myfonts/inconsolata.html)


# TODO
- [ ] Use Vundle instead of Pathogen to install Vim plugins
- [ ] Install YouCompleteMe for C/C++ completion (some problems with MacVim, resolve)
- [ ] Convert Ruby-based dotfiles install script to shell script
- [ ] Add script for setting OS X defaults

