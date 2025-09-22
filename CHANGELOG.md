# Changelog

## v1.0.0 (2025-09-20)
- Correção do erro de banco de dados no Zabbix (`users table is empty`).
- Adicionado `init-zabbix.sql` e `sql/server.sql` para carga automática do schema.
- Atualizado `docker-compose.yml` para montar os scripts de inicialização.
- Provisionamento automatizado via `bootstrap.sh`:
  - Sobe Portainer (etapa1).
  - Sobe Traefik (etapa2).
  - Força recriação do banco e sobe Zabbix + Grafana (etapa3).
- Inclusão de `extras/` com scripts PowerShell para facilitar no Windows.
