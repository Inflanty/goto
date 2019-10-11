#!/bin/bash

# HOW to use - TODO: make better help
howtogoto(){
echo "Usage: goto [OPTION]"
echo "Usage: goto [OPTION] -d DIRECTORY"
echo "goto : Go to working directory or/and the directories under."
echo ""
echo "Available arguments:"
echo "  -h		help : how to use goto"
echo "  -w		goto working directory "
echo "  -d		goto specific directory under working dir"
echo "  -t		show tree view of folder"
echo "  -l		show text forder schedule"
echo "  -v		version : show the tool version"
echo ""
echo "goto ver. 0.1-Beta"
echo "@janglo :: 111019"
}

#finction CALL()
call(){
OPTIND=1
while getopts "wd:th" flag; do
	case $flag in
		w)
			cd /mnt/c/work/janglo
			;;
		d)
			cd /mnt/c/work/janglo/$OPTARG
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
		*)
			howtogoto
			;;
	esac
done
}

if [ ! getopts "wd:th" flags ]; then
	echo "goto - Usage: goto flags -w -t -v (-d dirpath) -h for help"
else
	call "$@"
fi
