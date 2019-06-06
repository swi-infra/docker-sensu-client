#!/bin/bash

IPERF_SERVER=${IPERF_SERVER:-false}

if [[ "$IPERF_SERVER" == "true" ]]; then
    echo "Serving iperf ..."
    iperf3 -s $IPERF_SERVER_OPTS &
fi

if [[ "$CLIENT_SUBSCRIPTIONS" == *ceph* ]]; then
    apt-get update
    apt-get install -yy ceph
fi

/bin/start client
