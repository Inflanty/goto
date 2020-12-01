#!/bin/bash

# HOW to use - TODO: make better help
howtogoto(){
echo "Usage: goto [OPTION]"
echo "Usage: goto [OPTION] -d DIRECTORY"
echo "Usage: goto [OPTION] -c [VBG PROJECT]"
echo ""
echo "goto : Go to working directory or/and the directories under."
echo ""
echo "Available arguments:"
echo "  -h		help : how to use goto"
echo "  -w		goto working directory "
echo "  -d		goto specific directory under working dir"
echo "	-c		open docker Container of only particular VBG project"
echo "			WARNING: this is only temporary option"
echo "  -t		show tree view of folder"
echo "  -l		show text forder schedule"
echo "  -v		version : show the tool version"
echo "	-f		open file : opne specific file with vim"
echo "			WARNING: needs work"
echo ""
echo "goto ver. 0.1-Beta"
echo "@janglo :: 111019"
}

# TODO: intelligent search trough the libraries
#function OPEN()
open(){
	fileLoc=$( find . -name $1 )
	if [ "$fileLoc" == "" ]; then
		echo 'Could not find specified file, sorry...'
	elif [[ "$fileLoc" == *$'\n'* ]]; then
		echo -e "There is more then one file named: $1, specify location!\nAvailable options:\n$fileLoc"
	else	
		vim $fileLoc
	fi
}

#function CALL()
call(){
OPTIND=1

while getopts "wd:c:thvf:" flag; do
	case $flag in
		w)
			cd /mnt/c/work/janglo
			;;
		d)
			cd /mnt/c/work/janglo/$OPTARG
			;;
		c)	
			cd /mnt/c/work/janglo/VBG/docker
			#Make sure that Powershell will not chenge the fonts
			oemcp=$(reg.exe query "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Nls\\CodePage" /v OEMCP 2>&1 | sed -n 3p | sed -e 's|\r||g' | grep -o '[[:digit:]]*')
			chcp.com $oemcp
			powershell.exe -File "rundocker.ps1" $OPTARG
			chcp.com 65001
			;;
		t)
			tree -d -L 1
			;;
		h)
			howtogoto
			;;
		v)	
			echo "goto ver. 0.1-Beta"
			;;
		f)
			open "$OPTARG"
			;;
		*)
			echo "goto - Usage: goto flags -w -t -v (-d dirpath) -h for help"
			;;
	esac
done
}

OPTIND=1

call "$@"
