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
>**Email:** user@email.com
<br>
>**Senha:** 123456
