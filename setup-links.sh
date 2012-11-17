#!/bin/sh
vimdir=~/.vim
if [ -e $vimdir ] && [ ! -L $vimdir ]
then
	mv $vimdir "$vimdir"_orig
	ln -s `pwd`/.vim $vimdir
fi


vimrc=~/.vimrc
if [ -e $vimrc ] && [ ! -L $vimrc ]
then
	mv $vimrc "$vimrc"_orig
	ln -s `pwd`/.vimrc $vimrc
fi
