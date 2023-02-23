#!/bin/sh
docker build --platform linux/amd64 -t anorsich/shopify-krane .

docker image tag anorsich/shopify-krane anorsich/shopify-krane:3.0.1
docker image push anorsich/shopify-krane:3.0.1
