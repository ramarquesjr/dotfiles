alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}

function git-branch-prompt {
	local branch=`git-branch-name`
	if [ $branch ]; then printf " <%s>" $branch; fi
}

PS1="\[\033[01;32m\]\u@\h \[\033[0;34m\]\w\[\033[01;31m\]\$(git-branch-prompt)\[\033[0m\] \$ "
#PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00M\] '
export PATH=$PATH:$HOME/.local/bin

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_ASKPASS=/usr/lib/seahorse/seahorse-ssh-askpass
gpgconf --launch gpg-agent
