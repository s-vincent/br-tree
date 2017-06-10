#!/bin/sh
#
# Custom scripts for logged users

# Adds our custom commands to PATH
PATH=$PATH:/usr/local/bin

# Prompt with hostname and local directory
PS1='\h[\W]\$ '
