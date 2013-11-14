//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//
//

/**
 * Dart Phonetics
 *
 *
 * @author Edwin Bühler
 *
 */


library phonetics;

import 'package:logging/logging.dart';
import 'package:intl/intl.dart';

part 'src/cologne_phonetic.dart';
part 'src/soundex_phonetic.dart';


final Logger log =  new Logger('SoundexLogger')..level = Level.FINER;
final Logger logTest =  new Logger('SoundexLogger.Tests')..level = Level.ALL;


/**
 *
 *     main() {
 *       print(asColognePhonetic('Dart'));
 *       print(asSoundexPhonetic('Dart'));
 *     }
 *
 *     main() {
 *       print(phonetic('Dart', 'en'));
 *     }
 *
 */
String phonetic(String aString, String aLocale) {
  if (aString == null || aString.isEmpty) return '';
  var phonetic = '';
  var lang = Intl.shortLocale(aLocale);

  if (lang == 'de') {
    phonetic = asColognePhonetic(aString);
  }
  if (lang == 'en') {
    // TODO replace with metaphone. Soundex is currently only a placeholder.
    phonetic = asSoundexPhonetic(aString);
  }
  return phonetic;
}