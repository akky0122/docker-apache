FROM registry.redhat.io/rhscl/httpd-24-rhel7

USER root

# Create SSL certs directory
RUN mkdir /etc/httpd/certs && chmod 777 /etc/httpd/certs

# Copy SSL certs
COPY certs/localhost.crt /etc/httpd/certs
COPY certs/localhost.key /etc/httpd/certs

# Copy configuration file
COPY ./httpd.conf /etc/httpd/conf/httpd.conf
COPY ./httpd.conf /etc/httpd/conf.d/ssl.conf

# Expose port 80 for Apache
EXPOSE 80
EXPOSE 443

