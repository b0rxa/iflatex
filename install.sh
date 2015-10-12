#!/bin/bash

tar xvfz iflatex.tar.gz
direc=/usr/share/texlive/texmf-dist/tex/latex/

if [ ! -e $direc ]
then
	echo $direc directory not found. Please insert the directory where the package has to be installed
	read direc
fi

if [ ! -e $direc/iflatex ]
then
	mv iflatex $direc
else
	mv iflatex/* $direc/iflatex
fi

chmod 644 /usr/share/texlive/texmf-dist/tex/latex/iflatex/*
chmod 755 /usr/share/texlive/texmf-dist/tex/latex/iflatex

texhash
