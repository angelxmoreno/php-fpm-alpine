#!/bin/bash
TAG=${1}
CONTAINER_NAME="axm_fpm_${TAG}"
IMAGE_NAME="angelxmoreno/php-fpm-alpine:${TAG}"

if [[ ${TAG} == "" ]]
then
    echo "Please provide a tag.";
    exit 1;
fi

CMD="docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}";

echo ${CMD};

${CMD}