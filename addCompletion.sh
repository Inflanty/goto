#!/bin/bash

function _mycomplete_goto_()
{
	echo off
	local cmd="$(1##*/)"
	local world=$(COMP_WORDS[COMP_CWORD])
	local line=$(COMP_LINE)
	local xpat

	case "$cmd" in 
	goto)
		case "$line" in
		*-d*)
			pushd /mnt/c/Workspace
			;;
		*)

			;;
		esac
		;;
	*)

		;;
	esac

	COMPREPLY=($(compgen -d"))
	popd
}

complete -d -X '.[^./]*' -F _mycomplete_goto_ goto
