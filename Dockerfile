FROM sstarcher/sensu

RUN ( \
        cat /etc/os-release && \
        apt-get update && \
        apt-get install -yy build-essential && \
        rm -rf /var/lib/apt/lists/* && \
        gem install unf_ext && \
        ln -s ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3 \
    )
