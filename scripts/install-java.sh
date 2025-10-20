#/!bin/bash
ARCHITECTURE=$(uname -m)
case $ARCHITECTURE in
  "arm64")
    CANDIDATE="aarch64"
    ;;
  "aarch64")
    CANDIDATE="aarch64"
    ;;
  "x86_64")
    CANDIDATE="x64"
    ;;
  *)
    break
    ;;
esac
apt install java-common
echo https://corretto.aws/downloads/latest/amazon-corretto-21-${CANDIDATE}-linux-jdk.deb
curl -sSLo amazon-coretto-21.deb https://corretto.aws/downloads/latest/amazon-corretto-21-${CANDIDATE}-linux-jdk.deb
dpkg -i amazon-coretto-21.deb