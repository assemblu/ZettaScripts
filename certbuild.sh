#!/bin/sh

platform=$(uname)

cd "`dirname $0`"
rm -rf ../cyclonedds-certified/build/
rm -rf ../cyclonedds-certified/install/
mkdir ../cyclonedds-certified/build/
cd ../cyclonedds-certified/

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=install -DCMAKE_PREFIX_PATH="/home/emir/dev/iceoryx/install" -DANALYZER=off -DSANITIZER=none -DENABLE_SSL=off -DENABLE_SECURITY=off -DENABLE_LIFESPAN=off -DENABLE_DEADLINE_MISSED=on -DENABLE_TYPE_DISCOVERY=on -DENABLE_TOPIC_DISCOVERY=off -DENABLE_COVERAGE=off -DENABLE_ICEORYX=on -DBUILD_TESTING=on -DBUILD_IDLC_TESTING=on -DBUILD_IDLC_XTESTS=on -DBUILD_EXAMPLES=on -DWERROR=off -DENABLE_IPV6=on -DZPMALLOC=on -DENABLE_SOURCE_SPECIFIC_MULTICAST=${ENABLE_SOURCE_SPECIFIC_MULTICAST:-on} -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -Bbuild

# cmake -DCMAKE_C_FLAGS="-Werror" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/home/emir/dev/cyclonedds-certified/install -DCMAKE_PREFIX_PATH=/home/emir/dev/iceoryx/install -DSANITIZER=address -DENABLE_SSL=off -DENABLE_SECURITY=off -DENABLE_LIFESPAN=off -DENABLE_DEADLINE_MISSED=on -DENABLE_TYPE_DISCOVERY=off -DENABLE_TOPIC_DISCOVERY=off -DENABLE_SHM=off -DBUILD_TESTING=on -DBUILD_IDLC_XTESTS=on -DBUILD_EXAMPLES=on -DZPMALLOC=off -DWERROR=off -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DENABLE_ICEORYX=on . -Bbuild

cd ./build/
cmake --build . --target install
echo "[build script] finished"
