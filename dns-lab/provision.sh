#!/bin/bash
echo "Iniciando o Provisionamento do sistema..."
echo "Iniciando Biblioteca yum-utils"
sudo yum install -y yum-utils
echo "Adicionando repositorio Docker"
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo "Instalando docker e containerd"
sudo yum install -y docker-ce docker-ce-cli containerd.io
echo "Atribuindo grupo docker ou usuario"
sudo usermod -aG docker $(whoami)
echo "Habilitando e iniciando servico Docker"
sudo systemctl start docker
sudo systemctl enable docker
