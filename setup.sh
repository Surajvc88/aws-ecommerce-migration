setup.sh
#!/bin/bash
# Initial setup script

echo "Setting up EC2 instance..."
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
echo "EC2 setup complete."