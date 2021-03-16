#!/bin/sh

case ${OSTYPE} in
    darwin*)
        chmod +x darwin/*.sh
        cd ${HOME}/setup/darwin
        ;;
    linux*)
        chmod +x linux/*.sh
        cd ${HOME}/setup/linux
        ;;
esac

command install.sh
command settings.sh
