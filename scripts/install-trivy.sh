#!/bin/sh
MACHINE_TYPE=$(uname -m)
LATEST_VERSION=$(curl -sSL https:/api.github.com/repos/aquasecurity/trivy/releases/latest | jq -r .tag_name | cut -c 2-)
ARCHITECTURE=$(dpkg --print-architecture)
case $ARCHITECTURE in

  "arm64")
    CANDIDATE="ARM64"
    ;;

  "amd64")
    CANDIDATE="64bit"
    ;;

  *)
    break
    ;;
esac

echo "https://github.com/aquasecurity/trivy/releases/download/v${LATEST_VERSION}/trivy_${LATEST_VERSION}_Linux-${CANDIDATE}.deb"

curl -sSLo "trivy.deb" "https://github.com/aquasecurity/trivy/releases/download/v${LATEST_VERSION}/trivy_${LATEST_VERSION}_Linux-${CANDIDATE}.deb"
dpkg -i trivy.deb
