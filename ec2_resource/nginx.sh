#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y

systemctl start nginx
systemctl enable nginx

echo "<h1>Hello from shell script</h1>" | sudo tee /var/www/html/index.html