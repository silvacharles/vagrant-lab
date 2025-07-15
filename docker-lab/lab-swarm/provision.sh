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
echo "Instalando docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/v2.38.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "Habilitando e iniciando servico Docker"
sudo systemctl start docker
sudo systemctl enable docker
echo "Processo de provisionamento do sistema finalizado com sucesso!"