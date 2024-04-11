#!/bin/sh

platform=$(uname)

cd "`dirname $0`"
echo "Navigating to: $PWD"
rm -rf ../cyclonedds-certified/build/
rm -rf ../cyclonedds-certified/install/
mkdir ../cyclonedds-certified/build/
echo "Navigating to: $PWD"
cd ../cyclonedds-certified/
echo "-Bbuild\n"

cmake -DCMAKE_C_FLAGS="-Werror" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/emir/dev/cyclonedds-certified/install -DCMAKE_PREFIX_PATH=/home/emir/dev/iceoryx/install -DSANITIZER=address -DENABLE_SSL=off -DENABLE_SECURITY=off -DENABLE_LIFESPAN=off -DENABLE_DEADLINE_MISSED=on -DENABLE_TYPE_DISCOVERY=off -DENABLE_TOPIC_DISCOVERY=off -DENABLE_SHM=off -DBUILD_TESTING=on -DBUILD_IDLC_XTESTS=on -DBUILD_EXAMPLES=on -DZPMALLOC=off -DWERROR=off -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DENABLE_ICEORYX=on . -Bbuild
# cmake -DCMAKE_C_FLAGS="-w" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/home/emir/dev/cyclonedds-certified/install -DCMAKE_PREFIX_PATH=/home/emir/dev/iceoryx/build -DSANITIZER=off -DENABLE_SSL=off -DENABLE_SECURITY=off -DENABLE_LIFESPAN=off -DENABLE_DEADLINE_MISSED=on -DENABLE_TYPE_DISCOVERY=off -DENABLE_TOPIC_DISCOVERY=off -DENABLE_SHM=off -DBUILD_TESTING=on -DBUILD_IDLC_XTESTS=on -DBUILD_EXAMPLES=on -DZPMALLOC=off -DWERROR=on -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DENABLE_ICEORYX=on . -Bbuild

cd ./build/
# echo "buildRelease\n"
cmake --build . --config Debug --target install -j 1
# echo "cpptesttrace\n"
# cpptesttrace --cpptesttraceOutputFile=/home/emir/dev/cyclonedds-certified/build/cyclonedds.bdf --cpptesttraceProjectName=cyclonedds 


# echo "RUNNING CTEST\n"
# ctest --timeout 60 --no-compress-output --output-on-failure -T test -C Debug
echo "[build script] finished"
