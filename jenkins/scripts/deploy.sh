#!/usr/bin/env sh

echo "Deploying app ($registry:$BUILD_NUMBER)..."
docker network create test-net

docker container run -d \
    --name api \
    --net test-net \
    $registry:$BUILD_NUMBER

./jenkins/scripts/wait-for.sh

echo "Smoke tests..."
docker container run --name tester \
    --rm \
    --net test-net \
    gnschenker/node-docker sh -c "curl api:3000"

