//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//
//
part of phonetics;

const _translationDict = const  {
  'A' : '0',
  'E' : '0',
  'I' : '0',
  'O' : '0',
  'U' : '0',
  'Y' : '0',
  'B' : '1',
  'P' : '1',
  'F' : '1',
  'V' : '1',
  'C' : '2',
  'S' : '2',
  'K' : '2',
  'G' : '2',
  'J' : '2',
  'Q' : '2',
  'X' : '2',
  'Z' : '2',
  'D' : '3',
  'T' : '3',
  'L' : '4',
  'M' : '5',
  'N' : '5',
  'R' : '6'
};

/**
 * Calculates the "Soundex" code for the given string.
 * It's the phonetic code for the  English language.
 *
 *     main() {
 *       print(asSoundexPhonetic('Dart'));
 *     }
 */
String asSoundexPhonetic(String aString) {
  if (aString == null || aString.isEmpty) return '';
  var u = aString.toUpperCase();
  var p = u[0];
  var prevCode = _translationDict[u[0]];
  var t;
  List phoneticCodeList = new List.filled(4, 0);
  for (var i = 1; i < u.length; i++) {
    t = _translationDict[u[i]];
    if ((t != null) && ((t != '0') && (t != prevCode))) {
      p = p + t;
    }
    prevCode = t;
  }
  while (p.length < 4) {
    p = p + '0';
  }
  return p.substring(0,4);
}
