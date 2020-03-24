# API - Sistema Locadora de Filmes
> Sistema de uma locadora de filmes. O sistema permite a criação de
usuários (clientes), logon e logoff de um usuário, listagem de filmes disponíveis, locação de um filme, devolução de um filme, e pesquisa de filme pelo título. 

---
## Execução - DOCKER
> Necessário instalação prévia do Docker e Docker Compose.
```sh
$ git clone https://github.com/GuilhermeSevero/desafio-locadora.git
$ cd desafio-locadora

# Cria imagem docker
$ docker build . -t localhost/api-desafio-locadora:1.0.0

# Inicia container
$ docker-compose up
```

---
## Execução - DEV:
```sh
$ git clone https://github.com/GuilhermeSevero/desafio-locadora.git
$ cd desafio-locadora
$ npm install
$ npm run dev 
```
