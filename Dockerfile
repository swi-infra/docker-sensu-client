FROM sstarcher/sensu

RUN ( \
        apt-get update && \
        apt-get install -y python netcat \
    )

