#!/bin/bash -xe

IPERF_SERVER=${IPERF_SERVER:-false}

if [[ "$IPERF_SERVER" == "true" ]]; then
    echo "Serving iperf ..."
    iperf3 -s $IPERF_SERVER_OPTS &
fi

if [[ "$CLIENT_SUBSCRIPTIONS" == *ceph* ]]; then
    apt-get update
    apt-get install -yy ceph

    if [ -e "/etc/ceph-host/" ]; then
        rsync -avp /etc/ceph-host/ /etc/ceph/
    fi
fi

/bin/start client
