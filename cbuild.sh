#!/bin/sh

platform=$(uname)

cd "`dirname $0`"
echo "Navigating to: $PWD"
mkdir ../cyclonedds-certified/build/
echo "Navigating to: $PWD"
cd ../cyclonedds-certified/
echo "Erasing previous build content"
rm -rf *
echo "Erasing previous install content"
rm -rf ../install
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/emir/dev/cyclonedds-certified/install -DSANITIZER=none -DENABLE_SSL=off -DENABLE_SECURITY=off -DENABLE_LIFESPAN=off -DENABLE_DEADLINE_MISSED=on -DENABLE_TYPE_DISCOVERY=on -DENABLE_TOPIC_DISCOVERY=off -DENABLE_SHM=on -DBUILD_TESTING=off -DBUILD_IDLC_XTESTS=off -DBUILD_EXAMPLES=off -DZPMALLOC=off -DWERROR=on -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -Bbuild
wait
cpptesttrace --cpptesttraceOutputFile=/home/splinter1984/work/cyclonedds-certified/build/cyclonedds.bdf --cpptesttraceProjectName=cyclonedds cmake --build . --config Release --target install
wait
echo "[build script] finished"
