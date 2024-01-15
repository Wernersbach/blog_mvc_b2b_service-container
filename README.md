# blog_mvc_b2b
Este é o repositório para o sistema de blog `blog_mvc_b2b`, que utiliza a arquitetura MVC e Docker para facilitar a configuração do ambiente de desenvolvimento.

## Pré-requisitos
Antes de começar, você precisará ter o seguinte instalado:
- Docker
- Docker Compose

## Configuração do Ambiente

Siga os passos abaixo para configurar seu ambiente de desenvolvimento:

### 1. Clonar o Repositório do Projeto
```bash
git clone https://github.com/Wernersbach/blog_mvc_b2b.git web
```

### 2. Subir os Containers Docker e Iniciar
```bash
docker-compose build --no-cache
```
```bash
docker-compose up -d
```

### 3. Acessar a Aplicação
http://localhost:8000

### 4. Interagindo com o Container
```bash
docker-compose exec web bash
```

### 4. Desligando os Containers
```bash
docker-compose down
```