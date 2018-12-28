#!/usr/bin/env bash

ICU_PATH="$(pwd)/icu"

mkdir -p build-host && cd build-host
sh $ICU_PATH/source/configure --enable-static --disable-shared
