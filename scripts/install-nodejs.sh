#!/bin/bash
curl -fsSL https://deb.nodesource.com/setup_22.x | bash - 
apt install -y nodejs

## Install additional tools
npm install -g renovate