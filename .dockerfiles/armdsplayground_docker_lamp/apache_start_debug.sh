#/bin/bash

sed  -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini | grep display
sed -i 's/error_reporting = .*/error_reporting = E_ALL/' /etc/php5/apache2/php.ini 
service apache2 restart

