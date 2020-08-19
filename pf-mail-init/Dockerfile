FROM centos:7
ENV LDAP_HOST=${LDAP_HOST} \
    LDAP_BASE=${LDAP_BASE} \
    LDAP_ADMIN=${LDAP_ADMIN} \
    LDAP_PASS=${LDAP_PASS} \
    LMTP_HOST=${LMTP_HOST} \
    CERT=${CERT} \
    KEY=${KEY} \
    CA=${CA}
# install packages
RUN yum -y install net-tools telnet less vim yum-utils libicu epel-release \
  && yum -y --nogpg install https://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm \
  && /bin/yum-config-manager --enable gf-plus \
  && yum -y install postfix3 postfix3-ldap postfix3-pcre \
  #
  && echo -e "colorscheme desert\nset nocompatible" > /root/.vimrc \
  && sed -i -e "s/#inet_interfaces = all/inet_interfaces = all/g" /etc/postfix/main.cf \
  && sed -i -e "s/inet_interfaces = localhost/#inet_interfaces = localhost/g" /etc/postfix/main.cf \
  && cd /etc/postfix ; postmap transport ; postmap virtual ; > relay_domains ; postmap relay_domains \
  && mkdir /etc/postfix/{certs,private} \
  && chmod 755 /etc/postfix/{certs,private} \
  && mkdir /var/spool/postfix/private/dovecot \
  && chown postfix.postfix /var/spool/postfix/private/dovecot \
  #
  # clean yum cache
  && yum clean all 

COPY main.cf /etc/postfix
COPY docker-entrypoint.sh /usr/bin

EXPOSE 25 465 587

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/sbin/postfix","start-fg"]
