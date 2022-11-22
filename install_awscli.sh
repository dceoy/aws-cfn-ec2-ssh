#!/usr/bin/env bash

set -euox pipefail

sudo yum -y upgrade
sudo yum install -y unzip
curl -SL -o /tmp/awscliv2.zip \
  https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
unzip /tmp/awscliv2.zip
sudo ./aws/install
