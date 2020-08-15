#!/bin/bash
sed -i -e "s/LDAP_BASE/${LDAP_BASE}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/LDAP_HOST/${LDAP_HOST}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/LDAP_ADMIN_PASS/${LDAP_ADMIN_PASS}/g" /etc/fusiondirectory/fusiondirectory.conf
sed -i -e "s/SITE/${SITE}/g" /etc/fusiondirectory/fusiondirectory.conf

exec "$@"
