#!/usr/bin/env bash

BUILD_PATH="$(pwd)/build"
ICU_PATH="$(pwd)/icu/icu4c"

mkdir -p $BUILD_PATH/host && cd $BUILD_PATH/host
sh $ICU_PATH/source/configure --enable-static --disable-shared
