#!/bin/sh

rm -rf Docs
mkdir -p Docs

xcodebuild docbuild \
    -scheme WebViewKit \
    -destination generic/platform=iOS \

echo "Copying documentation archive..."

find ~/Library/Developer/Xcode/DerivedData \
    -name "WebViewKit.doccarchive" \
    -exec cp -R {} Docs \;

cd Docs

echo "Compressing documentation archive..."

zip -r \
    WebViewKit.doccarchive.zip \
    WebViewKit.doccarchive

rm -rf WebViewKit.doccarchive

cd ..
