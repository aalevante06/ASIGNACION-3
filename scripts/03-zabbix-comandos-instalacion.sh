#!/usr/bin/env bash
# Registro reproducible de paquetes/comandos utilizados en Ubuntu 26.04.1 LTS.
# Requiere acceso a Internet; NO ejecuta creación de usuarios ni contraseñas de producción.
set -euo pipefail
sudo apt update
wget -q https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu26.04_all.deb
sudo dpkg -i zabbix-release_latest+ubuntu26.04_all.deb
sudo apt update
sudo apt install -y mysql-server zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent2
sudo a2enmod proxy proxy_fcgi setenvif
sudo a2enconf php8.5-fpm
sudo systemctl enable --now mysql zabbix-server zabbix-agent2 php8.5-fpm
sudo apache2ctl configtest
sudo systemctl enable --now apache2
# Base de datos y DBPassword se crearon manualmente; credenciales no se publican.
