FROM sstarcher/sensu

ADD bin /bin/

RUN ( \
        gem install unf_ext \
    )

