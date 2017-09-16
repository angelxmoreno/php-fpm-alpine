#!/bin/bash
TAG=${1}
MODE=${2}

if [[ ${TAG} == "" ]]
then
    echo "Please provide a tag.";
    exit 1;
fi

if [[ ${MODE} == "" ]]
then
   MODE="dev"
fi

if [[ ${MODE} == "prod" ]]
then
    CMD="docker build --no-cache --compress --tag=angelxmoreno/php-fpm-alpine:${TAG} ."
else
    CMD="docker build --tag=angelxmoreno/php-fpm-alpine:${TAG} .";
fi

echo ${CMD};

${CMD}