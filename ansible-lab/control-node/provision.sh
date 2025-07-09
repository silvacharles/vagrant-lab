#!/bin/sh
echo "Iniciando o Provisionamento do sistema..."
sudo yum install -y epel-release
echo "Iniciando a instalação do Ansible"
sudo yum install -y ansible
echo "Adicioando o arquivo hosts"
cat <<EOF | sudo tee /etc/hosts
192.168.33.2 control-node
192.168.33.3 app01
192.168.33.4 db01
EOF