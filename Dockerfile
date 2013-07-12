FROM base
MAINTAINER Jonas Wiklund "jonas.wiklund@atex.com"
ADD jenkins-ci.org.key /tmp/jenkins-ci.org.key
RUN sudo apt-key add /tmp/jenkins-ci.org.key
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y jenkins openssh-server
# Default MAXOPENFILES is too large for default settings
RUN sed -i /etc/default/jenkins -e 's/MAXOPENFILES=8192/MAXOPENFILES=4000/'
EXPOSE 8080
EXPOSE 22
run echo root:root | chpasswd
CMD mkdir /var/run/sshd ; nohup /usr/sbin/sshd ; /usr/bin/java -jar /usr/share/jenkins/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080 --ajp13Port=-1
