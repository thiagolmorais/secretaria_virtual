# README
[![Build Status](https://travis-ci.org/thiagolmorais/secretaria_virtual.svg?branch=master)](https://travis-ci.org/thiagolmorais/secretaria_virtual)
[![Dependency Status](https://beta.gemnasium.com/badges/github.com/thiagolmorais/secretaria_virtual.svg)](https://beta.gemnasium.com/projects/github.com/thiagolmorais/secretaria_virtual)
[![Inline docs](http://inch-ci.org/github/thiagolmorais/secretaria_virtual.svg?branch=master)](http://inch-ci.org/github/thiagolmorais/secretaria_virtual)

## Aplicação

Esta aplicação é voltada para a resolução de um problema de pessoas autonomas que tem dificuldades para organizar seu trabalho

## Pré-requisitos
###### Ruby / Rails / PostgreSQL / Git

>Tutotial para instalção das ferramentas básicas <br>
http://simplesideias.com.br/configurando-ruby-rails-mysql-postgresql-git-no-ubuntu

## Configurações
```
PLATFORMS
  ruby

DEPENDENCIES
  byebug
  capybara
  coffee-rails (~> 4.2)
  devise
  factory_bot_rails
  jbuilder (~> 2.5)
  listen (>= 3.0.5, < 3.2)
  puma (~> 3.7)
  rails (~> 5.1.0)
  rspec-rails
  rubocop
  sass-rails (~> 5.0)
  simplecov
  spring
  spring-watcher-listen (~> 2.0.0)
  sqlite3
  turbolinks (~> 5)
  tzinfo-data
  uglifier (>= 1.3.0)
  web-console (>= 3.3.0)

BUNDLED WITH
   1.16.1
```

## Setup

Em seu terminal siga os seguintes comandos
```
git clone https://github.com/thiagolmorais/secretaria_virtual
```
```rails
bundle install
```
```rails
bin/setup
```
```Rails
rails server
```
<br>
Após isso abra o seu browser e digite:

```
http://localhost:3000
```

### Acesso
Para acessar a aplicação cadastre seu email e senha clicando em **sign_up** ou utilize o usuário de testes da aplicação:
> **Email:** user@email.com
<br>
  **Senha:** 123456

## API

### Pacientes
<br>
#### Consultar todos os pacientes

###### URI
/api/pacientes

###### Resposta
```as_json
{  
   "pacientes":[  
      {  
         "id":1,
         "nome":"Paciente A",
         "telefone":"999999999",
         "observacao":"Paciente blablabla",
         "email":"paciente.a@email.com",
         "nascimento":"2000-01-01",
         "sexo":"Feminino",
         "paciente_desde":"2017-01-15",
         "created_at":"2018-05-16T11:46:24.350Z",
         "updated_at":"2018-05-16T11:46:24.350Z",
         "status":true,
         "dia_vencimento":15
      }
   ]
}
```
<br>
### Preços
<br>
#### Consultar todos os preços

###### URI
/api/precos

###### Resposta
```as_json
{  
   "precos":[  
      {  
         "id":1,
         "valor":"150.0",
         "reajuste":"2018-04-01",
         "paciente_id":1,
         "created_at":"2018-05-16T11:46:24.400Z",
         "updated_at":"2018-05-16T11:46:24.400Z"
      }
   ]
}
```
<br>
### Consultas
<br>
#### Consultar todos os consultas

###### URI
/api/consultas

###### Resposta
```as_json
{  
   "consultas":[  
      {  
         "id":4,
         "data":"2018-05-22",
         "hora":"2000-01-01T00:00:00.000Z",
         "status":true,
         "paciente_id":1,
         "created_at":"2018-05-16T12:09:54.139Z",
         "updated_at":"2018-05-16T12:57:38.177Z",
         "competencia":52018
      }
   ]
}
```
<br>
### Faturas
<br>
#### Consultar todas as faturas

###### URI
/api/faturas

###### Resposta
```as_json
{  
   "faturas":[  
      {  
         "id":2,
         "vencimento":"2018-05-06",
         "status":false,
         "valor":"130.0",
         "competencia":42018,
         "consulta_id":2,
         "created_at":"2018-05-16T11:46:24.440Z",
         "updated_at":"2018-05-16T11:46:24.440Z"
      }
   ]
}
```
<br>
### Pagamentos
<br>
#### Consultar todos os pagamentos

###### URI
/api/pagamentos

###### Resposta
```as_json
{  
   "pagamentos":[  
      {  
         "id":5,
         "valor":"180.0",
         "data":"2018-05-16",
         "competencia":52018,
         "paciente_id":1,
         "created_at":"2018-05-16T14:24:38.837Z",
         "updated_at":"2018-05-16T14:24:38.837Z",
         "status":true
      }
   ]
}
```
