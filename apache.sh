#!/bin/bash

yum install -y httpd
echo "welcoem to terraform !!!!" >/var/www/html/index.html
systemctl enable httpd
systemctl start httpd
