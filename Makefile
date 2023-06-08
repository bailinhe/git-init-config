include .env

user:
	git config --global user.name ${USER}
	git config --global user.email ${EMAIL}

editor:
	git config --global core.editor vim

~/.ssh:
	mkdir -p ~/.ssh
ssh-dir: ~/.ssh

${SSH_KEY}: ssh-dir
	ssh-keygen -t ed25519 -f ${SSH_KEY}
ssh-key: ${SSH_KEY}

ssh-config:
	./github.sh ${SSH_KEY}

gpg-key:
	gpg --full-generate-key

gpg-list:
	gpg --list-secret-keys --keyid-format=long

gpg-export:
	gpg --armor --export ${KID}

gpg-git:
	git config --global user.signingkey ${KID}
	git config --global commit.gpgsign true

all: user ssh-key editor

.PHONY: user