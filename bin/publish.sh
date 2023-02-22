#!/bin/sh
docker build -t anorsich/shopify-krane .

docker image tag anorsich/shopify-krane anorsich/shopify-krane:3.0.1
docker image push anorsich/shopify-krane:3.0.1
