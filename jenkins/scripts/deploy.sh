#!/usr/bin/env sh

echo "Deploying app ($registry:$BUILD_NUMBER)..."
docker network create test-net

docker container run --name api \
    --rm -d \
    --net test-net \
    $registry:$BUILD_NUMBER

echo "Smoke tests..."
docker container run --name tester \
    --rm \
    --net test-net \
    gnschenker/node-docker sh -c "curl api:3000"

