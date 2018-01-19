#!/bin/bash

set -e

DOCKER_IMAGE=${DOCKER_IMAGE:-boshcpi/gce-cpi-release}
DOCKER_IMAGE_VERSION=${DOCKER_IMAGE_VERSION:-v6}

docker login

echo "Building docker image..."
docker build -t $DOCKER_IMAGE .

echo "Tagging docker image with version '$DOCKER_IMAGE_VERSION'..."
docker tag $DOCKER_IMAGE $DOCKER_IMAGE:$DOCKER_IMAGE_VERSION

echo "Pushing docker image to '$DOCKER_IMAGE'..."
docker push $DOCKER_IMAGE