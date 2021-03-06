# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
#export EDITOR=vim

# i like nano for a basic text editor
export EDITOR=nano

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
#bindkey -v
#bindkey "^F" vi-cmd-mode
#bindkey jj vi-cmd-mode

# fix forward delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling.
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# subverison stuff
# from http://blog.crazyfraggle.com/2009/10/subversion-helper-functions-in-zsh.html
svnstatus () {
 templist=`svn status $*`
 echo `echo $templist | grep '^?' | wc -l` unversioned files/directories
 echo $templist | grep -v '^?'
}

svnup () {
 svn log --stop-on-copy -r HEAD:BASE $1
 svn up $1
}

#finds all files ending with certain extensions
svnwhiteliststatus () {
	templist=`svn status $*`
	findfiles='png$\|jpg$\|pdf$\|gif$\|php$\|rb$|\erb$\|html$\|css$\|rhtml$\|js$\|inc$\|swf$\|dwt$\|sql$'
	#echo `echo $findfiles`
	echo $templist | grep $findfiles
}

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/Users/jmiller/.homebrew/bin:/usr/local/mysql/bin:/opt/subversion/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

