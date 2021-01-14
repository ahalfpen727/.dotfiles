#!bin/bash
################################################
# file executed by bash for non-login shells.
################################################
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

############################################################
# Sudo Commands
#############################################################
# list installed packages
alias pkgs='sudo apt list --installed'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get remove --purge'
alias update='sudo apt-get update'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias sources='(gksudo geany /etc/apt/sources.list &)'
alias su="sudo -i"

#############################################################
# Python aliases
#############################################################
alias pip='pip3'
alias pyve='python3 -m venv ./venv'
alias pyva='source ./venv/bin/activate'

##############################################
# shorten ssh command to the ghpcc cluster
##############################################
alias sshghpcc='ssh aj26b@ghpcc06.umassrc.org; conda deactivate'
alias sshaws='ssh -i ".ssh/id_rsa.pub"  ubuntu@ec2-3-89-20-104.compute-1.amazonaws.com'

#####################################################################
# aliases for analyses and development
#####################################################################

alias emacs='emacs -nw'
# open emacs terminal (not emacs gui)
alias sudoemacs='sudo emacs -nw'
alias sudomysql='sudo mysql -u root -p'
alias remount="sudo mount -o remount,rw"
export PICARD="/home/drew/toolbin/picard.jar"
alias picard="java -jar $PICARD"
export GATK="/home/drew/toolbin/gatk-4.1.9.0/gatk-package-4.1.0.0-local.jar"
alias gatk="java -jar $GATK"
export BCFTOOLS_PLUGINS="/home/drew/toolbin/bcftools/plugins/"
export EAGLE="/home/drew/toolbin/eagle_v2.4.1"
alias eagle="bash $EAGLE"
alias igv="bash /home/drew/toolbin/IGV_2.8.12/igv.sh"
alias igvtools="bash /home/drew/toolbin/IGV_2.8.12/igvtools"
alias bamseek="java -jar BAMseek2011July24.jar"
# nextflow
#alias nextflow="nextflow.sh"

#####################################################################
# aliases for maneuvering around the directory heirarchy
#####################################################################
# ls aliases
alias ls='ls -altghr --color=auto -hF --group-directories-first'
alias lss='ls ../ -altghr --color=auto -hF --group-directories-first'
alias lsss='ls ../../ -altghr --color=auto -hF --group-directories-first'
# for typos
alias ks='ls -altghr --color=auto -hF --group-directories-first'
# add color to the output of dir
alias dir='dir --color=auto'
alias mkdir='mkdir -p'
alias vdir='vdir --color=auto'
# add color to the output of grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# aliases for git
alias remoteorigin="git remote add origin https://github.com/ahalfpen727"
# must add repo-name.git
alias pushorigin="git push -u origin master"
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LS_COLORS="di=1;34;40:ln=1;36;40:so=1;35;40:pi=1;93;40:ex=1;31;40:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;47:ow=0;43"

#########################################################                                                            
# http://norbauer.com/notebooks/code/notes/ls-colors-and-terminal-app
# used BSD pattern ExGxFxDxBxEgEdxbxgxhxd on http://geoff.greer.fm/lscolors/
# I specified the colors by looking manually at After switching to RStudio:
# https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
#########################################################                                                            
#alias repos='sudo egrep -h -v -E "(^#)|(^$)" /etc/apt/sources.list $(ls /etc/apt/sources.list.d/*.list 2> /dev/null)'

#########################################################
# Conda commands
###################                                                                                

alias activate='conda activate'
alias deactivate='conda deactivate'

###################
# safety features
###################

alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserv'

#######################
# cd aliases
#######################                                                                            

alias less='less -r'
alias where='type -a'
alias vi='vim'
alias clr='clear'
alias du='du -c -h'
alias du0='du --max-depth=0'
alias du1='du --max-depth=1'
alias df='df -lh'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

#################                                                              # Spelling typos                                                               #################                                                                                  
alias ks='ls'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'

#######################                                                        # ls customized
#######################                                                                           
alias ls='ls -FC --color'
alias ld='ls -d */'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias lr='ls -R'  # recursive ls
alias lx='ll -BX' # sort by extension
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias lm='la | more'
alias dir='ls -l --format=long'
alias vdir='ls -l --format=long'

