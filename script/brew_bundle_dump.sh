#!/bin/bash
set -e

cd $(dirname $0)

if [ -e ./Brewfile ]
then
	rm ./Brewfile	
fi

brew bundle dump
