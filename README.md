# Laravel Model

Este é um modelo para projetos em Laravel que visa facilitar o desenvolvimento, utilizando containers docker como utilitários.
Com poucos comandos é possível criar os arquivos e rodar migrations, criar seeders, models, etc. Tudo diretamente do host.

# Makefile

Na pasta inicial do projeto há um arquivo chamado `Makefile`. É um utilitário para facilitar a utilização do projeto.

Para criar e rodar o projeto, digite no terminal, na mesma pasta onde o arquivo se encontra:
`make project`
- Este comando irá criar os arquivos do Laravel, preencher o .env, subir os containeres e executar as migrations.

Para saber quais outros comandos estão disponíveis, basta digitar `make + TAB(2X)`. Há comandos para criar Controllers, Services, Requests, etc.


## Passos

1. Baixe, o projeto.
2. Execute o comando abaixo para criar os arquivos do Laravel na pasta src (execute na pasta inicial do projeto):
    - ```make project```
3. Caso precise, o comando para subir somente os containeres é:
    - ```make server-up```
4. Se precisar rodar as migrations:
    - ```make migrate```
5. Como o objetivo é projetos para estudo, não temos preocupações com o ambiente de produção. Mas caso utilize, pode apagar os bind mounts (volumes ligados) que estão no docker-compose.yml pois em produção não precisamos ter acesso à edição de código.

## Containeres utilitários
Os containeres artisan e composer do docker-compose funcionam do seguinte modo: ao digitar os comandos listados no arquivo make, o container relativo é executado, faz o que foi indicado e em seguida é removido.


