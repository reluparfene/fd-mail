FROM centos:7
ENV LDAP_HOST=${LDAP_HOST} \
    LDAP_BASE=${LDAP_BASE} \
    LDAP_ADMIN_PASS=${LDAP_ADMIN_PASS} \
    SITE=${SITE}
# install packages
RUN yum -y install httpd net-tools telnet less epel-release vim http://rpms.remirepo.net/enterprise/remi-release-7.rpm yum-utils \
#
# install remi
  && yum-config-manager --enable remi-php72 \
  && yum-config-manager --enable remi \
#
# fusiondirectory repo
  && echo -e "[fusiondirectory]\nname=Fusiondirectory Packages for RHEL / CentOS 7\nbaseurl=http://repos.fusiondirectory.org/fusiondirectory-current/rhel7/RPMS/\nenabled=1\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-FUSIONDIRECTORY\n\n[fusiondirectory-extra]\nname=Fusiondirectory Extra Packages for RHEL / CentOS 7\nbaseurl=http://repos.fusiondirectory.org/fusiondirectory-extra/rhel7/RPMS/\nenabled=1\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-FUSIONDIRECTORY" > /etc/yum.repos.d/fusion.repo \
#
# fusiondirectory keys
  && gpg --keyserver keys.gnupg.net --recv-key 0xD744D55EACDA69FF \
  && gpg --export -a "FusionDirectory Project Signing Key <contact@fusiondirectory.org>" > FD-archive-key \
  && cp FD-archive-key /etc/pki/rpm-gpg/RPM-GPG-KEY-FUSIONDIRECTORY ; rm FD-archive-key \
  && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-FUSIONDIRECTORY \
#
# install fusiondirectory
  && yum -y install --nogpgcheck php-Smarty3-gettext \
  && sed -i -e "s/tsflags=nodocs/#tsflags=nodocs/g" /etc/yum.conf \
  && yum install -y fusiondirectory fusiondirectory-schema schema2ldif \
  && sed -i -e "s/#tsflags=nodocs/tsflags=nodocs/g" /etc/yum.conf \
#
# fusiondirectory plugins
  && yum install -y fusiondirectory-plugin-alias fusiondirectory-plugin-mail fusiondirectory-plugin-certificates fusiondirectory-plugin-personal fusiondirectory-plugin-ldapmanager fusiondirectory-plugin-sogo fusiondirectory-plugin-ssh fusiondirectory-plugin-posix fusiondirectory-plugin-ppolicy fusiondirectory-plugin-systems \
#
# clean yum cache
  && yum clean all \
#
# php.ini 
  && sed -i -e "s/;date.timezone =/date.timezone = Europe\/Bucharest/g" /etc/php.ini \
  && sed -i -e "s/expose_php = On/expose_php = Off/g" /etc/php.ini \
  && echo -e "colorscheme desert\nset nocompatible" > /root/.vimrc \
#
# remove fusiondirectory.conf original link
  && rm /etc/httpd/conf.d/fusiondirectory.conf 
#
# config files
COPY fd.conf /etc/httpd/conf.d 
COPY fusiondirectory.conf /etc/fusiondirectory
RUN chmod 640 /etc/fusiondirectory/fusiondirectory.conf \
  && chown root.apache /etc/fusiondirectory/fusiondirectory.conf \
#
# apache logs to stdout
  && sed -i -e "s/ErrorLog \"logs\/error_log\"/ErrorLog \/proc\/self\/fd\/2/g" /etc/httpd/conf/httpd.conf \
  && sed -i -e "s/CustomLog \"logs\/access_log\" combined/CustomLog \/proc\/self\/fd\/1 combined/g" /etc/httpd/conf/httpd.conf

COPY docker-entrypoint.sh /usr/bin

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
