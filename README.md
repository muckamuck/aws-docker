## AWS Dockerfile
A simple docker container to develop python stuff in AWS.

## Usage:
### Build the thing
```./docker_build.sh [user-name] [user-id]```

creates a Docker contain with a default username or the indicated username.


### Use the thing
```./docker_run.sh [user-name]```

mount your ${HOME}/.aws directory and your ${HOME}/work directory into a container and run ```/bin/bash```
