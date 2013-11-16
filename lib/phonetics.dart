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
part 'src/doublemetaphone_phonetic.dart';

final Logger log =  new Logger('SoundexLogger')..level = Level.FINER;
final Logger logTest =  new Logger('SoundexLogger.Tests')..level = Level.ALL;


/**
 *
 *     main() {
 *       print(asColognePhonetic('Dart'));
 *       print(asSoundexPhonetic('Dart'));
 *       print(asDoubleMetaphonePhonetic('Dart'));
 *     }
 *
 *     main() {
 *       print(phonetic('Dart', 'en'));
 *       print(phonetic('Dart', 'de'));
 *       print(phonetic('Dart', 'en', mode:'soundex'));
 *       print(phonetic('Dart', 'en', mode:'doublemetaphone'));
 *     }
 *
 */
String phonetic(String aString, String aLocale, {String  mode}) {
  if (aString == null || aString.isEmpty) return '';
  var phonetic = '';
  var lang = Intl.shortLocale(aLocale);

  switch (lang) {
    case 'en':
      if (mode == 'soundex') {
        phonetic = asSoundexPhonetic(aString);
      } else if (mode == 'doublemetaphone') {
        phonetic = asDoubleMetaphonePhonetic(aString);
      } else {
        phonetic = asDoubleMetaphonePhonetic(aString);
      }
      break;
    case 'de':
      phonetic = asColognePhonetic(aString);
      break;
    default:
      if (mode == 'soundex') {
        phonetic = asSoundexPhonetic(aString);
      } else if (mode == 'doublemetaphone') {
        phonetic = asDoubleMetaphonePhonetic(aString);
      } else {
        phonetic = asDoubleMetaphonePhonetic(aString);
      }
  }

  return phonetic;
}