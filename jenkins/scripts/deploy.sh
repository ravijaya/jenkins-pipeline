#!/usr/bin/env sh

echo "Removing api container if it exists..."
docker container rm -f api || true

echo "Deploying app ($registry:$BUILD_NUMBER)..."
docker network create test-net

docker container run -d \
    --name api \
    --net test-net \
    $registry:$BUILD_NUMBER

docker container run --rm \
    -v /home/fod/ch07/jenkins-pipeline/jenkins/scripts:/scripts \
    --net test-net \
    node:12.10-alpine sh -c "/scripts/wait-for.sh"

echo "Smoke tests..."
docker container run --name tester \
    --rm \
    --net test-net \
    gnschenker/node-docker sh -c "curl api:3000"

