#!/usr/bin/env sh

read -d '' wait_for << EOF
echo "Waiting for API to listen on port 3000..."

while ! nc -z api 3000; do   
  sleep 0.1 # wait for 1/10 of the second before check again
  printf "."
done

echo "API ready on port 3000!"
EOF

# sh -c "$wait_for"

docker container run --rm \
    node:12.10-alpine sh -c "$wait_for"
