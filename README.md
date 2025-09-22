# Infra Monitoring Lab v1.0.0

[![CI](https://github.com/marnep/infra-monitoring-lab/actions/workflows/ci.yml/badge.svg)](https://github.com/marnep/infra-monitoring-lab/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Version](https://img.shields.io/badge/version-v1.0.0-blue.svg)
![Vagrant](https://img.shields.io/badge/vagrant-ready-green.svg)

> **Ambiente de Monitoramento com Vagrant + Docker Compose** — Portainer, Traefik, Zabbix e Grafana em um laboratório automatizado de infraestrutura.

Este repositório contém a automação completa com **Vagrant + Docker Compose** para subir um ambiente de monitoramento com:

- **Portainer** (gestão de containers)
- **Traefik** (proxy reverso e dashboard)
- **Zabbix** (monitoramento)
- **Grafana** (dashboards)

---

## 🚀 Como usar

### 1. Clonar o repositório
```bash
git clone https://github.com/seu-usuario/infra-monitoring-lab.git
cd infra-monitoring-lab
```

### 2. Subir a VM com Vagrant
```bash
vagrant up
```

Isso irá:
- Criar a VM Ubuntu (2 CPUs, 4 GB RAM)
- Instalar Docker + Compose
- Configurar volumes persistentes
- Subir todos os containers automaticamente

---

## 🌐 Acessos

- **Portainer** → [http://192.168.56.50:9000](http://192.168.56.50:9000)  
  *(usuário será definido no primeiro acesso)*

- **Traefik Dashboard** → [http://traefik.marnep.com.br](http://traefik.marnep.com.br)  
  *(sem autenticação – modo insecure apenas para laboratório)*

- **Zabbix Web** → [http://zabbix.marnep.com.br](http://zabbix.marnep.com.br)  
  Usuário: `Admin`  
  Senha: `zabbix`

- **Grafana** → [http://grafana.marnep.com.br](http://grafana.marnep.com.br)  
  Usuário: `admin`  
  Senha: `admin`

---

## 🔑 Credenciais padrão

- **Traefik** → admin / admin  
- **Zabbix** → Admin / zabbix  
- **Grafana** → admin / admin  
- **Portainer** → criar usuário no primeiro acesso  

---

## 📂 Documentação adicional
Na pasta [`docs`](./docs) você encontra:

📂 Detalhes técnicos em [`docs/README.md`](./docs/README.md)  
🖼️ Arquitetura visual em [`infra-monitoring-lab-diagram.png`](./infra-monitoring-lab-diagram.png)
- Descrição dos serviços
- Checklist de validação de desempenho (CPU, RAM, Disco, Rede, Containers)
- Arquitetura visual
