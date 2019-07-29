#!/bin/bash

set -xe

cat /etc/os-release

# Remove tool runtime install/uninstall as packages are shipped
# with this image.
sed -i 's/tooling_\(un\)\{0,1\}install$//g' /bin/install

# Install tools
apt-get update
apt-get install -yy libxml2 libxml2-dev libxslt1-dev zlib1g-dev build-essential lm-sensors iperf3 nfs-common git libpq-dev libltdl7
gem install unf_ext
ln -s ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3
