#!/bin/bash

case "$1" in
	*_EDITMSG|*MERGE_MSG|*_TAGMSG )
		atom -w "$1"
		;;
	*.md )
		mmdc "$1"
		;;
	*.txt )
		nano "$1"
		;;
	* )
		atom -n "$1"
		;;
esac
