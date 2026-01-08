alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME'

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}

function git-branch-prompt {
	local branch=`git-branch-name`
	if [ $branch ]; then printf " <%s>" $branch; fi
}

#  PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00M\] '
PS1="\[\033[01;32m\]\u@\h \[\033[0;34m\]\w\[\033[01;31m\]\$(git-branch-prompt)\[\033[0m\] \$ "
export PATH=$PATH:$HOME/.local/bin
export TERMINAL=/bin/st

## export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
## # export SSH_ASKPASS=/usr/lib/seahorse/seahorse-ssh-askpass
## export SSH_ASKPASS=/usr/lib64/misc/x11-ssh-askpass
export _JAVA_OPTIONS=-Dawt.useSystemAAFontSettings=on
## gpgconf --launch gpg-agent

#export SSH_ASKPASS="/usr/bin/pinentry-gtk-2"
# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Huge interface/font using openjdk11 for java applications
export J2D_UISCALE=1

# Correção dos gráficos  no Gnucash com gráficos da Nvidia
WEBKIT_DISABLE_DMABUF_RENDERER=1

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null



# Instalação do asdf-vm
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export LIBVA_DRIVER_NAME="nvidia"

source .alias
