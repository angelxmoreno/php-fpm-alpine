# php-fpm-alpine
Alpine based PHP FPM with CakePHP readiness

# Software & Versions
- Alpine 3.16
- PHP 7.4.30
- Git 2.36.2
- Composer 2.4.2
- Xdebug 3.1.5
- Node v16.16.0
- NPM 8.10.0
- Yarn 1.22.19

# Extra PHP modules installed
- mysqli
- pdo_mysql
- redis
- intl

# Building && debugging
1. `./bin/dockerlint`
2. `./bin/build x.y.z [dev,prod]`
2. `./bin/start x.y.z`
2. `./bin/enter x.y.z`

# Helper scripts
1. `./bin/dockerlint` : Checks the syntax of the Dockerfile file
2. `./bin/build` : for building images
3. `./bin/start` : for starting a container
4. `./bin/enter` : for entering a container
