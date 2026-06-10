#!/bin/bash

aws ec2 create-key-pair \
    --key-name auto-minecraft-key \
    --query 'KeyMaterial' \
    --output text > auto-minecraft-key.pem

chmod 400 auto-minecraft-key.pem