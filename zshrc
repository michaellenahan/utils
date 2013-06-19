# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
# ZSH_THEME="steeef"
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git nyan)
# drush completion comes from: https://github.com/webflo/drush_zsh_completion
plugins=(drush git git-flow per-directory-history)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# ML
# http://askubuntu.com/questions/132977/how-to-get-global-application-menu-for-gvim
# commented out because the next gvim() function takes priority.
# reinstated now. see comment below.
# ML
# commented out again because I like having the keyboard shortcut hints for vim
# https://bugs.launchpad.net/ubuntu/+source/vim/+bug/1007075
# function gvim () { (/usr/bin/gvim -f "$@" &) }

# ML
# ensure only one open instance of gvim at a time.
# http://stackoverflow.com/questions/936501/let-gvim-always-run-a-single-instance
# Commented out because now I open new tabs *within* gvim with :tabe
#gvim () { command gvim --remote-tab-silent $@ || command gvim $@; }

# ML
# create a folder in yyyy-mm-dd format
alias mkdirtoday='mkdir $(date +%F) && cd $(date +%F)'
alias cdtoday='cd $(date +%F)'

# ML
# http://superuser.com/questions/310914/permanently-change-date-time-format-for-ls
export TIME_STYLE=long-iso

# ML
# http://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard
# pwd | xclip --- this will copy pwd to the clipboard, using the alias below.
# http://elcasey.wordpress.com/2008/02/12/xclip-use-the-clipboard-from-the-command-line/
alias xclip='xclip -selection clipboard'

export GPGKEY=97F739C3

# Switch off autocorrect.
# http://superuser.com/questions/439209/how-to-partially-disable-the-zshs-autocorrect
unsetopt correct_all
