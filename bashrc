# alias to create directory $1 and automatically change to directory $1
function mk { mkdir $1; cd $1/; }

function send_b44 { scp $1 linaro@10.68.30.44:~/Magicore/testdir/ ; }

function send_lsc { scp $1 divcesar@ssh:~ ; }

function csrc { grep -rnI $1 ; }

function hsrc { history | grep --color $1 ; }

# function to setup shell for developing TaskFinder
function setup_tf() {
	export OBJ_ROOT=/home/divcesar/Workspace/llvm-3.7.0.build/
	export SRC_ROOT=/home/divcesar/Workspace/llvm-3.7.0.src/
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
alias web='chromium'
alias gvim='gvim -p'
alias fm='dolphin . &'
alias term='urxvtc'
alias pfind='apt-cache search'
alias pinst='sudo apt-get install'
alias vtune='amplxe-gui'

PS1='[\u@\h \W]\$ '

PATH=/usr/local/texlive/2013/bin/x86_64-linux/:$PATH
PATH=/home/$USER/Dropbox/Doutorado/Experimentos/src_utils:$PATH

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# This makes antlr works
export CLASSPATH=".:/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH"

alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
