#!/usr/bin/env sh

echo "Waiting for API to listen on port 3000..."

while ! nc -z api 3000; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done

echo "API ready on port 3000!"