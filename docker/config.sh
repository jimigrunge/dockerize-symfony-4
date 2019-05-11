#!/usr/bin/env bash

cd $(pwd)

cat docker/gitignore >> .gitignore

echo '* Installing composer packages...'
composer require --dev shipping-docker/vessel "^4.0"
composer require --dev fzaninotto/faker
composer require --dev mockery/mockery
# composer require --dev phpunit/phpunit
sleep 2
cp vendor/shipping-docker/vessel/docker-files/vessel vessel
chmod 755 vessel
sleep 2

echo '* Initializing Vessel Docker controller...'
bash vessel init
sleep 2

echo "
* * * * * * * * * * * * * * * * * * * * * * * * * *

Daily usage:

    Start docker server
        ? docker-sync clean
        ? docker-sync start
        ? ./vessel start

    SSH into server
        ? ./vessel ssh app

    Stop server
        ? ./vessel stop
        ? docker-sync stop

To view site:
    Open your browser to http://localhost

* * * * * * * * * * * * * * * * * * * * * * * * * *
"
echo 'Thank you for using "new-php-docker-project"!'


