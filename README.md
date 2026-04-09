# Stack de Monitoramento Automatizada

Este projeto provisiona uma infraestrutura completa de monitoramento utilizando **Docker** e **Docker Compose**. Ele sobe instâncias do Zabbix (Server e Web), Grafana e um banco de dados MySQL, todos interligados em uma rede interna.

## Tecnologias Utilizadas
* **Docker & Docker Compose:** Orquestração dos containers.
* **Zabbix:** Coleta de métricas e alertas.
* **Grafana:** Criação de dashboards visuais.
* **MySQL:** Banco de dados relacional para persistência do Zabbix.
* **Bash Script & Cron:** Automação de rotinas de backup.

## Como executar o projeto

1. Clone o repositório:
\`\`\`bash
git clone https://github.com/gbrsoares1/Monitoramento_Zabbix_Grafana
\`\`\`

2. Crie o arquivo de variáveis de ambiente a partir do exemplo:
\`\`\`bash
cp .env.example .env
\`\`\`
*Edite o arquivo `.env` com as suas senhas seguras.*

3. Suba a infraestrutura:
\`\`\`bash
docker compose up -d
\`\`\`

## Automação de Backup
O projeto inclui um script `backup.sh` que realiza o dump do banco de dados MySQL de dentro do container, compacta os dados e gerencia a retenção (exclui backups com mais de 7 dias). Ideal para ser agendado no `crontab` do Linux.
