#!/bin/sh

platform=$(uname)

cd "`dirname $0`"
echo "Navigating to: $PWD"
rm -rf ../cyclonedds-certified/build/
rm -rf ../cyclonedds-certified/install/
mkdir ../cyclonedds-certified/build/
echo "Navigating to: $PWD"
cd ../cyclonedds-certified/
echi "-Bbuild\n"
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/emir/dev/cyclonedds-certified/install -DSANITIZER=none -DENABLE_SSL=off -DENABLE_SECURITY=off -DENABLE_LIFESPAN=off -DENABLE_DEADLINE_MISSED=on -DENABLE_TYPE_DISCOVERY=on -DENABLE_TOPIC_DISCOVERY=off -DENABLE_SHM=off -DBUILD_TESTING=on -DBUILD_IDLC_XTESTS=on -DBUILD_EXAMPLES=off -DZPMALLOC=off -DWERROR=on -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -Bbuild
cd ./build/
# echo "buildRelease\n"
# cmake --build . --config Release --target install
echo "cpptesttrace\n"
cpptesttrace --cpptesttraceOutputFile=/home/emir/dev/cyclonedds-certified/build/cyclonedds.bdf --cpptesttraceProjectName=cyclonedds 
echo "ctest\n"
ctest --timeout 60 --no-compress-output --output-on-failure -T test -E '^CUnit_ddsrt_random_default_random|whc_check_end_state$' -C Release
echo "[build script] finished"
