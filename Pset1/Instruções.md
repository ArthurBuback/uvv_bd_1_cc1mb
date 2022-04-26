# MariaDB

Primeiro, digite o seguinte código para entrar no User root do MariaDB: `mysql -u root -p` e preencha a senha: `computacao@raiz`.

Após isso, digite o seguinte código para criação do User "Arthur" e para garantir todos os privilégios:
`CREATE USER 'arthur'@'localhost' identified BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'arthur'@'localhost';
exit;`

Após a criação do perfil, digite o seguinte código para entrar no User que acabamos de criar: `mysql -u arthur -p` e preencha a senha: `1234`.

Agora, para criar o Banco de Dados "UVV", digite o seguinte código:
`CREATE database IF NOT exists uvv;
USE uvv;`

Por fim, digite o restante do código normalmente para o preenchimento das tabelas e demais informações.


# PostgreSQL

Primeiro, digite o seguinte código para entrar no User Postegres: `psql -U postgres -W` e preencha a senha: `computacao@raiz`.

Após isso, digite o seguinte código para criação do User "Arthur":
`create user arthur with encrypted password '1234';
alter user arthur createdb;
exit;`

Após a criação do perfil, digite o seguinte código para entrar no User que acabamos de criar: `psql -U arthur postgres -W` e preencha a senha: `1234`.

Agora, para criar o Banco de Dados "UVV", digite o seguinte código:
`create database uvv
with owner = arthur
template = template0
encoding = UTF8
lc_collate = 'pt_BR.UTF-8'
lc_ctype = 'pt_BR.UTF-8'
allow_connections = true;`

Agora, para logar no banco de dados, escreva o seguinte código: `\c uvv` e digite a senha: `1234`

Por fim, digite o restante do código normalmente para o preenchimento das tabelas e demais informações.
