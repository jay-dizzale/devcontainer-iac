#!/bin/bash

ARCHITECTURE=$(dpkg --print-architecture)
LATEST_VERSION=$(curl -sSL https:/api.github.com/repos/spacelift-io/spacectl/releases/latest | jq -r .tag_name | cut -c 2-)

curl -sSLo /tmp/spacectl.zip https://github.com/spacelift-io/spacectl/releases/download/v${LATEST_VERSION}/spacectl_${LATEST_VERSION}_linux_${ARCHITECTURE}.zip

unzip -qq /tmp/spacectl.zip -d /tmp
chmod +x /tmp/spacectl
mv /tmp/spacectl /usr/bin