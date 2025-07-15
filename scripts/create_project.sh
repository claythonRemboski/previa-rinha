#!/bin/bash

set -e

# Carrega variáveis do .env
set -o allexport
source env/mysql.env
set +o allexport

DB_CONTAINER_NAME=laravel-db

echo "Criando projeto..."
sudo docker compose run --rm --user root composer --ignore-platform-reqs create-project --prefer-dist laravel/laravel .

sudo chown -R $USER:$USER src/

# Ativar MySQL e descomentar as linhas
sed -i 's/^DB_CONNECTION=sqlite/DB_CONNECTION=mysql/' src/.env
sed -i 's/^# DB_HOST=/DB_HOST=/' src/.env
sed -i 's/^# DB_PORT=/DB_PORT=/' src/.env
sed -i 's/^# DB_DATABASE=/DB_DATABASE=/' src/.env
sed -i 's/^# DB_USERNAME=/DB_USERNAME=/' src/.env
sed -i 's/^# DB_PASSWORD=/DB_PASSWORD=/' src/.env

# Depois seus comandos sed existentes
sed -i "s/^DB_DATABASE=.*/DB_DATABASE=$MYSQL_DATABASE/" src/.env
sed -i "s/^DB_USERNAME=.*/DB_USERNAME=$MYSQL_USER/" src/.env
sed -i "s/^DB_PASSWORD=.*/DB_PASSWORD=$MYSQL_PASSWORD/" src/.env
sed -i "s/^DB_HOST=.*/DB_HOST=$DB_CONTAINER_NAME/" src/.env

echo "Dados atualizados: DB_DATABASE, DB_USERNAME, DB_PASSWORD e DB_HOST no arquivo .env."

echo "Subindo containeres Docker..."
if ! sudo docker compose up -d --build server; then
    echo "Erro ao subir os containers Docker. Verifique os logs e tente novamente."
    exit 1
fi

echo "Aguardando database estar disponível"

echo "DB_HOST"
echo "$DB_CONTAINER_NAME"
echo "DB_HOST"
echo "DB_HOST"
echo "DB_HOST"
echo "DB_HOST"
echo "DB_HOST"

until sudo docker exec -i $DB_CONTAINER_NAME mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "SELECT 1" &>/dev/null; do
    echo "MySQL ainda indisponível. Aguarde..."
    sleep 3
done

echo "Conteineres em funcionamento"

4: Função para aguardar comandos de criação de dependências:
aguardar_execucao() {
    local mensagem="$1"
    local comando="$2"

    echo "$mensagem"
    until eval "$comando"; do
        echo "Aguarde..."
        sleep 2
    done
}

# Executando comandos
# aguardar_execucao "Atualizando dependências com Composer..." "sudo docker compose exec ${DB_CONTAINER_NAME} composer install"
# aguardar_execucao "Gerando chave de aplicação..." "sudo docker compose exec ${DB_CONTAINER_NAME} php artisan key:generate"
# aguardar_execucao "Rodando migrações do banco de dados..." "sudo docker compose exec ${DB_CONTAINER_NAME} php artisan migrate"

echo "Instalação Finalizada"
