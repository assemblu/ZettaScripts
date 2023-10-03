#!/bin/sh

cd "`dirname $0`"
echo "$PWD"
mkdir cyclonedds/build/
cd cyclonedds/build/
echo "$PWD"
cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=ON -DBUILD_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=/Users/emir/dev/cyclonedds/install ..
cmake --build . --parallel
wait
cmake --build . --target install
wait
echo "[build script] finished"
