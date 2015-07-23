FROM phusion/baseimage:0.9.16

# add service to create log messages
COPY etc/service/log-hello-world /etc/service/log-hello-world

# papertrail certificate
ADD https://papertrailapp.com/tools/papertrail-bundle.tar.gz /etc/syslog-ng/cert.d/papertrail-bundle.tar.gz
RUN cd /etc/syslog-ng/cert.d/ && tar -xzf papertrail-bundle.tar.gz

# loggly certificate
ADD https://logdog.loggly.com/media/loggly.com.crt /tmp/loggly.com.crt
ADD https://certs.secureserver.net/repository/sf_bundle.crt /tmp/sf_bundle.crt
RUN cat /tmp/sf_bundle.crt /tmp/loggly.com.crt > /etc/syslog-ng/cert.d/loggly_full.crt

# logentries certificate
#ADD https://d2rqpywgspga97.cloudfront.net/mstatic/1436926766/includes/certificates/logentries.all.crt /etc/syslog-ng/cert.d/

COPY custom.conf /etc/syslog-ng/conf.d/

# default baseimage command (runs syslog-ng etc)
CMD /sbin/my_init
