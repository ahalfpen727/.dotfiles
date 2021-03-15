#!/usr/bin/env bash
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
    export PATH="$HOME/bin":$PATH
fi
