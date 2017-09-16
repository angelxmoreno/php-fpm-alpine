# php-fpm-alpine
Alpine based PHP FPM with CakePHP and Phalcon readiness

# Softwares & Versions
- Alpine 3.4.6
- PHP 5.6.x
- Phalcon 3.2.1
- Git 2.8.6
- Composer 1.5.2
- XDebug 2.5.5

# Extra PHP modules installed
- mysqli
- pdo_mysql
- redis
- intl
- phalcon

# Building
1. `./bin/dockerlint`
2. `./bin/build docker build x.y.z [dev,prod]`

# Helper scripts
1. `./bin/dockerlint` : Checks the syntax of the Dockerfile file
2. `./bin/build` : for building images
3. `./bin/start` : for starting a container
4. `./bin/enter` : for entering a container
