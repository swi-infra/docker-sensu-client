FROM sstarcher/sensu

ADD bin /bin/

RUN ( \
        apt-get update && \
        apt-get install -y python netcat-openbsd \
    )

