FROM sstarcher/sensu

RUN ( \
        cat /etc/os-release && \
        apt-get update && \
        apt-get install -yy libxml2 libxml2-dev libxslt1-dev zlib1g-dev build-essential && \
        gem install unf_ext && \
        ln -s ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3 \
    )
