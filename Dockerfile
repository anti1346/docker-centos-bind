FROM centos:7

RUN yum update -y --nogpgcheck && yum install -y --nogpgcheck \
  bind \
  bind-utils \
  openssl \
  && yum clean all \
  && yum clean metadata

VOLUME ["/var/named"]

EXPOSE 53/udp

ENTRYPOINT /usr/sbin/named -u named -c /etc/named.conf -f

CMD ["true"]
