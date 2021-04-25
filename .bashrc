#!bin/bash
# ~/.bashrc: executed by bash for non-login shells.
case $- in
    *i*) ;;
      *) return;;
esac
# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi
# envrc variables
if [ -f ~/.envrc ]; then
   source ~/.envrc
fi
# Alias definitions.
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Add toolbin directories to PATH permanatly

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export BCFTOOLS_PLUGINS=$HOME/toolbin/bcftools/plugins
export PATH=$PATH:$HOME/toolbin/bcftools:$JAVA_HOME:$BCFTOOLS_PLUGINS:$HOME/toolbin:$HOME/toolbin/samtools:$HOME/toolbin/htslib:$HOME/toolbin/picard:$HOME/toolbin/gatk:$HOME/toolbin/iaap-cli:$HOME/toolbin/boost_1_66_0:$HOME/toolbin/rtg-tools

# Enable bash programmable completion features in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then
    bind "set completion-ignore-case on";
    # Show auto-completion list automatically, without double tab
    bind "set show-all-if-ambiguous On";
    # Disable the bell
    bind "set bell-style visible";
fi
# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # add color to the output of ls
    alias ls='ls -altghr --color=auto -hF --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # add color to the output of ls
    alias ls='ls -altghr --color=auto -hF --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#export LS_COLORS="di=1;34;40:ln=1;36;40:so=1;35;40:pi=1;93;40:ex=1;31;40:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;47:ow=0;43"
export LS_COLORS="di=0;32:ln=0;36:so=0;35:pi=0;93:ex=0;31:bd=0;34;46:cd=0;34;43:su=0;41:sg=0;46:tw=0;47:ow=0;43:fi=0;33"
export EDITOR='emacs -nw'
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Check the window size after each command and, if needed update the values of LINES and COLUMNS
shopt -s checkwinsize
# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# "**" pattern used in a pathname expansion will match all files and 0 or more dirs and subdirs
shopt -s globstar

alias h=history
PROMPT_COMMAND='history -a'
# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
# Don't put duplicate lines in the history and do not add lines that start with a space
set -o notify
export HISTCONTROL=erasedups:ignoredups:ignorespace
export PYTHONSTARTUP="/home/drew/.pythonrc"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------
#Automatically do an ls after each cd
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ll
  else
    builtin cd ~ && ll
  fi
}
# A function to pipe any command to less:                                                                                                                                                                         
function so {
eval "$@" |less -I~
}
# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }
# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }
#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more
}
# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}
# Copy and go to the directory
cpg ()
{
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}
# Move and go to the directory
mvg ()
{
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}
# Create and go to the directory
mkdirg ()
{
	mkdir -p $1
	cd $1
}
# Goes up a specified number of directories  (i.e. up 4)
up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}
# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
# extract any type of compressed file
extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}
# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(load)
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then
        echo -en ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
        echo -en ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
        echo -en ${BRed}
    else
        echo -en ${Green}
    fi
}
# Returns a color according to free disk space in $PWD.
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then
        echo -en ${Red}
        # No 'write' privilege in the current directory.
    elif [ -s "${PWD}" ] ; then
        local used=$(command df -P "$PWD" |
                   awk 'END {print $5} {sub(/%/,"")}')
        if [ ${used} -gt 95 ]; then
            echo -en ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then
            echo -en ${BRed}            # Free disk space almost gone.
        else
            echo -en ${Green}           # Free disk space is ok.
        fi
    else
        echo -en ${Cyan}
        # Current directory is size '0' (like /proc, /sys etc).
    fi
}
# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then
        echo -en ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ] ; then
        echo -en ${BCyan}
    fi
}

# Ruby variables
export GEM_HOME="$HOME/gems"
if [ -f "/home/drew/.gem/ruby/2.7.0/" ]; then
    export PATH_TO_RUBY="/home/drew/.gem/ruby/2.7.0/bin"
    PATH=$PATH:"/home/drew/.gem/ruby/2.7.0/":"/home/drew/.gem/ruby/2.7.0/bin":"/home/drew/.gem/ruby/2.7.0/gems":"~/.gem/ruby/2.7.0/gems/gemsbundler-2.1.4"       
fi

# >>> conda initialize >>>
__conda_setup="$('/home/drew/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    [ -f "/home/drew/miniconda3/etc/profile.d/conda.sh" ]
fi
    
unset __conda_setup
conda deactivate
export PATH=$HOME/toolbin:$HOME/toolbin/bcftools:$HOME/toolbin/bcftools/plugins:/home/drew/miniconda3/condabin:/home/drew/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/drew/toolbin/bcftools:/usr/lib/jvm/java-11-openjdk-amd64/:/home/drew/toolbin/bcftools/plugins:/home/drew/toolbin:/home/drew/toolbin/samtools:/home/drew/toolbin/htslib:/home/drew/toolbin/picard:/home/drew/toolbin/gatk:/home/drew/toolbin/iaap-cli:/home/drew/toolbin/boost_1_66_0:/home/drew/toolbin/rtg-tools:/home/drew/toolbin/sratoolkit:/home/drew/toolbin/edirect
PERL5LIB=/usr/local/share/perl/5.26.1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# AWS ENV VARS
# add the following to ~/.aws/credentials file
#[264499609354_AWSAdministratorAccess]
#aws_access_key_id=ASIAT3FLHX4FD6Q2K6Q5
#aws_secret_access_key=sgfh2lq0sHSUV4YzN0uweLZ0ZDAzUDWTOiaJeL4F
#aws_session_token=IQoJb3JpZ2luX2VjEJn//////////wEaCXVzLWVhc3QtMSJGMEQCIBfTHZ9ye+qpguYNr1oOXZpm00/KfrGFxJXJeAMy/DLXAiB/NhnPDax4TRNz62nnsURieO6xmstJw6MxVWcBJeHcACqNAwgREAAaDDI2NDQ5OTYwOTM1NCIMr04Oq2MG7g1RKY4JKuoCeg5TaQgdI14pySwAa42QPd3V+SKnqt/L4BfA7dKK/i6DeS1yTbpLoihpCD4YwXXQhbmtu700xtkLIT35bIyE29Zn1QpSBqyh76lrIXfTbYw1S7sIPD5p5V7mB5/MvtEe4Hd2MW/Yw1ZUT2wVVbpKCSjVZcZck2zFGqkdzyJ4UVIFsMVpS6J/4mMn+44k00XiLbedX8xGEdJfheOHVcZ+9qoYa4miLbrGVzruySTjXiHEVIHxtqPpaATzvcAkk5nxxK+nX932zGZUtOvsOlo9vq8XcjFbBz0XEZZjsAHrtk0ZSplfWFubaKwfGkpSQ4mA6/ulgHRjA4aZR6OjDO2nPW5Lg/5c28cx7Zzle8FFk6+ROk9VAz8m9Np8q6vrZbzYdoiGTQuad2kfT0Put0bNwe19Co9MA3VJTM0Z2Uof+y6nbtlf5A4ftKd1PO2YZ0xQG9+dYsKZV/UzKTEF2bVNiKx7D4o5D1jvoCIwwMqUhAY6pwGNmBDy9nCQBPXP9fG0OzC6NC2OkpS5E97u9/STIOIS1pg4DgJLbw4H+IkW+OAXc5dweTC7VRdifej+mmD50galGJYG7JWqN3lG2gf5LZS+NPxijltYnQaTUfp0HUWfuOCqcmul9ZDt8ZkRAe/hnpkJfGTvA/x/ZXStWq/7el/BtjBRCARVAIUd7JVetxmEEGxZMGSGk/5jT6TAh7Kkn4tA413/3g7R+A==
export AWS_ACCESS_KEY_ID="ASIAT3FLHX4FD6Q2K6Q5"
export AWS_SECRET_ACCESS_KEY="sgfh2lq0sHSUV4YzN0uweLZ0ZDAzUDWTOiaJeL4F"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEJn//////////wEaCXVzLWVhc3QtMSJGMEQCIBfTHZ9ye+qpguYNr1oOXZpm00/KfrGFxJXJeAMy/DLXAiB/NhnPDax4TRNz62nnsURieO6xmstJw6MxVWcBJeHcACqNAwgREAAaDDI2NDQ5OTYwOTM1NCIMr04Oq2MG7g1RKY4JKuoCeg5TaQgdI14pySwAa42QPd3V+SKnqt/L4BfA7dKK/i6DeS1yTbpLoihpCD4YwXXQhbmtu700xtkLIT35bIyE29Zn1QpSBqyh76lrIXfTbYw1S7sIPD5p5V7mB5/MvtEe4Hd2MW/Yw1ZUT2wVVbpKCSjVZcZck2zFGqkdzyJ4UVIFsMVpS6J/4mMn+44k00XiLbedX8xGEdJfheOHVcZ+9qoYa4miLbrGVzruySTjXiHEVIHxtqPpaATzvcAkk5nxxK+nX932zGZUtOvsOlo9vq8XcjFbBz0XEZZjsAHrtk0ZSplfWFubaKwfGkpSQ4mA6/ulgHRjA4aZR6OjDO2nPW5Lg/5c28cx7Zzle8FFk6+ROk9VAz8m9Np8q6vrZbzYdoiGTQuad2kfT0Put0bNwe19Co9MA3VJTM0Z2Uof+y6nbtlf5A4ftKd1PO2YZ0xQG9+dYsKZV/UzKTEF2bVNiKx7D4o5D1jvoCIwwMqUhAY6pwGNmBDy9nCQBPXP9fG0OzC6NC2OkpS5E97u9/STIOIS1pg4DgJLbw4H+IkW+OAXc5dweTC7VRdifej+mmD50galGJYG7JWqN3lG2gf5LZS+NPxijltYnQaTUfp0HUWfuOCqcmul9ZDt8ZkRAe/hnpkJfGTvA/x/ZXStWq/7el/BtjBRCARVAIUd7JVetxmEEGxZMGSGk/5jT6TAh7Kkn4tA413/3g7R+A=="

