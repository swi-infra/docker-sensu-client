#!/bin/bash -xe

IPERF_SERVER=${IPERF_SERVER:-false}

if [[ "$IPERF_SERVER" == "true" ]]; then
    echo "Serving iperf ..."
    iperf3 -s $IPERF_SERVER_OPTS &
fi

# Enable apt-get install
if [ -e "/host_sys/fs/selinux" ]; then
    mkdir -p /sys/fs/selinux
    mount -t selinuxfs selinuxfs /sys/fs/selinux
    mount -o remount,ro,bind /sys/fs/selinux
fi

if [ -n "$APT_MIRROR" ]; then
    SRC_URL="$(grep '^deb' "/etc/apt/sources.list" | head -1 | awk '{print $2}')"

    sed -i "s#${SRC_URL}#${APT_MIRROR}#g" "/etc/apt/sources.list"
fi

if [[ "$CLIENT_SUBSCRIPTIONS" == *ceph* ]]; then
    curl 'https://download.ceph.com/keys/release.asc' | apt-key add -
    apt-add-repository "deb https://download.ceph.com/debian-nautilus/ $(lsb_release -sc) main"
    apt-get update
    apt-get install -yy ceph

    if [ -e "/etc/ceph-host/" ]; then
        rsync -avp /etc/ceph-host/ /etc/ceph/
    fi
fi

su sensu -s /bin/bash -c 'PATH="$PATH:/opt/sensu/embedded/bin/" /bin/start client'
