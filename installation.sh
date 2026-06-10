#!/bin/bash

apt update
apt install python3 python3-pip python3-venv -y
apt install ansible -y
apt install awscli -y
pip install boto3 botocore --break-system-packages
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install community.aws