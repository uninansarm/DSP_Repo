#!/bin/bash
# Author:       giper
# Email:        g.per45@gmail.com
# Date:
# Usage:        sed.sh  [--string_one str1 --string_two str2 --filename filename]
# Description:


usage() {
echo $1
echo "--listening_port port"
exit 1
}
LISTENING_PORT_BOOL=false

optspec=":-:"
while getopts "$optspec" optchar; do
  case "${optchar}" in
  -)
    case "${OPTARG}" in
    listening_port)
    LISTENING_PORT="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
    LISTENING_PORT_BOOL=true
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

if [ $LISTENING_PORT_BOOL != true ] ; then
	usage 'no listening port';
fi


re='^[0-9]+$'
if ! [[ $LISTENING_PORT =~ $re ]] ; then
  echo "NO NUMBER"
  usage
fi
ESCAPE_LISTENING_ORIG=$(printf "%q" "Listen 80" )
ESCAPE_LISTENING=$(printf "%q" "Listen ${LISTENING_PORT}" )
FILENAME="/etc/apache2/ports.conf"



ESCAPE_VIRTUAL_HOST_ORIG=$(printf "%q" "VirtualHost *:80")
ESCAPE_VIRTUAL_HOST=$(printf "%q" "VirtualHost *:${LISTENING_PORT}")

#Operation
sed -i -e "s/${ESCAPE_LISTENING_ORIG}/${ESCAPE_LISTENING}/g" $FILENAME

#FILENAME_TWO="/etc/apache2/sites-enabled/example.com.conf"
#sed -i -e "s/${ESCAPE_VIRTUAL_HOST_ORIG}/${ESCAPE_VIRTUAL_HOST}/g" $FILENAME_TWO
