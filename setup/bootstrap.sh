#!/usr/bin/env bash

# 1. ARRANGE BASE URL
if [ "$MAGENTO_BASE_URL" == "" ]; then
    echo -e "MAGENTO_BASE_URL environment variable is not set."
    echo -e "Please set it by running: export MAGENTO_BASE_URL=http://magento2.local"
    echo -e "Reverting to default base url: http://magento2.local"
    MAGENTO_BASE_URL="http://magento2.local"
fi

# 2. INSTALL MAGENTO IF DIRECTORY IS EMPTY
if [ ! "$(ls -A /home/magento/public)" ]; then
    bash /setup/install-magento.sh
else
    # UPDATE BASE URL
    php /home/magento/public/bin/magento setup:store-config:set --base-url=${MAGENTO_BASE_URL}
    php /home/magento/public/bin/magento cache:flush
fi

# 3. REGISTER CRON JOBS
crontab /setup/cronjob

# 4. START SERVICES
sudo /etc/init.d/php7.0-fpm start
sudo /usr/sbin/nginx -g 'daemon off;'