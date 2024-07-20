#!/bin/bash

echo "# "
echo "# BEGIN OF BUILD SYNTHEA FROM $PWD"
echo "# "
set -e

rm -rf ./synthea

git clone --depth 1 https://github.com/synthetichealth/synthea.git

# mgk: If synthea.properties.local exists, overwrite the default synthea.properties file before building
if [ -e ./synthea.properties.local ]; then
    echo "# "
    echo "# synthea.properties.local file found; replacing synthea/src/main/resources/synthea.properties file "
    echo "# "
    cp -f ./synthea.properties.local ./synthea/src/main/resources/synthea.properties
else
    echo "# "
    echo "# Using default synthea/src/main/resources/synthea.properties"
    echo "#"
fi

mkdir ./synthea/.gradle
chmod -R 777 ./synthea
docker run --rm -u gradle -v "$PWD/synthea":/home/gradle/project -w /home/gradle/project gradle:8.9.0-jdk11 gradle assemble

rm -rf ./synthea_dist
mkdir ./synthea_dist
cp ./synthea/build/distributions/synthea.tar ./synthea_dist
chmod -R 777 ./synthea_dist

ls -l
ls -l ./synthea_dist

# mgk: Keep the version of synthea used to create the Docker image for inspection
# rm -rf ./synthea

echo "# "
echo "# END OF BUILD SYNTHEA"
echo "# "
