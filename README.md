<h1>Minecraft Server Automated Provisioning, Configuration, and Setup Tutorial</h1>

<h2>Background</h2>

1. What will we do?
    
    This tutorial covers the use of Ansible to automate the setup of AWS resources for a Minecraft server.

2. How will we do it?
    
    The automation will be done through Ansible scripts where the provisioning of EC2 resources and network setup will take place. Within the scripts, a configuration for the Minecraft server restart will also be included. That is, the server would be set to restart during the reboot of resources.


<h2>Tutorial</h2>

<h3>Part 1: Dependencies Installation</h3>

1. Install the dependencies using the following commands.

Bash
```
sudo chmod +x installation.sh
sudo ./installation.sh
```

The Bash script contains the following commands.
Bash
```
apt update
apt install ansible -y
apt install boto3 botocore -y
ansible-galaxy collection install amazon.aws
```

These commands ensure that the local device checks and downloads the latest available versions of its software. Ansible and Amazon AWS collection are also installed for the purpose of automating the provisioning, configuration, and management of AWS resources. Boto3 is installed for meeting the requirements of AWS modules with Ansible.