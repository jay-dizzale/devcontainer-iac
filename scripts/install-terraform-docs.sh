#!/bin/sh
ARCHITECTURE=$(dpkg --print-architecture)

LATEST_VERSION=$(curl -sSL https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | jq -r .tag_name)
curl -sSLo terraform-docs.tar.gz https://terraform-docs.io/dl/${LATEST_VERSION}/terraform-docs-${LATEST_VERSION}-$(uname)-${ARCHITECTURE}.tar.gz
tar -xzf terraform-docs.tar.gz 
chmod +x terraform-docs
mv terraform-docs /usr/bin/