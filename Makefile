
.PHONEY: all install

all:
	@echo "To install shutils, run `make install`"

install:
	mkdir ~/.shutils
	mkdir ~/.shutils/bin
	cp ./scripts/*.sh ~/.shutils/
	cp ./scripts/bin/* ~/.shutils/bin/
