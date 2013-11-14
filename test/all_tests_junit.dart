//
// Original file "all_tests_junit" is Copyright (c) 2013, Lukas Renggli
//
//
// Start tests for JUnit (Jenkins-CI).

library all_tests_junit;

import 'package:junitconfiguration/junitconfiguration.dart';
import 'all_tests.dart' as all_tests;

void main() {
  all_tests.useJUnit = true;
  JUnitConfiguration.install();
  all_tests.main();
}