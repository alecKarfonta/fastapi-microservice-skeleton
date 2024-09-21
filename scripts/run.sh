#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Move to the parent directory of the scripts folder
cd "$(dirname "$0")/.."

# Stop and remove the existing container if it exists
if [ "$(docker ps -a -q -f name=fastapi-microservice)" ]; then
    echo "Stopping and removing existing container..."
    docker stop fastapi-microservice
    docker rm fastapi-microservice
fi

# Run the new container
echo "Running the new container..."
docker run -d \
    --name fastapi-microservice \
    -p 8400:8000 \
    -p 2222:22 \
    fastapi-microservice


# Local volume mounts
#--volume "/home/alec/git/fastapi-microservice-skeleton/model_cache/:/app/model_cache/" \
#-v "/home/alec/git/fastapi-microservice-skeleton/dependencies_cache:/dependencies_cache" \

# --name value can be used to pull logs for the container: docker logs fastapi-microservice
# -p 8400:8000 mounts the host port 8400 to the container port 8000. This is used as the main service port for the FastAPI application.
# -p 2223:22 mounts the host port 2223 to the container port 22. This is used for SSH access to the container. ***Disable in production.***
# --volume flags mount host directories into the container. These volumes are used to store and share data between the host and the container.

# User this flag to enable GPU execution
#--gpus '"device=1"' \
