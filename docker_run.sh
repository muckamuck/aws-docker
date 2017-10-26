#!/bin/bash

virtualenvs=$(pwd)/.virtualenvs
cd $(dirname ${0})
if [ -z "${1}" ]; then
    user=$(whoami)
else
    user=${1}
fi

if [ -d "${virtualenvs}" ]; then
    echo "Using ${virtualenvs}"
else
    echo "Making ${virtualenvs}"
    mkdir ${virtualenvs}
fi

docker run \
    -u ${user} \
    -v ${HOME}/.aws:/home/${user}/.aws \
    -v ${HOME}/.ssh:/home/${user}/.ssh \
    -v ${HOME}/work:/home/${user}/work \
    -v ${virtualenvs}:/home/${user}/.virtualenvs \
    -w /home/${user} \
    --hostname nebula \
    --rm \
    -it aws-shell /bin/bash
