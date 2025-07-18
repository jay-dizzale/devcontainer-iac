FROM ubuntu:noble

LABEL maintainer="Jay-Dizzale <5518783+jay-dizzale@users.noreply.github.com>"
LABEL description="Development environment for ARM architecture with tools for Terraform, GitHub CLI, Trivy, and TFLint"

## Install a set of useful tools, expand if you require more
RUN apt update; apt install -y vim wget curl git unzip zsh gpg mandoc jq apt-transport-https gnupg lsb-release; 
WORKDIR /tmp

ADD ./scripts/ /tmp/

## Install `tenv` to manage multiple versions of Terraform / OpenTofu
RUN sh /tmp/install-tenv.sh

## Install `terraform-docs`
RUN sh /tmp/install-terraform-docs.sh

## Install `tflint`
RUN sh /tmp/install-tflint.sh

## Install `gh` (GitHub CLI)
RUN sh /tmp/install-gh.sh

## Install `aws` (AWS CLI)
RUN sh /tmp/install-aws-cli.sh

## Install `az` (Azure CLI)
RUN sh /tmp/install-azure-cli.sh

## Cleanup
RUN rm -rf /tmp/*

VOLUME [ "/workspace" ]
USER ubuntu
WORKDIR /workspace

## ALLOW WORKSPACE DIRECTORIES EVEN IF PERMISSION DO NOT MATCH
RUN git config --global --add safe.directory '*' ; \
    git config --global --add --bool push.autoSetupRemote true
