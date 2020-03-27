# API - Sistema Locadora de Filmes
> Sistema de uma locadora de filmes. O sistema permite a criação de
usuários (clientes), logon e logoff de um usuário, listagem de filmes disponíveis, locação de um filme, devolução de um filme, e pesquisa de filme pelo título. 

---

## Environments

- DB_NAME
  - Nome do banco de dados
- DB_USER
  - Usuário para conexão com banco
- DB_PASS
  - Senha do usuário
- DB_HOST
  - host que hospeda o banco de dados
- SECRET
  - Secret ou Private Key - Criptografia do Token JWT

---
## Execução - DEV:
```sh
$ git clone https://github.com/GuilhermeSevero/desafio-locadora.git
$ cd desafio-locadora

# Instala as dependências do projeto
$ npm install

# Execução do Banco (opcional) - Necessário Docker e Docker-Compose
$ docker-compose up -d

# Script para alimentar o banco encontra-se em: ./banco.sql

# Executa serviço da API
$ npm run dev 
```

---

# Endpoints

>- **POST** /login
>- **POST** /logoff

>- **GET** /usuarios
>- **GET** /usuarios/:id
>- **POST** /usuarios
>- **PUT** /usuarios/:id
>- **DELETE** /usuarios/:id

>- **GET** /filmes
>- **GET** /filmes/:id
>- **POST** /filmes/:id/alugar
>- **POST** /filmes
>- **PUT** /filmes/:id
>- **DELETE** /filmes/:id

>- **GET** /alugueis
>- **GET** /alugueis/:id
>- **PATCH** /alugueis/:id/devolver

---

# Exemplos de Uso

# Login
- **POST** /login
  - Buscar o Token do usuário

**body:**
```json
{
	"email": "guilherme@lojaspompeia.com.br",
	"password": "12345678"
}
```

**response:**
```json
{
    "auth": true,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."
}
```

# Logout
- **POST** /logoff
  - Anular o Token do usuário

**body:**
```json
{
	"email": "guilherme@lojaspompeia.com.br",
	"password": "12345678"
}
```

**response:**
```json
{
    "auth": false,
    "token": null
}
```

# Usuarios
- **GET** /usuarios
  - Pega Lista de Usuários

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|

**Params**:
|     Key        |                     Description                |
| :------------: | ---------------------------------------------- |
| name           | nome do usuario                                |
| email          | email do usuario                               |

```http
GET http://127.0.0.1/usuario?name=usuario1&email=usuario1@email.com.br
```

**Response:**
```json
[
    {
        "id": 1,
        "name": "usuario1",
        "email": "usuario1@email.com.br",
        "password": "25d55ad283aa400af464c76d713c07ad",
        "createdAt": "2020-01-01T00:00:00.000Z",
        "updatedAt": "2020-01-01T00:00:00.000Z"
    }
    ...
]
```
- **GET** /usuarios/:id
  - Pega Usuários pelo ID

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Response:**
```json
{
    "id": 1,
    "name": "usuario1",
    "email": "usuario1@email.com.br",
    "password": "25d55ad283aa400af464c76d713c07ad",
    "createdAt": "2020-01-01T00:00:00.000Z",
    "updatedAt": "2020-01-01T00:00:00.000Z"
}
```
- **POST** /usuarios
  - Insere novo usuário

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Body:**
```json
{
    "name": "usuario1",
    "email": "usuario1@email.com.br",
    "password": "12345678"
}
```

**Response:**
```json
{
    "id": 1,
    "name": "usuario1",
    "email": "usuario1@email.com.br",
    "password": "25d55ad283aa400af464c76d713c07ad",
    "createdAt": "2020-01-01T00:00:00.000Z",
    "updatedAt": "2020-01-01T00:00:00.000Z"
}
```
- **PUT** /usuarios/:id
  - Altera usuário pelo ID (pode ser parcial)

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Body:**
```json
{
    "name": "Novo nome do usuário"
}
```

**Response:**
```json
{
    "id": 1,
    "name": "Novo nome do usuário",
    "email": "usuario1@email.com.br",
    "password": "25d55ad283aa400af464c76d713c07ad",
    "createdAt": "2020-01-01T00:00:00.000Z",
    "updatedAt": "2020-01-01T00:00:00.000Z"
}
```
- **DELETE** /usuarios/:id
  - Deleta Usuários pelo ID

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Response:**
```json
{}
```


# Filmes
- **GET** /filmes
  - Pega Lista de Filmes

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|

**Params**:
|     Key        |                     Description                |
| :------------: | ---------------------------------------------- |
| title          | Título do Filme                                |
| director       | Nome do Diretor                                |


```http
GET http://127.0.0.1/filmes?title=Lord of the Rings
```

**Response:**
```json
[
    {
        "id": 3,
        "title": "Lord of the Rings",
        "director": "Peter Jackson",
        "stock": 3,
        "createdAt": "2020-01-01T00:00:00.000Z",
        "updatedAt": "2020-01-01T00:00:00.000Z"
    }
    ...
]
```
- **GET** /filmes/:id
  - Pega Filme pelo ID

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Response:**
```json
{
    "id": 3,
    "title": "Lord of the Rings",
    "director": "Peter Jackson",
    "stock": 3,
    "createdAt": "2020-01-01T00:00:00.000Z",
    "updatedAt": "2020-01-01T00:00:00.000Z"
}
```
- **POST** /filmes/:id/alugar
  - Aluga filme

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|

**Body:**
```json
{
    "userId": 1
}
```

**Response:**
```json
{
    "id": 7,
    "userId": 1,
    "movieId": "3",
    "date": "2020-03-27T04:49:23.531Z",
    "updatedAt": "2020-03-27T04:49:23.534Z",
    "createdAt": "2020-03-27T04:49:23.534Z"
}
```
- **POST** /filmes
  - Insere novo filme

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Body:**
```json
{
    "title": "Lord of the Rings",
    "director": "Peter Jackson",
    "stock": 3
}
```

**Response:**
```json
{
    "id": 3,
    "title": "Lord of the Rings",
    "director": "Peter Jackson",
    "stock": 3,
    "createdAt": "2020-01-01T00:00:00.000Z",
    "updatedAt": "2020-01-01T00:00:00.000Z"
}
```
- **PUT** /filmes/:id
  - Altera filme pelo ID (pode ser parcial)

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Body:**
```json
{
    "director": "Outro Diretor"
}
```

**Response:**
```json
{
    "id": 3,
    "title": "Lord of the Rings",
    "director": "Outro Diretor",
    "stock": 3,
    "createdAt": "2020-01-01T00:00:00.000Z",
    "updatedAt": "2020-01-01T00:00:00.000Z"
}
```
- **DELETE** /filmes/:id
  - Deleta Filme pelo ID

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Response:**
```json
{}
```

# Alugueis
- **GET** /alugueis
  - Pega Lista de Alugueis

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|

**Params**:
|     Key        |                     Description                |
| :------------: | ---------------------------------------------- |
| userId         | ID do Usuário que alugou                       |
| movieId        | ID do Filme Alugado                            |

```http
GET http://127.0.0.1/alugueis?userId=2&movieId=1
```

**Response:**
```json
[
    {
        "id": 1,
        "userId": 2,
        "movieId": 1,
        "date": "2020-03-27T03:58:57.000Z",
        "return": null,
        "createdAt": "2020-03-27T03:58:57.000Z",
        "updatedAt": "2020-03-27T03:58:57.000Z"
    }
    ...
]
```
- **GET** /alugueis/:id
  - Pega aluguel pelo ID

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Response:**
```json
{
    "id": 1,
    "userId": 2,
    "movieId": 1,
    "date": "2020-03-27T03:58:57.000Z",
    "return": null,
    "createdAt": "2020-03-27T03:58:57.000Z",
    "updatedAt": "2020-03-27T03:58:57.000Z"
}
```
- **POST** /alugueis/:id/devolver
  - Devolve o aluguel

**Header:**
|     Key        |                     Value                      |
| :------------: | ---------------------------------------------- |
| Authorization  | "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZ..."|


**Response:**
```json
{
    "id": 1,
    "userId": 2,
    "movieId": 1,
    "date": "2020-03-27T03:58:57.000Z",
    "return": "2020-03-27T03:58:57.000Z",
    "createdAt": "2020-03-27T03:58:57.000Z",
    "updatedAt": "2020-03-27T03:58:57.000Z"
}
```
