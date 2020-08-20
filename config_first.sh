#!/bin/sh
cp apache/fd-web.conf /etc/httpd/conf.d
systemctl restart httpd
groupadd -g 10000 vmail
useradd -g 10000 -u 10000 -s /sbin/nologin vmail
