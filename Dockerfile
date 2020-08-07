FROM ubuntu:16.04
MAINTAINER ManojPopalghat <manojpopalghat@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ENV MYSQL_ROOT_PASSWORD=admin00

#Installation of default-jdk
RUN apt-get update
RUN apt-get install -y apt-utils 
RUN apt-get install -y default-jdk

# Installation of mysql-server and tomcat 8.5
RUN apt-get update 
RUN apt-get install -y lsb-release
RUN apt-get install -y wget
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.4-1_all.deb 
RUN dpkg -i mysql-apt-config_0.8.4-1_all.deb
RUN rm -f mysql-apt-config_0.8.4-1_all.deb

#Download & Extract Apache Tomcat v8.5.54
RUN wget http://mirrors.standaloneinstaller.com/apache/tomcat/tomcat-8/v8.5.54/bin/apache-tomcat-8.5.54.tar.gz
RUN tar -xvf apache-tomcat-8.5.54.tar.gz
RUN rm -f apache-tomcat-8.5.54.tar.gz
RUN chmod 755 /apache-tomcat-8.5.54/bin/catalina.sh

# Install packages
RUN apt-get update
RUN apt-get -y --allow-unauthenticated install mysql-server pwgen supervisor
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add image configuration and scripts
ADD start-tomcat.sh /start-tomcat.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 644 /etc/mysql/conf.d/my.cnf
ADD supervisord-tomcat.conf /etc/supervisor/conf.d/supervisord-tomcat.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL utils
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD mysql-setup.sh /mysql-setup.sh
RUN chmod 755 /*.sh

#Add CRUD WebProjet into Apache Server
ADD HostelManagementSystem /apache-tomcat-8.5.54/webapps/HostelManagementSystem

WORKDIR /apache-tomcat-8.5.54/webapps/CRUD

# Add volumes for MySQL 
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 8080 3306

ENTRYPOINT ["/run.sh"]

