#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BKP_DIR="$DIR/backups"

# Carrega as variáveis do arquivo .env
source $DIR/.env

# Pega a data e a hora para o nome do arquivo e cria a pasta do backup(caso não exista)
DATA=$(date +%Y%m%d_%H%M%S)
mkdir -p $BKP_DIR

# Executa o dump do MySQL de dentro do container
echo "Iniciando backup do Zabbix:"
docker exec zabbix-mysql /usr/bin/mysqldump -u root -p${DB_ROOT_PASSWORD} ${DB_NAME} > $BKP_DIR/zabbix_$DATA.sql

# Compacta o arquivo SQL gerado e posteriormente remove o .sql
tar -czf $BKP_DIR/zabbix_$DATA.tar.gz -C $BKP_DIR zabbix_$DATA.sql
rm $BKP_DIR/zabbix_$DATA.sql

# Removendo backups com mais de 7 dias
find $BKP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "Backup concluído com sucesso: zabbix_$DATA.tar.gz"
