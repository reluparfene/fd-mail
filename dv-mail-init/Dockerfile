FROM centos:7
# install packages
RUN yum -y install net-tools telnet less vim dovecot dovecot-pigeonhole \
  #
  && echo -e "colorscheme desert\nset nocompatible" > /root/.vimrc \
  && cp dovecot-ldap.conf.ext /etc/dovecot \
  #
  # clean yum cache
  && yum clean all 

EXPOSE 143 993

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/sbin/dovecot","-F"]
