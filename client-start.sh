#!/bin/bash

IPERF_SERVER=${IPERF_SERVER:-false}

if [[ "$IPERF_SERVER" == "true" ]]; then
    echo "Serving iperf ..."
    iperf -s $IPERF_SERVER_OPTS &
fi

/bin/start client
