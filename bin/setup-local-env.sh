#!/bin/bash

# Exit if any command fails
set -e

# Backup to the root directory
cd "$(dirname "$0")/.."

# Launch the WordPress docker
docker-compose up -d

# Wait until the docker containers are setup properely
echo "Attempting to connect to WordPress"
until $(curl -L http://localhost:8888 -so - | grep -q "WordPress"); do
    printf '.'
    sleep 5
done

# Install WordPress
docker run -it --rm --volumes-from safestash-dev --network container:safestash-dev wordpress:cli core install --url=localhost:8888 --title=SafeStash --admin_user=admin --admin_password=password --admin_email=test@test.com
docker run -it --rm --volumes-from safestash-dev --network container:safestash-dev wordpress:cli plugin activate safestash-api
docker run -it --rm --volumes-from safestash-dev --network container:safestash-dev wordpress:cli plugin activate woocommerce
docker run -it --rm --volumes-from safestash-dev --network container:safestash-dev wordpress:cli plugin activate jwt-authentication-for-wp-rest-api
docker run -it --rm --volumes-from safestash-dev --network container:safestash-dev wordpress:cli plugin activate ach-for-stripe-plaid
docker run -it --rm --volumes-from safestash-dev --network container:safestash-dev wordpress:cli plugin activate custom-post-type-ui
