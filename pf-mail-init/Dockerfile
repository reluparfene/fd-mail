FROM centos:7
# install packages
RUN yum -y install net-tools telnet less vim postfix \
  #
  && echo -e "colorscheme desert\nset nocompatible" > /root/.vimrc \
  && sed -i -e "s/#inet_interfaces = all/inet_interfaces = all/g" /etc/postfix/main.cf \
  && sed -i -e "s/inet_interfaces = localhost/#inet_interfaces = localhost/g" /etc/postfix/main.cf \
  && cd /etc/postfix ; postmap transport ; postmap virtual ; > relay_domains ; postmap relay_domains \
  #
  # clean yum cache
  && yum clean all 

EXPOSE 25

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/postfix","start"]
