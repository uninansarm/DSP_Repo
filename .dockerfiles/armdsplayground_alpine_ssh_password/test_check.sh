#!/bin/bash
# Author:       giper
# Email:        g.per45@gmail.com
# Date:        	 
# Usage:        adduser.sh [--name=val] [ --password=val]
# Description:


usage() {
echo $1
echo "Usage test" 
exit 1
}
NAME_BOOL=false
CTF_BOOL=false

function assertNoSpaces {
    if [[ "$1" != "${1/ /}" ]]
    then
	usage 'Parameter cannot have spaces';
    fi
}


TESTING='HELLO '
optspec=":vh-:"
while getopts "$optspec" optchar; do
  case "${optchar}" in
  v) 
    TESTING="$TESTING verbose"
    ;;
  h) 
    TESTING="$TESTING help"
    ;;
  *)
    usage
    ;;
  esac
done

echo $TESTING
