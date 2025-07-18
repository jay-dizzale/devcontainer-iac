#!/bin/sh
ARCHITECTURE=$(dpkg --print-architecture)

# INSTALL COSIGN (VERIFY SIGNATURES)
LATEST_VERSION=$(curl -s https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r .tag_name | tr -d "v")
curl -sSLo cosign.deb "https://github.com/sigstore/cosign/releases/download/v${LATEST_VERSION}/cosign_${LATEST_VERSION}_${ARCHITECTURE}.deb"
dpkg -i "cosign.deb"

# INSTALL TENV
LATEST_VERSION=$(curl --silent https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r .tag_name)
curl -sSLo tenv.deb "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${LATEST_VERSION}_${ARCHITECTURE}.deb"
dpkg -i "tenv.deb"
