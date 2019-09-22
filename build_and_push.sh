#!/usr/bin/env sh

echo "Building Docker image"
docker image build -t gnschenker/jenkins-node-sample .

# need to login to Docker to be able to push the image
echo "Login to Docker Hub"
docker login -u gnschenker -p ${env.DOCKER_PWD}

echo "Pushing to Docker Hub"
docker image push gnschenker/jenkins-node-sample
