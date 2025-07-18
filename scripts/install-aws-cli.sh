#!/bin/sh
export MACHINE_TYPE=$(uname -m)
curl -sSLo "awscliv2.zip" "https://awscli.amazonaws.com/awscli-exe-linux-${MACHINE_TYPE}.zip"
unzip awscliv2.zip
./aws/install

## SSM Session Plugin
ARCHITECTURE=$(dpkg --print-architecture)
case $ARCHITECTURE in

  "arm64")
    CANDIDATE="ubuntu_arm64"
    ;;

  "amd64")
    CANDIDATE="ubuntu_64bit"
    ;;

  *)
    break
    ;;
esac


curl -sSLo "session-manager-plugin.deb" "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/${CANDIDATE}/session-manager-plugin.deb"
dpkg -i session-manager-plugin.deb
