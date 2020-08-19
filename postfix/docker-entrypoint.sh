#!/bin/bash
sed -i -e "s/LDAP_HOST/${LDAP_HOST}/g" /etc/postfix/main.cf
sed -i -e "s/LDAP_BASE/${LDAP_BASE}/g" /etc/postfix/main.cf
sed -i -e "s/LDAP_ADMIN/${LDAP_ADMIN}/g" /etc/postfix/main.cf
sed -i -e "s/LDAP_PASS/${LDAP_PASS}/g" /etc/postfix/main.cf
sed -i -e "s/LMTP_HOST/${LMTP_HOST}/g" /etc/postfix/main.cf
sed -i -e "s/CERT/${CERT}/g" /etc/postfix/main.cf
sed -i -e "s/KEY/${KEY}/g" /etc/postfix/main.cf
sed -i -e "s/CA/${CA}/g" /etc/postfix/main.cf

exec "$@"
