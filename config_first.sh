#!/bin/sh
cp apache/fd-web.conf /etc/httpd/conf.d
/bin/systemctl restart httpd
/sbin/groupadd -g 10000 vmail
/sbin/useradd -g 10000 -u 10000 -s /sbin/nologin vmail
/bin/newaliases
/bin/systemctl stop postfix dovecot
/bin/systemctl disable postfix dovecot
/bin/docker login
