#!/bin/bash

cd $(dirname ${0})

if [ -z "${1}" ]; then
	user=$(whoami)
else
	user=${1}
fi

if [ -z "${2}" ]; then
	user_id=501
else
	user_id=${2}
fi

if [ ! -d "pyvim" ]; then
    echo "Getting pyvim from github"
    sleep 1
    git clone --quiet https://github.com/muckamuck/pyvim.git
fi

echo "user: ${user}"
echo "user_id: ${user_id}"
sleep 3
docker build \
    --build-arg user=${user} \
    --build-arg user_id=${user_id} \
    -t aws-shell .
