//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

library colognephonetic_test.dart;
import '../lib/phonetics.dart';
import 'package:unittest/unittest.dart';
import 'package:logging/logging.dart';

bool useJUnit = false;

main() {
  hierarchicalLoggingEnabled = true;
// Only XML for Jenkins.
  if ( useJUnit) {
    logTest..level = Level.OFF;
    log..level = Level.OFF;
  }

  logTest.info('German - Kölner Phonetik');

  group('German - Kölner Phonetik:', () {
    test('Dart = 272', () => expect(asColognePhonetic('Dart'), equals('272')));
    test('Guss = 48', () => expect(asColognePhonetic('Guss'), equals('48')));
    test('Kuss = 48', () => expect(asColognePhonetic('Kuss'), equals('48')));
    test('Ding = 264', () => expect(asColognePhonetic('Ding'), equals('264')));
    test('Dink = 264', () => expect(asColognePhonetic('Dink'), equals('264')));
    test('Edwin Bühler = 236157', () => expect(asColognePhonetic('Edwin Bühler'), equals('236157')));
    test('Bühler = 157', () => expect(asColognePhonetic('Bühler'), equals('157')));
    test('Buhler = 157', () => expect(asColognePhonetic('Buhler'), equals('157')));
    test('Buehler = 157', () => expect(asColognePhonetic('Buehler'), equals('157')));
    test('Breschnew = 17863', () => expect(asColognePhonetic('Breschnew'), equals('17863')));
    test('Müller-Lüdenscheidt = 65752682', () => expect(asColognePhonetic('Müller-Lüdenscheidt'), equals('65752682')));
    test('Müller = 657', () => expect(asColognePhonetic('Müller'), equals('657')));
    test('Nuelr = 657', () => expect(asColognePhonetic('Nuelr'), equals('657')));
  });
}