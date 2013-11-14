//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

library soundex_phonetic_test.dart;
import '../lib/dart_phonetic.dart';
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

  logTest.info('General Library');
  group('General Library:', () {
    setUp((){
    });
    tearDown((){
    });
    test('German Dart = 272', () => expect(phonetic('Dart', 'de'), equals('272')));
  });

  logTest.info('English - Soundex');

  group('English - Soundex:', () {
    test('Dart = D630', () => expect(asSoundexPhonetic('Dart'), equals('D630')));
    test('Edwin Bühler = E351', () => expect(asSoundexPhonetic('Edwin Bühler'), equals('E351')));
    test('Britney = B635', () => expect(asSoundexPhonetic('Britney'), equals('B635')));
    test('Spears = S162', () => expect(asSoundexPhonetic('Spears'), equals('S162')));
    test('Smith = S530', () => expect(asSoundexPhonetic('Smith'), equals('S530')));
    test('Superzicke = S162', () => expect(asSoundexPhonetic('Superzicke'), equals('S162')));
    test('New York = N620', () => expect(asSoundexPhonetic('New York'), equals('N620')));
    test('Cupertino = C163', () => expect(asSoundexPhonetic('Cupertino'), equals('C163')));
    test('Tokyo = T200', () => expect(asSoundexPhonetic('Tokyo'), equals('T200')));
    test('München = M525', () => expect(asSoundexPhonetic('München'), equals('M525')));
    test('Zürich = Z620', () => expect(asSoundexPhonetic('Zürich'), equals('Z620')));
    test('Luzern = L265', () => expect(asSoundexPhonetic('Luzern'), equals('L265')));
    test('Pharo = P600', () => expect(asSoundexPhonetic('Pharo'), equals('P600')));
    test('Smalltalk = S543', () => expect(asSoundexPhonetic('Smalltalk'), equals('S543')));
  });
}