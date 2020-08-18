#!/bin/bash
sed -i -e "s/LDAP_HOST/${LDAP_HOST}/g" /etc/dovecot/dovecot-ldap.conf.ext
sed -i -e "s/LDAP_BASE/${LDAP_BASE}/g" /etc/dovecot/dovecot-ldap.conf.ext
sed -i -e "s/LDAP_ADMIN/${LDAP_ADMIN_PASS}/g" /etc/dovecot/dovecot-ldap.conf.ext
sed -i -e "s/LDAP_ADMIN_PASS/${LDAP_ADMIN_PASS}/g" /etc/dovecot/dovecot-ldap.conf.ext

exec "$@"
