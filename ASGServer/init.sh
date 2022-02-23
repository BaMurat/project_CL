#! /bin/bash
#Hardcoded Environment Variables
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& PRIVATE_IP=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4`
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& PUBLIC_IP=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4`
DATE_TIME=`date`

#Prepare environment by pulling dependencies
yum update -y
yum install -y httpd

#Pull git repository to initiate the web server
cat ./PRVprojectCL/ASGServer/index.html > /var/www/html/index.html
chmod -R 777 /var/www/html

systemctl start httpd
systemctl enable httpd