#!/bin/bash
# Author:       giper
# Email:        g.per45@gmail.com
# Date:        	 
# Usage:        sed.sh  [--string_one str1 --string_two str2 --filename filename]
# Description:


usage() {
echo $1
echo "--string_one str1 --string_two str2 --filename filename"
exit 1
}
STR1_BOOL=false
STR2_BOOL=false
FILENAME_BOOL=false

optspec=":-:"
while getopts "$optspec" optchar; do
  case "${optchar}" in
  -)
    case "${OPTARG}" in
    string_one)
    STR1="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
    STR1_BOOL=true
    ;;
    string_two)
    STR2="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
    STR2_BOOL=true
    ;;
    filename)
    FILENAME="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
    FILENAME_BOOL=true
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

if [ $STR1_BOOL != true ] ; then
	usage 'no command';
fi
if [ $STR2_BOOL != true ] ; then
	usage 'no command';
fi
if [ $FILENAME_BOOL != true ] ; then
	usage 'no command';
fi
ESCAPE_STR1=$(printf "%q" "$STR1" )
ESCAPE_STR2=$(printf "%q" "$STR2" )
echo $ESCAPE_STR1
echo $ESCAPE_STR2
echo $STR1 
echo $STR2
echo "s/${ESCAPE_STR1}/${ESCAPE_STR2}/g"

#Operation
sed -i -e "s/${ESCAPE_STR1}/${ESCAPE_STR2}/g" $FILENAME
