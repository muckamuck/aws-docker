#!/bin/bash

if [ -z "${1}" ]; then
    user=$(whoami)
else
    user=${1}
fi

docker run \
    -u ${user} \
    -v ${HOME}/.aws:/home/${user}/.aws \
    -v ${HOME}/work:/home/${user}/work \
    --hostname nebula \
    --rm \
    -it aws-shell /bin/bash
