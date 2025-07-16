# Makefile para automação de comandos Artisan com Docker Compose

# Variáveis interativas
ask=read -p
run_artisan=docker compose run --rm artisan

.PHONY: help
help:
	@echo "Comandos disponíveis:"
	@grep -E '^[a-zA-Z_-]+:.*?##' Makefile | awk -F':|##' '{printf "\033[36m%-20s\033[0m %s\n", $$1, $$3}'

api-controller:
	$(ask) "Nome do Controller (sem extensão php): " controller_name; \
	$(run_artisan) make:controller Api/$$controller_name --resource --api ## Cria um controller API

install-api:
	$(run_artisan) install:api ## Executa comando install:api

collection:
	$(ask) "Nome da Resource Collection: " collection_name; \
	$(run_artisan) make:resource $$collection_name --collection ## Cria resource collection

command:
	$(ask) "Nome do Command: " command_name; \
	$(run_artisan) make:command $$command_name ## Cria um novo comando Artisan

controller:
	$(ask) "Nome do Controller: " controller_name; \
	$(run_artisan) make:controller $$controller_name ## Cria um controller padrão

server-up:
	docker compose up -d server ## Sobe containers necessários

factory:
	$(ask) "Nome da Factory: " factory_name; \
	$(run_artisan) make:factory $$factory_name ## Cria uma factory

job:
	$(ask) "Nome do Job: " job_name; \
	$(run_artisan) make:job $$job_name ## Cria um Job

middleware:
	$(ask) "Nome do Middleware: " middleware_name; \
	$(run_artisan) make:middleware $$middleware_name ## Cria um middleware

migrate:
	$(run_artisan) migrate ## Executa migrações

migration:
	$(ask) "Nome da tabela: " table_name; \
	$(run_artisan) make:migration create_table_$$table_name --create=$$table_name ## Cria uma migration

model:
	$(ask) "Nome do Model: " model_name; \
	$(run_artisan) make:model $$model_name ## Cria um model

project:
	./scripts/create_project.sh

request:
	$(ask) "Nome do Request: " request_name; \
	$(run_artisan) make:request $$request_name ## Cria um form request

resource:
	$(ask) "Nome do Resource: " resource_name; \
	$(run_artisan) make:resource $$resource_name ## Cria um resource

routelist:
	$(run_artisan) route:list ## Lista todas as rotas

seeder:
	$(ask) "Nome do Seeder: " seeder_name; \
	$(run_artisan) make:seeder $$seeder_name ## Cria um seeder

seed:
	$(run_artisan) db:seed ## Executa os seeders

server-up:
	docker compose up -d --build server ## Sobe os containers com build

service:
	$(ask) "Nome do Service (sem extensão php): " service_name; \
	directory=./src/app/Services; \
	mkdir -p $$directory; \
	file_path="$$directory/$$service_name.php"; \
	echo "<?php\n\nnamespace App\\Services;\n\nclass $$service_name\n{\n    // Adicione seus métodos aqui\n}\n" > $$file_path; \
	echo "$$service_name criado em $$file_path" ## Cria um service manualmente

telescope:
	docker compose run --rm composer require laravel/telescope --dev; \
	$(run_artisan) telescope:install ## Instala Laravel Telescope
