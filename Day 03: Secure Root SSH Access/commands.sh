## Connect to all App Servers: stapp01, stapp02, stapp03
ssh tony@stapp01

sudo vi /etc/ssh/sshd_config # Change PermitRootLogin to no

sudo systemctl restart sshd