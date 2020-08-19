FROM centos:7
ENV LDAP_HOST=${LDAP_HOST} \
    LDAP_BASE=${LDAP_BASE} \
    LDAP_ADMIN=${LDAP_ADMIN} \
    LDAP_PASS=${LDAP_PASS} 
#
# install packages
RUN yum -y install net-tools telnet less vim dovecot dovecot-pigeonhole \
  #
  && echo -e "colorscheme desert\nset nocompatible" > /root/.vimrc \
  && groupadd -g 10000 vmail \
  && useradd -g 10000 -u 10000 -s /sbin/nologin vmail \
  && groupadd -g 89 postfix \
  && useradd -g 89 -u 89 -s /sbin/nologin postfix \
  #
  # clean yum cache
  && yum clean all 

  COPY dovecot-ldap.conf.ext /etc/dovecot 
  COPY dovecot.conf /etc/dovecot
  COPY 10-auth.conf /etc/dovecot/conf.d
  COPY 10-mail.conf /etc/dovecot/conf.d
  COPY 10-master.conf /etc/dovecot/conf.d
  COPY 20-imap.conf /etc/dovecot/conf.d
  COPY 90-quota.conf /etc/dovecot/conf.d
  #

COPY docker-entrypoint.sh /usr/bin

EXPOSE 24 143 993

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/sbin/dovecot","-F"]
