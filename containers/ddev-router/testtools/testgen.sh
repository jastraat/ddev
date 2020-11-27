#!/bin/bash

# Test default.conf generation for https://github.com/drud/ddev/issues/2648

cpfiles="nginx.tmpl gen-cert-and-nginx-config.sh.tmpl"

for item in $cpfiles; do
  docker cp $item ddev-router:/app
done

docker exec ddev-router docker-gen -only-exposed /app/nginx.tmpl /tmp/default.conf

docker exec ddev-router grep "upstream.*-" /tmp/default.conf
