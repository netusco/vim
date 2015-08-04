#!/bin/bash

echo ""
echo "This will install vim git submodules and .vimrc"
while true; do
    read -p "Do you want to continue y or n? " yn
    case $yn in
        [Yy]* )
                ln -sf ~/.vim/.vimrc ~/.vimrc ;
                git submodule update --init ;
                echo "Done.";
                break;;
        [Nn]* ) echo "Bye";
                exit;;
        * ) echo "Please answer yes or no.";
                echo "";;
    esac
done
