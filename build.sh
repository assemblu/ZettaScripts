#!/bin/sh

platform=$(uname)

cd "`dirname $0`"
rm -rf ../cyclonedds/build/
rm -rf ../cyclonedds/install/
mkdir ../cyclonedds/build/
cd ../cyclonedds/
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/home/emir/dev/cyclonedds/install . -Bbuild
cd ./build/
cmake --build . --target install
echo "[build script] finished"
