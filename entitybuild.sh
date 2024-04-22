#!/bin/sh

cd "`dirname $0`"

# sh ./buil.sh
# sh ./certbuild.sh
			
export CMAKE_PREFIX_PATH=/home/emir/dev/cyclonedds/install:/home/emir/dev/cyclonedds-certified/install
rm -rf ../entityprovider/build/
rm -rf ../entityprovider/install/
mkdir ../entityprovider/build/
cd ../entityprovider/

cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DBUILD_TESTING_TOOLS=ON -DCMAKE_INSTALL_PREFIX=install -DCYCLONE_SOURCE_DIR=/home/emir/dev/cyclonedds -DCMAKE_BUILD_TYPE=Debug -DBUILD_EXAMPLES=ON -Bbuild

cd ./build/
cmake --build . --target install
# cmake --build .
