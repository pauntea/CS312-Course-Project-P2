#!/bin/bash

aws ec2 create-key-pair --key-name auto-minecraft-key --region us-east-1 --query 'KeyMaterial' --output text > auto-minecraft-key.pem
chmod 400 auto-minecraft-key.pem