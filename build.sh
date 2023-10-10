#!/bin/sh

platform=$(uname)

cd "`dirname $0`"
echo "Navigating to: $PWD"
mkdir ../cyclonedds/build/
echo "Navigating to: $PWD"
cd ../cyclonedds/build/
echo "Erasing previous build content"
rm -rf *
echo "Erasing previous install content"
rm -rf ../install

if [[ $platform == 'Linux' ]]; then
cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=ON -DBUILD_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=/Users/emir/dev/cyclonedds/install ..
else
cmake -G "Xcode" -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=ON -DBUILD_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=/Users/emir/dev/cyclonedds/install ..
fi

wait
cmake --build . --parallel
wait
cmake --build . --target install
wait
echo "[build script] finished"
