#!/bin/bash
cd $WORKSPACE
export DART_SDK=/Users/Shared/dart/dart-sdk
export PATH=$PATH:$DART_SDK/bin
pub install
dartdoc --no-show-private --link-api --pkg $WORKSPACE/packages/ $WORKSPACE/lib/*.dart
dartanalyzer $WORKSPACE/lib/*.dart $WORKSPACE/test/*.dart
dart $WORKSPACE/test/all_tests_junit.dart > $WORKSPACE/test.xml

