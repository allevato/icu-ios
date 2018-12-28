#!/usr/bin/env bash

BUILD_PATH="$(pwd)/build"
OUTPUT_PATH=$BUILD_PATH/universal

mkdir -p "$OUTPUT_PATH"

lipo -create -output "$OUTPUT_PATH/libicudata.a" "build/host/lib/libicudata.a"
lipo -create -output "$OUTPUT_PATH/libicutu.a" "build/host/lib/libicutu.a"

lipo -create -output "$OUTPUT_PATH/libicui18n.a" "build/arm64/lib/libicui18n.a" "build/armv7s/lib/libicui18n.a" "build/armv7/lib/libicui18n.a" "build/x86_64/lib/libicui18n.a"
lipo -create -output "$OUTPUT_PATH/libicuio.a" "build/arm64/lib/libicuio.a" "build/armv7s/lib/libicuio.a" "build/armv7/lib/libicuio.a" "build/x86_64/lib/libicuio.a"
lipo -create -output "$OUTPUT_PATH/libicuuc.a" "build/arm64/lib/libicuuc.a" "build/armv7s/lib/libicuuc.a" "build/armv7/lib/libicuuc.a" "build/x86_64/lib/libicuuc.a"
