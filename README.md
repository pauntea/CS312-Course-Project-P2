<h1>Minecraft Server Automated Provisioning, Configuration, and Setup Tutorial</h1>

<h2>Background</h2>

1. What will we do?
    
    This tutorial covers the use of Ansible and Bash scripts to automate the setup of AWS resources for a Minecraft server.

2. How will we do it?
    
    The initial installations will be covered by running a Bash script. The automation will be done through Ansible scripts where the provisioning of EC2 resources and network setup will take place. Within the scripts, a configuration for the Minecraft server restart will also be included. That is, the server would be set to restart during the reboot of resources.


<h2>Tutorial</h2>

Before starting, it must be noted that the tutorial assumes these commands and scripts will be run on an Ubuntu/Debian OS.

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
apt install python3 python3-pip python3-venv -y
apt install ansible -y
apt install awscli -y
pip install boto3 botocore --break-system-packages
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install community.aws
```

These commands ensure that the local device checks and downloads the latest available versions of its software. Ansible and the AWS collections are also installed for the purpose of automating the provisioning, configuration, and management of AWS resources. Boto3 is installed for meeting the requirements of AWS modules with Ansible.


<h3>Part 2: Provisioning EC2 Resources</h3>

1. Create and store AWS credentials on the local device using the given command.

Bash
```
aws configure
```

Enter the appropriate values when asked.

AWS Access Key ID, AWS Secret Access Key, and AWS Session Token can be found on the Learner Lab module.
Default region name: `us-east-1`
Default output format: `json`

2. Launch the EC2 instance using Ansible by running the following command.


Script inside <b>launch-ec2.yaml</b>:
```
---
- name: Automatically Create Minecraft EC2 Server
  hosts: localhost
  connection: localhost
  gather_facts: no

  tasks:
    - name: Create EC2 key pair
      amazon.aws.ec2_key:
        name: auto-minecraft-key
        region: us-east-1
        key_type: rsa
        file_format: pem
        state: present
      register: key_result

    - name: Create Security group
      amazon.aws.ec2_security_group:
        profile: default
        name: Auto Minecraft Server SG
        description: Minecraft Server SG Configuration for Server Connection
        region: us-east-1
        rules:
          - proto: tcp
            ports:
              - 22
            cidr_ip: "{{ my_ip }}/32"
            rule_desc: allow ssh from my ip
          - proto: tcp
            ports:
              - 25565
            cidr_ip: 0.0.0.0/0
            rule_desc: allow all on port 25565
      register: sg_result

    - name: Launching EC2 instances
      community.aws.ec2_instance:
        profile: default
        name: Auto Minecraft Server
        key_name: auto-minecraft-key
        vpc_security_group_ids: 
          - "{{ sg_result.group_id }}"
        instance_type: t4g.small
        image_id: ami-0576ef8e344fbf536
        state: present
        region: us-east-1
        network:
          assign_public_ip: yes
```

*This tutorial was made with the guide of the following resources and AI. The references were used for research and learning purposes. OpenAI was used for debugging and learning purposes. All credits go to the rightful owners.*

<h1>References</h1>

Kumarasiri, D. (2025, March 9). Automating AWS EC2 Instance Provisioning with Ansible. [https://medium.com/@dhanikaa/automating-aws-ec2-instance-provisioning-with-ansible-18f57d863fee](https://medium.com/@dhanikaa/automating-aws-ec2-instance-provisioning-with-ansible-18f57d863fee)

Madapparambath, G. (2021, November 2). How to provision AWS infrastructure with Ansible. [https://www.redhat.com/en/blog/ansible-provisioning-aws-cloud](https://www.redhat.com/en/blog/ansible-provisioning-aws-cloud)

OpenAI. (2026). ChatGPT (May 2026 version) [Large language model]. [https://chat.openai.com/](https://chat.openai.com/)