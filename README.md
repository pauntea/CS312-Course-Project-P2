<h1>Minecraft Server Automated Provisioning, Configuration, and Setup Tutorial</h1>

<h2>Background</h2>
    - What will we do?
    This tutorial covers the use of Ansible to automate the setup of AWS resources for a Minecraft server.

    - How will we do it?
    The automation will be done through Ansible scripts where the provisioning of EC2 resources and network setup will take place. Within the scripts, a configuration for the Minecraft server restart will also be included. That is, the server would be set to restart during the reboot of resources.