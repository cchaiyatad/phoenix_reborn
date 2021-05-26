#!/bin/bash

# Variable
# docker image tag name 
image_tag_name="phoenix_reborn"

# database in release
username="postgres"
password="password"
database="phoenix_reborn_dev"
hostname="db:5432"

# secret key from mix phx.gen.secret 
secret_key="Q7L8D8/bmWl81fYNw93guQAJZgOyDbB4nBX5QcHEh4nTmRmx1faHJ8Ob5oS6grPF" # For test
# secret_key=""


# User should execute this script in same directory
if [[ ! $(dirname $0) = "."  ]]; then
    echo "error: user should execute this script in same directory" 
    exit 1
fi

# if user did not provide secret key
if [[ $secret_key = "" ]]; then
    cd ../app
    secret_key=$(mix phx.gen.secret)
    cd ../release
fi

cd ..
docker build -t $image_tag_name \
    --build-arg username=$username \
    --build-arg password=$password \
    --build-arg database=$database \
    --build-arg hostname=$hostname \
    --build-arg secret_key=$secret_key \
    -f release/Dockerfile app/