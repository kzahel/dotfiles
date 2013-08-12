# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gentoo"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh


# Customize to your needs...

# export TERM=xterm-256color

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias emacsx="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias aemacsx="/Applications/Aquamacs.app/Contents/MacOS/Aquamacs"
export GIT_EDITOR=emacs
export ANDROID_SDK=/Users/kyle/android/adt-bundle-mac-x86_64-20130514/sdk
export ANDROID_TOOLCHAIN=/Users/kyle/android/toolchain_32
export jl1="ssh -A jump1.lon.spotify.net"

#osx python devel guide stuff
export PATH=/usr/local/bin:${PATH}

 export PATH=${PATH}:/usr/local/share/python # for pip executables
 export WORKON_HOME=${HOME}/virtualenvs
 export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
 source /usr/local/share/python/virtualenvwrapper_lazy.sh

export PATH=$PATH:/usr/local/go/bin:/Users/kyle/go/bin
export GOPATH=/Users/kyle/go
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib
