#!/bin/bash

IMAGE_NAME="quay.io/centos/centos:stream9"

set -x

docker pull $IMAGE_NAME
docker run -itd --name validation-test $IMAGE_NAME
ansible-playbook -i ./inventory ./test.yml
docker stop validation-test
docker rm validation-test
