# repo
#ec2 instance creation using terraform and httpd setup using ansible

1. To create instance and webserver and create index.html with public IP need to run below command.

ansible-playbook ansi-play.yml --tags "apply,webservere"

2.To destroy the infra need to run below command

ansible-playbook ansi-play.yml --tags "destroy"


#scripts
1. aws_ec2.tf ##terraform code (access_key and secret_key need to provide)
2. public_ip.sh ##shell script to update index.html file with IP address.
3. ansi-play.yml ## create and destory instance using terraform, install webserver.
