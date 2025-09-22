#!/bin/bash
echo "[INFO] Atualizando pacotes..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "[INFO] Instalando dependências..."
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release apache2-utils

# Instalar Docker
echo "[INFO] Instalando Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Adiciona usuário vagrant ao grupo docker
sudo usermod -aG docker vagrant

# Criar diretórios de volumes com permissões corretas
echo "[INFO] Criando volumes persistentes..."
sudo mkdir -p /docker/volumes/mysql_data
sudo mkdir -p /docker/volumes/zabbix_data
sudo mkdir -p /docker/volumes/grafana_data
sudo mkdir -p /docker/volumes/portainer_data
sudo mkdir -p /docker/volumes/traefik_data

sudo chown -R 999:999 /docker/volumes/mysql_data
sudo chown -R 1997:1995 /docker/volumes/zabbix_data || true
sudo chown -R 472:472 /docker/volumes/grafana_data

# Criar rede
docker network create monitoring-network || true

# Gerar senha do Traefik (admin/admin)
HASH=$(htpasswd -nbB admin admin | cut -d ":" -f 2)
cat <<EOF > /docker/volumes/traefik_data/traefik_dynamic.yml
http:
  middlewares:
    auth:
      basicAuth:
        users:
          - "admin:${HASH}"
EOF

# Subir os serviços
echo "[INFO] Subindo Portainer..."
cd /vagrant/etapa1-portainer
docker compose up -d

echo "[INFO] Subindo Traefik..."
cd /vagrant/etapa2-traefik
docker compose up -d

echo "[INFO] Subindo Zabbix + Grafana..."
cd /vagrant/etapa3-monitoring
docker compose up -d

echo "[INFO] Ambiente completo no ar!"
