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
alias su="sudo -i"
alias pkgs='sudo apt list --installed'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get remove --purge'
alias update='sudo apt-get update'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias sources='(gksudo geany /etc/apt/sources.list &)'
alias repos='sudo egrep -h -v -E "(^#)|(^$)" /etc/apt/sources.list $(ls /etc/apt/sources.list.d/*.list 2> /dev/null)'
alias remount="sudo mount -o remount,rw"
#########################################################
# safety features
#########################################################
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserv'
#############################################################
# Python aliases
#############################################################
alias python='python3.6'
alias pyve='python3 -m venv ./venv'
alias pyva='source ./venv/bin/activate'
#alias pip='pip3'
##############################################
# shorten ssh command to the ghpcc cluster
##############################################
alias sshghpcc='ssh aj26b@ghpcc06.umassrc.org; conda deactivate'
alias sshaws='ssh -i ".ssh/id_rsa.pub"  ubuntu@ec2-3-89-20-104.compute-1.amazonaws.com'
#####################################################################
# bioinformatics tool env variables
#####################################################################
export BCFTOOLS_PLUGINS="~/toolbin/bcftools/plugins/"
export PICARD="~/toolbin/picard/build/libs/picard.jar"
export GATK="~/toolbin/gatk-4.2.2.0/gatk-package-4.2.2.0-local.jar"
export GATK2="~/toolbin/gatk-4.2.6.1/gatk-package-4.2.6.1-local.jar"
export SNPEFF="~/toolbin/snpEff/snpEff.jar"
#export EAGLE="~/toolbin/eagle_v2.4.1"
#####################################################################
# bioinformatics aliases
#####################################################################
alias picard="java -jar $PICARD"
alias gatk="java -jar $GATK"
alias igv="bash ~/toolbin/IGV/igv.sh"
alias igvtools="bash ~/toolbin/IGV/igvtools"
alias iaap="~/toolbin/iaap-cli/iaap-cli gencall"
alias eagle="bash $EAGLE"
alias snpeff="java -jar $SNPEFF"
#alias bamseek="java -jar BAMseek2011July24.jar"
#alias plink="~/toolbin/plink"
#alias beagle="java -jar ~/toolbin/beagle.jar"
#lias bref3="java -jar ~/toolbin/bref3.jar"
#alias impute5="~/toolbin/impute5"
#alias imp5Converter="~/toolbin/imp5Comverter"
# nextflow
alias nextflow="~/.dotfiles/nextflow.sh"
# Conda commands
alias activate='conda activate'
alias deactivate='conda deactivate'
# aliases for git
alias remoteorigin="git remote add origin https://github.com/ahalfpen727"
# must add repo-name.git
alias pushorigin="git push -u origin master"
#####################################################################
# aliases for maneuvering around the directory heirarchy
#####################################################################
alias vi='vim'
# open emacs terminal (not emacs gui)
alias emacs='emacs -nw'
alias sudoemacs='sudo emacs -nw'
alias sudomysql='sudo mysql -u root -p'
alias less='less -r'
alias where='type -a'
alias clr='clear'
alias du='du -c -h'
alias du0='du --max-depth=0'
alias du1='du --max-depth=1'
alias df='df -lh'
alias ..="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
# ls aliases
alias ls='ls -altghr --color=auto -hF --group-directories-first'
alias lss='ls ../ -altghr --color=auto -hF --group-directories-first'
alias lsss='ls ../../ -altghr --color=auto -hF --group-directories-first'
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
# add color to the output of dir
alias dir='dir --color=auto'
alias mkdir='mkdir -p'
alias vdir='vdir --color=auto'
# add color to the output of grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LS_COLORS="di=1;34;40:ln=1;36;40:so=1;35;40:pi=1;93;40:ex=1;31;40:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;47:ow=0;43"








































