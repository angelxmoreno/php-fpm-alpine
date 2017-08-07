# php-fpm-alpine
Alpine based PHP FPM with CakePHP and Phalcon readiness

# Software Versions
- Alpine 3.4.6
- PHP 5.6.x
- Phalcon 3.2.1

# Extra PHP modules installed
- mysqli
- pdo_mysql
- redis
- intl
- phalcon

# Building
1. `./bin/dockerlint`
2. `docker build --compress -t angelxmoreno/php-fpm-alpine:x.y.z .`

# Helper scripts
1. `./bin/dockerlint` : Checks the syntax of the Dockerfile file
