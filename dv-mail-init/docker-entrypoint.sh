#!/bin/bash
sed -i -e "s/LDAP_HOST/${LDAP_HOST}/g" /etc/dovecot/dovecot-ldap.conf.ext
sed -i -e "s/LDAP_BASE/${LDAP_BASE}/g" /etc/dovecot/dovecot-ldap.conf.ext
sed -i -e "s/LDAP_ADMIN/${LDAP_ADMIN}/g" /etc/dovecot/dovecot-ldap.conf.ext
sed -i -e "s/LDAP_PASS/${LDAP_PASS}/g" /etc/dovecot/dovecot-ldap.conf.ext
sed -i -e "s/CERT/${CERT}/g" /etc/dovecot/conf.d/10-ssl.conf
sed -i -e "s/KEY/${KEY}/g" /etc/dovecot/conf.d/10-ssl.conf
sed -i -e "s/CA/${CA}/g" /etc/dovecot/conf.d/10-ssl.conf

exec "$@"
