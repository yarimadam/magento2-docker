#!/usr/bin/env bash

# DOWNLOAD AND INSTALL VENDOR LIBRARIES
composer --working-dir=/home/magento/ create-project magento/community-edition public

# EXECUTE MAGENTO INSTALLATION PROCEDURE
php /home/magento/public/bin/magento setup:install \
        --db-host=mysql \
        --db-name=magento \
        --db-user=magento \
        --db-password=m@gento \
        --admin-user=MageAdmin \
        --admin-password=l3tmein \
        --admin-email=tuncayuner@gmail.com \
        --admin-firstname=Tuncay \
        --admin-lastname=Uner \
        --use-rewrites=1 \
        --backend-frontname=admin

# PERFORM INITIAL CONFIGURATION
php /home/magento/public/bin/magento setup:store-config:set --language=en_US --timezone=Europe/Istanbul --currency=USD
php /home/magento/public/bin/magento setup:store-config:set --base-url=${MAGENTO_BASE_URL}
php /home/magento/public/bin/magento cache:flush