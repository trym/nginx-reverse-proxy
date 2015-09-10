FROM ubuntu:trusty
MAINTAINER Wouter ten Bosch <woutertenbosch@gmail.com>

# Install Nginx
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install nginx && \
    rm -rf /var/lib/apt/lists/*

# Delete default configuration
RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/

# Replace configuration
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Set reverse proxy domain
ENV REVERSE_DOMAIN example.com

# Start Nginx
#CMD sed -i "s/_REPLACE_ME_/$REVERSE_DOMAIN/g" /etc/nginx/nginx.conf && tail -F /var/log/nginx/* & /usr/sbin/nginx
#CMD ["/etc/nginx/run.sh"]

# Expose and start
EXPOSE 80
CMD ["/run.sh"]