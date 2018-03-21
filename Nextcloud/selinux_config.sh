#!/bin/bash
ocpath='/var/www/html/nextcloud'
httpdrw='httpd_sys_rw_content_t'

setsebool -P httpd_can_sendmail 1
setsebool -P httpd_can_network_connect 1

printf "Set SELinux HTTPD RW on directories and files\n"
semanage fcontext -a -t ${httpdrw} "${ocpath}/config(/.*)?"
semanage fcontext -a -t ${httpdrw} "${ocpath}/apps(/.*)?"
semanage fcontext -a -t ${httpdrw} "${ocpath}/data(/.*)?"
semanage fcontext -a -t ${httpdrw} "${ocpath}/updater(/.*)?"
semanage fcontext -a -t ${httpdrw} '${ocpath}/.htaccess'
semanage fcontext -a -t ${httpdrw} '${ocpath}/.user.ini'
restorecon -FRv ${ocpath}
