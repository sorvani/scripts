#!/bin/bash
ocpath='/var/www/html/nextcloud'
httpdrw='httpd_sys_rw_content_t'

setsebool -P httpd_can_sendmail 1
setsebool -P httpd_can_network_connect 1

printf "Set SELinux HTTPD RW on entirenextcloud folder\n"
semanage fcontext -a -t ${httpdrw} "${ocpath}(/.*)?"
restorecon -FRv ${ocpath}
