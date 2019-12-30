FROM quay.io/swi-infra/sensu:1.9.0

USER root
ADD client-install.sh /client-install.sh
RUN /client-install.sh

ADD /client-start.sh /
USER sensu
ENTRYPOINT ["/client-start.sh", "client"]
