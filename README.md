# repo
#ec2 instance creation using terraform and httpd setup using ansible

1. To create instance and webserver and create index.html with public IP need to run below command.

ansible-playbook ansi-play.yml --tags "apply,webservere"

2.To destroy the infra need to run below command

ansible-playbook ansi-play.yml --tags "destroy"
