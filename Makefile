ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

install: brew config

config: bashrc bash_profile

brew: /usr/local/bin/brew
	@/usr/bin/ruby -e "$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

bashrc: $(ROOT_DIR)/.bashrc
	ln -s $(ROOT_DIR)/.bashrc ~/.bashrc

bash_profile: $(ROOT_DIR)/.bash_profile
	ln -s $(ROOT_DIR)/.bash_profile ~/.bash_profile

taps: taps_dupes

taps_dupes: $(realpath /usr/local/Homebrew/Library/Taps/homebrew/homebrew-dupes)
	brew tap homebrew/dupes

tools: taps
	brew install grep --with-default-names
	brew install binutils
	brew install diffutils
	brew install ed --with-default-names
	brew install findutils --with-default-names
	brew install gnu-indent --with-default-names
	brew install gnu-sed --with-default-names
	brew install gnu-tar --with-default-names
	brew install gnu-which --with-default-names
	brew install ack
