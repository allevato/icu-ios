#!/usr/bin/env bash

DEVELOPER="$(xcode-select --print-path)"
SDKROOT="$(xcodebuild -version -sdk iphoneos | grep -E '^Path' | sed 's/Path: //')"
ARCH="armv7s"

BUILD_PATH="$(pwd)/build"
ICU_PATH="$(pwd)/icu/icu4c"
ICU_FLAGS="-I$ICU_PATH/source/common/ -I$ICU_PATH/source/tools/tzcode/ "

export CXX="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++"
export CC="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"
export CFLAGS="-isysroot $SDKROOT -I$SDKROOT/usr/include/ -I./include/ -arch $ARCH -miphoneos-version-min=7.0 $ICU_FLAGS"
export CXXFLAGS="-stdlib=libc++ -std=c++11 -isysroot $SDKROOT -I$SDKROOT/usr/include/ -I./include/ -arch $ARCH -miphoneos-version-min=7.0 $ICU_FLAGS"
export LDFLAGS="-stdlib=libc++ -L$SDKROOT/usr/lib/ -isysroot $SDKROOT -Wl,-dead_strip -miphoneos-version-min=7.0 -lstdc++"

mkdir -p $BUILD_PATH/$ARCH && cd $BUILD_PATH/$ARCH

[ -e Makefile ] && make distclean

sh $ICU_PATH/source/configure \
    --host=arm-apple-darwin \
    --enable-static \
    --disable-shared \
    --disable-tools \
    --disable-tests \
    --disable-samples \
    --with-data-packaging=static \
    --with-cross-build=$BUILD_PATH/host
