FROM quay.io/swi-infra/sensu:1.9.0

ADD client-install.sh /client-install.sh
RUN /client-install.sh

ADD /client-start.sh /
ENTRYPOINT ["/client-start.sh", "client"]
