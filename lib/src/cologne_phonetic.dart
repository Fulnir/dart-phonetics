//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//
//
part of dart_phonetic;

/** ## Kölner Phonetik
 *
 * [de.wikipedia.org/wiki/Kölner_Phonetik](http://de.wikipedia.org/wiki/Kölner_Phonetik)
 *
 *
 */

const Map<String, int> _colognePhoneticTable = const  {
  'a' : '0',
  'ä' : '0',
  'e' : '0',
  'i' : '0',
  'j' : '0',
  'o' : '0',
  'ö' : '0',
  'u' : '0',
  'ü' : '0',
  'y' : '0',
  'b' : '1',
  'f' : '3',
  'v' : '3',
  'w' : '3',
  'g' : '4',
  'k' : '4',
  'q' : '4',
  'l' : '5',
  'm' : '6',
  'n' : '6',
  'r' : '7',
  's' : '8',
  'z' : '8'
};

/**
 * Calculates the "Cologne Phonetic" (Kölner Phonetik) code for the given string.
 * It's the phonetic code for the  German language.
 *
 *     main() {
 *       print(asColognePhonetic('Dart'));
 *     }
 */
String asColognePhonetic(String aString) {
  if (aString == null || aString.isEmpty) return '';
  var phoneticString = '';
  var trimmedPhoneticString = '';
  var code;
  var space = ' ';
  var previousCode  = space;

  for (var i = 0; i < aString.length; i++) {
    var each;
    var prevoius;
    var follower;
    each = aString[i].toLowerCase();

    // evtl i 1 höher da 0 indexed
    // (i > 1)
    if (i > 0) {
      // [i - 1]
      prevoius = aString[i - 1].toLowerCase();
    }
    // (i < aString.length)
    if (i < (aString.length - 1)) {
      follower = aString[i + 1].toLowerCase();
    }
    if (_colognePhoneticTable.containsKey(each)) {
      code = _colognePhoneticTable[each];
    } else {
      if (each == 'h') {
        code = space;
      }
      if (each == 'p') {
        if (follower == 'h') {
          code = '3';
        } else {
          code = '1';
        }
      }
      if (each == 'd') {
        if ((follower == 'c') || (follower == 's') || (follower == 'z') || (follower == 'ß')) {
          code = '8';
        } else {
          code = '2';
        }
      }
      if (each == 't') {
        if ((follower == 'c') || (follower == 's') || (follower == 'z') || (follower == 'ß')) {
          code = '8';
        } else {
          code = '2';
        }
      }
      if (each == 'c') {
        if ( i == 1) {
          if ((follower == 'a') || (follower == 'h') || (follower == 'k') || (follower == 'l')
              || (follower == 'o')  || (follower == 'q')   || (follower == 'r')  || (follower == 'u') || (follower == 'x')) {
            code = '4';
          } else {
            code = '8';
          }
        } else {
          if ((prevoius == 's') || (prevoius == 'z') || (prevoius == 'ß')) {
            if ((follower == 'a') || (follower == 'h') || (follower == 'k')
                || (follower == 'o')  || (follower == 'q') || (follower == 'u') || (follower == 'x')) {
              code = '8';
            } else {
              code = '4';
            }
          } else {
            code = '4';
          }
        }
      }
      if (each == 'x') {
        if ((prevoius == 'c') || (prevoius == 'k') || (prevoius == 'q')) {
          code = '8';
        } else {
          code = '48';
        }
      }

    }
    if (previousCode != code) {
      phoneticString = phoneticString + code;
    }
    previousCode = code;
  }
  for (var i = 0; i < phoneticString.length; i++) {
    var each = phoneticString[i];
    if (!((each == space) || (each == '0'))) {
      // "Umlaute ?"
      trimmedPhoneticString = trimmedPhoneticString + each;
    }
  }
  return trimmedPhoneticString;
}

