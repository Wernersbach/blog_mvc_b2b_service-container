# Imagem oficial do PHP 8 com Apache
FROM php:8.0-apache

# Copiando os arquivos do projeto para o diretório padrão do Apache dentro da pasta 'web'
COPY web/ /var/www/html/

# Extensões do PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Habilitar o módulo rewrite do Apache
RUN a2enmod rewrite

# Alterar a configuração para permitir .htaccess com AllowOverride All
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Expondo a porta 80 para acessar o Apache
EXPOSE 80
