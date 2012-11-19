#!/bin/sh
vimdir=~/.vim
if [ -e $vimdir ] && [ ! -L $vimdir ]
then
	mv $vimdir "$vimdir"_orig
fi
ln -s `pwd`/.vim $vimdir


vimrc=~/.vimrc
if [ -e $vimrc ] && [ ! -L $vimrc ]
then
	mv $vimrc "$vimrc"_orig
fi
ln -s `pwd`/.vimrc $vimrc

