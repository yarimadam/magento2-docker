Bare minimum development environment for Magento2.

This configuration has 2 containers:

- Nginx/PHP-FPM7 (yarimadam/magento2)
- MySQL 5.6.39 (official)

Provisioning information for web container can be found at [here](https://github.com/yarimadam/magento2-dockerfile).

To spin up your containers, run `docker-compose up` command, and setup handles the rest.

If you want to clear everything including database, run `reset.sh` and then `docker-compose up` command again.

It keeps following log files.

- log/fpm.log
- log/magento.cron.log
- log/nginx.access.log
- log/nginx.error.log