#!/bin/bash

apt update
apt install python3 python3-pip python3-venv -y
apt install ansible -y
pip install boto3 botocore
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install community.aws