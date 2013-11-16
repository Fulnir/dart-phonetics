//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

library all_tests;

import 'package:logging/logging.dart';
import 'soundex_phonetic_test.dart' as soundex;
import 'doublemetaphone_phonetic_test.dart' as doublemetaphone;
import 'doublemetaphone_apachewords_tests.dart' as doublemetaphoneapache;
import 'cologne_phonetic_test.dart' as cologne;


final  logTest =  new Logger('Soundex.Tests')..level = Level.OFF;

// For Jenkins https://github.com/renggli/JUnitConfigurationDart
bool useJUnit = false;

main(){
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen((LogRecord r) {
    print( '${r.time.toString()} ${r.loggerName}(${r.level}): ${r.message}');
  });
  if ( useJUnit) {
    logTest..level = Level.OFF;
  }
  if (useJUnit) {
    soundex.useJUnit = true;
    doublemetaphone.useJUnit = true;
    doublemetaphoneapache.useJUnit = true;
    cologne.useJUnit = true;
  }
  soundex.main();
  doublemetaphone.main();
  doublemetaphoneapache.main();
  cologne.main();
}