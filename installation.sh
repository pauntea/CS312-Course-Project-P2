#!/bin/bash

apt update
apt install python3 python3-pip python3-venv -y
apt install ansible -y
pip install boto3 botocore --break-system-packages
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install community.aws