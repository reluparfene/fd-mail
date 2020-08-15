FROM centos:7
# install packages
RUN yum -y install openldap openldap-servers openldap-clients net-tools telnet less vim \
  #
  && cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG \
  && echo -e "colorscheme desert\nset nocompatible" > /root/.vimrc \
  #
  # clean yum cache
  && yum clean all 

EXPOSE 389

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["slapd","-d", "256", "-u", "ldap", "-g", "ldap", "-h", "ldapi:/// ldap:///"]
