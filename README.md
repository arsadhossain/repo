# CG_Task
#ec2 instance creation using terraform and httpd setup using ansible

Couple of backend commands used to fix SSH error issues:
1. Login as ec2-user (to be used as remote_user in order to connect to remote EC2 and setup apache)
2. Below details added to /home/ec2-user/.bashrc
export eval "$(ssh-agent -s)"
export ssh-add /home/ec2-user/.ssh/id_rsa

EXECUTION:
1. To create instance and webserver and create index.html with public IP need to run below command.

ansible-playbook -vvv master.yaml --tags "apply"

2.To destroy the infra need to run below command

ansible-playbook -vvv master.yml --tags "destroy"

#Scripts
1. aws_ec2.tf ##terraform code used to create AWS EC2, copy id_rsa.pub file to remote, attach EIP, copy PublicIP of instance to /etc/ansible/hosts in localhost - Outputs: Instance ID, Public Elastic IP Address attached to Instance
2. master.yml ## Used to run both the playbooks in order. 1. Run infra.yml 2. Run apache.yml
3. infra.yml: Create EC2 using terraform file aws_ec2.tf
4. apache.yml - Install and setup httpd on remote EC2 instance 

Final Validation:
Run URL http://<NewEC2IP>:80 in any web browser
- Where NewEC2IP is the IP of the newly created EC2 instance
You can fetch the IP details using
1. terraform output publicIP
2. cat /etc/ansible/hosts - find the IP under [webserver] section
