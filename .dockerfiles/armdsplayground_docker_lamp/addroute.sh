#!/bin/bash
# Author:       giper
# Email:        g.per45@gmail.com
# Date:        	 
# Usage:        bash.sh [-a|--alpha] [-b=val|--beta=val]
# Description:
# 
#
#


usage() {
echo $1
echo "Usage addroute.sh [--router_ip val] [ --subnet val]"
exit 1
}

function assertNoSpaces {
    if [[ "$1" != "${1/ /}" ]]
    then
	usage 'Parameter cannot have spaces';
    fi
}
ROUTER_BOOL=false
SUBNET_BOOL=false

optspec=":-:"
while getopts "$optspec" optchar; do
  case "${optchar}" in
  -)
    case "${OPTARG}" in
    router_ip)
    ROUTER="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
    [[ ! -z "${ROUTER// }" ]] && ROUTER_BOOL=true || usage 'Empty Name'
    ;;
    subnet)
    SUBNET="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
    [[ ! -z "${SUBNET// }" ]] && SUBNET_BOOL=true || usage 'Empty Name'
    ;;
    *)
    usage
    ;;
    esac;;
  *)
    usage
    ;;
  esac
done

#assertNoSpaces "$GATEWAY"

if [ $SUBNET_BOOL != true ] ; then
	usage 'no subnet';
fi
if [ $ROUTER_BOOL != true ] ; then
	usage 'no gateway';
fi


#ex 192.168.1.1/24
ip route add $SUBNET via $ROUTER
