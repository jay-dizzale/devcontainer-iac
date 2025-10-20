FROM ubuntu:noble

LABEL maintainer="Jay-Dizzale <5518783+jay-dizzale@users.noreply.github.com>"
LABEL description="Development environment for ARM architecture with tools for Terraform, GitHub CLI, Trivy, and TFLint"

## Install a set of useful tools, expand if you require more
RUN apt update; apt install -y vim wget curl git unzip zsh gpg mandoc jq apt-transport-https gnupg lsb-release socat; 
WORKDIR /tmp

## Install `tenv` to manage multiple versions of Terraform / OpenTofu
COPY ./scripts/install-tenv.sh /tmp
RUN sh /tmp/install-tenv.sh

## Install `terraform-docs`
COPY ./scripts/install-terraform-docs.sh /tmp
RUN sh /tmp/install-terraform-docs.sh

## Install `tflint`
COPY ./scripts/install-tflint.sh /tmp
RUN sh /tmp/install-tflint.sh

## Install `gh` (GitHub CLI)
COPY ./scripts/install-gh.sh /tmp
RUN sh /tmp/install-gh.sh

## Install `aws` (AWS CLI)
COPY ./scripts/install-aws-cli.sh /tmp
RUN sh /tmp/install-aws-cli.sh

## Install `az` (Azure CLI)
COPY ./scripts/install-azure-cli.sh /tmp
RUN sh /tmp/install-azure-cli.sh

## Install `spacectl` (Spacelift CLI)
COPY ./scripts/install-spacectl.sh /tmp
RUN sh /tmp/install-spacectl.sh

## Install `npm` (NodeJS and NPM)
COPY ./scripts/install-nodejs.sh /tmp
RUN sh /tmp/install-nodejs.sh

## Install `trivy` (Aquasecurity Trivy)
COPY ./scripts/install-trivy.sh /tmp
RUN sh /tmp/install-trivy.sh

## Install `java` (Amazon Corretto 21)
COPY ./scripts/install-java.sh /tmp/
RUN sh /tmp/install-java.sh

## Cleanup
RUN rm -rf /tmp/*

VOLUME [ "/workspace" ]
USER ubuntu
WORKDIR /workspace

## Install `kafka` (kafka cli)
COPY ./scripts/install-kafka.sh /home/ubuntu/install-kafka.sh
RUN sh /home/ubuntu/install-kafka.sh ; rm /home/ubuntu/install-kafka.sh

## Install `maven` 
COPY ./scripts/install-maven.sh /home/ubuntu/install-maven.sh
RUN sh /home/ubuntu/install-maven.sh ; rm /home/ubuntu/install-maven.sh

## ALLOW WORKSPACE DIRECTORIES EVEN IF PERMISSION DO NOT MATCH
RUN git config --global --add safe.directory '*' ; \
    git config --global --add --bool push.autoSetupRemote true
