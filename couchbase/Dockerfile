FROM base
MAINTAINER Jonas Wiklund "jonas.wiklund@atex.com"
RUN sudo apt-get update
RUN sudo apt-get -y install libssl0.9.8 python wget
RUN wget -nv -P /tmp http://packages.couchbase.com/releases/2.0.1/couchbase-server-community_x86_64_2.0.1.deb
RUN sudo dpkg -i /tmp/couchbase-server-community_x86_64_2.0.1.deb
ADD init.sh /tmp/init.sh
RUN /tmp/init.sh
EXPOSE 11211:11211
EXPOSE 11210:11210
EXPOSE 11209:11209
EXPOSE 4369:4369
EXPOSE 8091:8091
EXPOSE 8092:8092
