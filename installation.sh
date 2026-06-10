#!/bin/bash

apt update
apt install ansible -y
apt install boto3 botocore -y
ansible-galaxy collection install amazon.aws