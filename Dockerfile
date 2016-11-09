FROM sstarcher/sensu

RUN ( \
        gem install unf_ext && \
        ln -s ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3 \
    )
