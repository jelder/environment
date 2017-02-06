ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

install: config /usr/local/bin/brew tools

config: ~/.bashrc ~/.bash_profile

/usr/local/bin/brew:
	@/usr/bin/ruby -e "$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

~/.bashrc:
	ln -s $(ROOT_DIR)/.bashrc ~/.bashrc

~/.bash_profile:
	ln -s $(ROOT_DIR)/.bash_profile ~/.bash_profile

tools:
	brew tap homebrew/dupes
	brew install git
	brew install bash-git-prompt
	brew install grep --with-default-names
	brew install binutils
	brew install diffutils
	brew install ed --with-default-names
	brew install findutils --with-default-names
	brew install gnu-indent --with-default-names
	brew install gnu-sed --with-default-names
	brew install gnu-tar --with-default-names
	brew install gnu-which --with-default-names
	brew install docker-compose-completion
	brew isntall launchctl-completion
	brew install ack
