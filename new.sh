#!/bin/sh
export PATH=$PATH:/usr/local/bin/terraform
echo $PATH

cd /home/ec2-user/terraform_lab


pwd

./terraform init
./terraform plan
./terraform apply -auto-approve

var=$(./terraform output instance-public-ip)

echo "hello" + $var
sleep 1m
echo $var > host
ansible -m ping all -i ./host --private-key=keyfile -u ubuntu

ansible-playbook apache2.yml -i ./host --private-key=keyfile -u ubuntu -e "ansible_python_interpreter=/usr/bin/python3"
