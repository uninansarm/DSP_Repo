#!/bin/bash
# Author:       giper
# Email:        g.per45@gmail.com
# Date:
# Usage:        sed.sh  [--string_one str1 --string_two str2 --filename filename]
# Description:
ESCAPE_STR1=$(printf "%q" "allow_url_include = Off" )
ESCAPE_STR2=$(printf "%q" "allow_url_include = On" )
FILENAME="/etc/php5/apache2/php.ini"
#Operation
sed -i -e "s/${ESCAPE_STR1}/${ESCAPE_STR2}/g" $FILENAME
