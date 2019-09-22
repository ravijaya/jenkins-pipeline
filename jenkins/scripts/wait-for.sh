#!/usr/bin/env sh

PORT=${1:-3000}
echo "Waiting at localhost:$PORT..."
while ! nc -z localhost $PORT; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done
echo "Service at localhost:$PORT ready..."