#!bash
# brew install binutils && \
# brew install diffutils && \
# brew install ed --with-default-names && \
# brew install findutils --with-default-names && \
# brew install gnu-indent --with-default-names && \
# brew install gnu-sed --with-default-names && \
# brew install gnu-tar --with-default-names && \
# brew install gnu-which --with-default-names && \
# brew tap homebrew/dupes && brew install grep --with-default-names && \
# brew install ack

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

function prepend_path() {
  export PATH=$1:$PATH
}

prepend_path /usr/local/opt/coreutils/libexec/gnubin/
prepend_path /Applications/Postgres.app/Contents/Versions/9.5/bin/
prepend_path /usr/local/share/npm/bin
prepend_path /usr/local/go/bin
prepend_path ./node_modules/.bin
prepend_path ~/bin
prepend_path /usr/local/heroku/bin

export ACK_OPTIONS=-C3
export ACK_PAGER=less
export EDITOR="subl -w"
export GOPATH=~
export INPUTRC=~/.inputrc
export LESS=-RXF
export PROMPT_COMMAND='history -a'

export HISTCONTROL=ignoredups
export HISTFILESIZE=1000000
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=1000000
export HISTTIMEFORMAT='%F %T '

# http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

# If set, Bash attempts to save all lines of a multiple-line command in the
# same history entry. This allows easy re-editing of multi-line commands.
shopt -s cmdhist

# If set, Bash checks the window size after each command and, if necessary,
# updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, Bash attempts spelling correction on directory names during word
# completion if the directory name initially supplied does not exist.
# shopt -s dirspell

# If set, the pattern ‘**’ used in a filename expansion context will match all
# files and zero or more directories and subdirectories. If the pattern is
# followed by a ‘/’, only directories and subdirectories match.
# shopt -s globstar

# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
eval "$(rbenv init - --no-rehash)"

eval $(dircolors)

eval "$(direnv hook bash)"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.envrc ] && . ~/.envrc
