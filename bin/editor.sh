#!/bin/bash

case "$1" in
	*_EDITMSG|*MERGE_MSG|*_TAGMSG )
		/usr/local/bin/atom "$1"
		;;
	*.md )
		/usr/local/bin/mmdc "$1"
		;;
	*.txt )
		/usr/local/bin/nano "$1"
		;;
	* )
		/usr/local/bin/atom -w "$1"
		;;
esac
