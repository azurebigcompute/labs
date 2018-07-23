#!/bin/bash

yum install -y redhat-lsb.i686

CADENCE_INSTALL=$(jetpack config cadence.install_dir)/cadence \
    || CADENCE_INSTALL=$(jetpack config cyclecloud.mounts.vfxt.mountpoint)/cadence \
    || CADENCE_INSTALL=$(jetpack config gluster.mountpoint)/cadence \
    || CADENCE_INSTALL=/opt/tools/cadence

touch /etc/profile.d/cadence.sh
echo "export CADENCE_INSTALL=${CADENCE_INSTALL}" >> /etc/profile.d/cadence.sh
echo 'export PATH=$PATH:${CADENCE_INSTALL}/tools.lnx86/bin' >> /etc/profile.d/cadence.sh
echo 'export LM_LICENSE_FILE=5280@13.77.138.127' >> /etc/profile.d/cadence.sh

