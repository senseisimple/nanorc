#!/bin/bash
#20121212 - Get remote nanorc src and install http://github.com/senseisimple/nanorc

test_nanorc () {
	[ -d ~/.nano/nanorc/examples ] && nano ~/.nano/nanorc/examples/*
}

install_nanorc () {
    PREVD=$PWD
    SCCS=1

    if [ "$(which git)" = "" ]; then
        echo -e "git binary is missing. Please install prior to running.\n If on Ubuntu/Debian, apt-get install git"
    else
    	rm -rf ~/.nano/nanorc
        mkdir -p ~/.nano/nanorc
        cd ~/.nano

        git clone git://github.com/senseisimple/nanorc.git -b LocalVersion && \
        cd nanorc && make $@ && SCCS=0 && \
        [ -s /etc/nanorc ] && sudo mv /etc/nanorc /etc/nanorc.BAK

        cd "$PREVD"

        if [ "$SCCS" = "0" ]; then
        echo -e "\n~/.nanorc Installed."
        echo -ne "\nRun Syntax Highlighting test? [y]/n  "
        read RUNNANOTEST
        [ "$RUNNANOTEST" = "y" ] || [ "$RUNNANOTEST" = "" ] && test_nanorc
        echo -e "\nDone."
        fi
    fi
}

install_nanorc $@