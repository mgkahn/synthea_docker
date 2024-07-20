#!/bin/bash

VERSION=$(cat ./VERSION)
docker run --rm -v $PWD/output:/output --name synthea-docker mgkahn/synthea:version-$VERSION -p 5
