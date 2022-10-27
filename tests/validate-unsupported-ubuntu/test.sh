#!/bin/bash

CONTAINER_NAME=`basename \`pwd\``

set -x

docker build -t $CONTAINER_NAME ./
docker run -itd --name validation-test $CONTAINER_NAME
ansible-playbook -i ./inventory ./test.yml
docker stop validation-test
docker rm validation-test
