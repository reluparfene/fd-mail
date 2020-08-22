#!/bin/bash
sed -i -e "s/LDAP_BASE/${LDAP_BASE}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/LDAP_HOST/${LDAP_HOST}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/LDAP_ADMIN/${LDAP_ADMIN}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/LDAP_PASS/${LDAP_PASS}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/SITE/${SITE}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/localhost/${SENDMAIL_HOST}/g" /etc/msmtprc

exec "$@"
