#!/bin/bash
docker build -t migratevm:xen6 Dockerfile.xen6
docker create migratevm:xen6
CONTAINER=$(docker ps -alq)
docker cp "$CONTAINER:/root/migratevm" .
docker container rm "$CONTAINER"
docker image rm migratevm:xen6