//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

library all_tests;

import 'package:logging/logging.dart';
import 'soundex_phonetic_test.dart' as soundex;
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
    cologne.useJUnit = true;
  }
  soundex.main();
  cologne.main();
}