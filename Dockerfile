FROM tomcat:8-jdk8-adoptopenjdk-hotspot
LABEL maintainer="alex@efficiencygeek.com"

# Install VIM
RUN apt-get update
RUN apt-get install -y vim

# make dist apps available
#RUN cd /usr/local/tomcat/
#RUN mkdir webapps
#RUN cd webapps
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

# Copy conf files
#ADD tomcat/conf/context.xml /usr/local/tomcat/conf/context.xml

# Allow for access to manager web apps
# https://tecadmin.net/install-tomcat-8-on-centos-8/
ADD tomcat/webapps/manager/META-INF/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
ADD tomcat/webapps/host-manager/META-INF/context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml

ADD tomcat/conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

ADD sample.war /usr/local/tomcat/webapps/

RUN ll='ls -lta'

EXPOSE 8080
CMD ["catalina.sh", "run"]