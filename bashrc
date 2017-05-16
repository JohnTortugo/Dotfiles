# alias to create directory $1 and automatically change to directory $1 function mk { mkdir $1; cd $1/; } 
function send_b44 { scp $1 linaro@10.68.30.44:~/Magicore/testdir/ ; }
function get_b44 { scp linaro@10.68.30.44:~/Magicore/testdir/$1 . ; }

function send_ultra { scp $1 unicamp@10.68.30.46:~/Magicore/testdir/ ; }
function get_ultra { scp unicamp@10.68.30.46:~/Magicore/testdir/$1 . ; }

function get_ed { scp divcesar@10.68.30.42:/home/ed/$1 . ; }

function send_lsc { scp $1 divcesar@ssh:~ ; }

function csrc { grep -rnI $1 ; }

function hsrc { history | grep --color $1 ; }

# function to setup shell for developing with BDX+Clang
function setup_bdx() {
    export PATH=$PATH:/home/divcesar/Workfolder/DoAcrossClause.build/bin
    export BLIB=/home/divcesar/Workfolder/DoAcrossClause.src/lib/Transforms/DoAcrossClause-Pass/Release/

    export LD_LIBRARY_PATH=/home/divcesar/Workfolder/openmp/runtime/build/src/:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/opt/intel/inspector_2017.1.2.497970/lib64/runtime/:$LD_LIBRARY_PATH

    export LIBRARY_PATH=/home/divcesar/Workfolder/openmp/runtime/build/src/:$LIBRARY_PATH
    export LIBRARY_PATH=/opt/intel/inspector_2017.1.2.497970/lib64/runtime/:$LIBRARY_PATH

    export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/divcesar/Workfolder/openmp/runtime/build/src/
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:/opt/intel/inspector_2017.1.2.497970/include/

    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/divcesar/Workfolder/openmp/runtime/build/src/
    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/intel/inspector_2017.1.2.497970/include/
}


# function to set up intel apps
function setup_intel {
	lns=`cat /proc/sys/kernel/yama/ptrace_scope | grep "1" | wc -l`
	if [ $lns -eq 1 ]; then   
		echo "0" | sudo tee /proc/sys/kernel/yama/ptrace_scope
		#echo "Need to set ptrace_scope"
	fi

	lns=`cat /proc/sys/kernel/nmi_watchdog | grep "1" | wc -l`
	if [ $lns -eq 1 ]; then   
		echo "0" | sudo tee /proc/sys/kernel/nmi_watchdog
		#echo "Need to set nmi_watchdog"
	fi

	source /opt/intel/vtune_amplifier_xe/amplxe-vars.sh
}

# find the strongly connected components of a graph 
# input graph is in DOT format
function DotToScc() {
	var=`pwd`;
	cd /home/divcesar/Doutorado/Experiments/src-utils/sccs/
	
	java DotToScc "$var/$1"

	nome=`basename $1 .dot`

	mv tmpGraph.txt "$var/$nome"_sccs.dot

	cd -
}

# Produce a png graph file based on dot input graph
function DotToPng() {
	output=`basename $1 .dot`

	dot -Tpng $1 -o $output".png"
}

function makeAllDot() {
	dir=`pwd`

	for i in `find $dir/*.dot -printf "%f\n"` ; 
	do 
		#echo $i;
		dot -Tpng $i -o "$i.png";
	done
}

function videoFromPng() {
	echo "Usage: videoFromPng <start_number> <file_pattern> <output_file>"
	ffmpeg -framerate 1/0.3 -start_number $1 -i $2 -r 25 -s 1920x1080 -crf 25 -vcodec libx264 $3
}


function djvu2pdf() {
	ddjvu -format=pdf -quality=85 -verbose $1.djvu $1.pdf
}

export SVN_SSH="ssh -p 6868"
export EDITOR="gvim"
export LC_ALL="en_US.UTF-8"

alias ls='ls -lh'
alias web='google-chrome'
alias gvim='gvim -p'
alias fm='nautilus . 2> /dev/null '
alias pfind='apt-cache search'
alias pinst='sudo apt install'
alias c='clear && make clean && make'
alias m='make'

PS1='[\u@\h \W]\$ '

PATH=/usr/local/texlive/2013/bin/x86_64-linux/:$PATH
PATH=/home/$USER/Dropbox/Doutorado/Experimentos/src_utils:$PATH

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# Configuration file for BC
export BC_ENV_ARGS=~/.bc

# This makes antlr works
export CLASSPATH=".:/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH"

alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
unset color_prompt force_color_prompt

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
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
