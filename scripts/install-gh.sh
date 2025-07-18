#!/bin/sh
ARCHITECTURE=$(dpkg --print-architecture)
LATEST_VERSION=$(curl -s https://api.github.com/repos/cli/cli/releases/latest | jq -r .tag_name | tr -d "v")
curl -sSLo gh.deb "https://github.com/cli/cli/releases/download/v${LATEST_VERSION}/gh_${LATEST_VERSION}_linux_${ARCHITECTURE}.deb"
dpkg -i gh.deb