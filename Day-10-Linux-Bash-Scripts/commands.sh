ssh tony@stapp01
sudo yum install zip -y

ssh-keygen -t rsa # Generate a new SSH key pair
ssh-copy-id clint@stbkp01 # Copy the SSH public key to the remote server

sudo mkdir -p /scripts/
sudo vi /scripts/official_backup.sh
sudo chmod +x /scripts/official_backup.sh # Make the script executable

sudo /scripts/official_backup.sh


## Verify the backup from a new terminal window

ssh clint@stbkp01
ls -l /backup/xfusioncorp_official.zip