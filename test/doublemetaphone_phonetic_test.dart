//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//
// Tests from:
// http://svn.apache.org/repos/asf/commons/proper/codec/tags/CODEC_1_3_RC1/src/test/org/apache/commons/codec/language/DoubleMetaphoneTest.java
//

library doublemetaphone_phonetic_test.dart;
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

  logTest.info('English - Double Metaphone');

  group('English - Double Metaphone Basics:', () {
    test('empty string', () => expect(asDoubleMetaphonePhonetic(''), equals('')));
    test('isSlavoGermanic EDWIN NO', () => expect(Slavo_Germanic('EDWIN'), isFalse));
    test('isSlavoGermanic SMITH NO', () => expect(Slavo_Germanic('SMITH'), isFalse));
    test('isSlavoGermanic LOBWOWITZ YES', () => expect(Slavo_Germanic('LOBWOWITZ'), isTrue));
    test('isSlavoGermanic CZECH YES', () => expect(Slavo_Germanic('CZECH'), isTrue));
    test('isSlavoGermanic DABROWKA YES', () => expect(Slavo_Germanic('DABROWKA'), isTrue));

    test('a = A', () => expect(asDoubleMetaphonePhonetic('a'), equals('A')));
    test('e = A', () => expect(asDoubleMetaphonePhonetic('e'), equals('A')));
    test('i = A', () => expect(asDoubleMetaphonePhonetic('i'), equals('A')));
    test('o = A', () => expect(asDoubleMetaphonePhonetic('o'), equals('A')));
    test('u = A', () => expect(asDoubleMetaphonePhonetic('u'), equals('A')));
    test('b = P', () => expect(asDoubleMetaphonePhonetic('b'), equals('P')));
    test('ey = A', () => expect(asDoubleMetaphonePhonetic('ey'), equals('A')));
    test('eb = AP', () => expect(asDoubleMetaphonePhonetic('eb'), equals('AP')));
    test('Ç = S', () => expect(asDoubleMetaphonePhonetic('Ç'), equals('S')));

    test('aax = AKS', () => expect(asDoubleMetaphonePhonetic('aax'), equals('AKS')));
    test('Bresch = PRX', () => expect(asDoubleMetaphonePhonetic('Bresch'), equals('PRX')));

    test('x = S', () => expect(asDoubleMetaphonePhonetic('x'), equals('S')));
    test('xx = SKS', () => expect(asDoubleMetaphonePhonetic('xx'), equals('SKS')));
    test('xxx = SKS', () => expect(asDoubleMetaphonePhonetic('xxx'), equals('SKS')));
    test('xc = SK', () => expect(asDoubleMetaphonePhonetic('xc'), equals('SK')));
  });

  group('English - Double Metaphone Words:', () {
    test('Dart = TRT', () => expect(asDoubleMetaphonePhonetic('Dart'), equals('TRT')));
    test('school = SKL', () => expect(asDoubleMetaphonePhonetic('school'), equals('SKL')));
    test('Edwin Bühler = ATNP', () => expect(asDoubleMetaphonePhonetic('Edwin Bühler'), equals('ATNP')));
    test('Breschnew = PRXN', () => expect(asDoubleMetaphonePhonetic('Breschnew'), equals('PRXN')));
    test('Müller-Lüdenscheidt = MLRL', () => expect(asDoubleMetaphonePhonetic('Müller-Lüdenscheidt'), equals('MLRL')));
    test('This is the Basic thing = 0SS0-TSST', () => expect(asDoubleMetaphonePhonetic('This is the Basic thing'), equals('0SS0-TSST')));

  });

  group('Metaphone doubleMetaphoneFuzzyCompare:', () {
    test('Smith =  Schmidt // true', () => expect(doubleMetaphoneNormalCompare('Smith', 'Schmidt'), isTrue));
    test('Smith =  Schmitz // false', () => expect(doubleMetaphoneNormalCompare('Smith', 'Schmitz'), isFalse));
  });

  group('English - Metaphone White:', () {
    var words = [ "Wade", "Wait", "Waite", "Wat", "Whit", "Wiatt", "Wit", "Wittie"
                  , "Witty", "Wood",  "Woodie", "Woody" ];
    words.forEach((each) {
      test('White with $each',
          () => expect(doubleMetaphoneFuzzyCompare('Wade', each), isTrue));
    });
  });


  group('English - Metaphone Gary:', () {
    var words = ["Cahra", "Cara", "Carey", "Cari", "Caria", "Carie", "Caro", "Carree",
              "Carri", "Carrie", "Carry", "Cary", "Cora", "Corey", "Cori", "Corie", "Correy",
              "Corri", "Corrie", "Corry", "Cory", "Gray", "Kara", "Kare", "Karee",  "Kari",
              "Karia", "Karie", "Karrah", "Karrie", "Karry", "Kary", "Keri", "Kerri", "Kerrie",
              "Kerry", "Kira", "Kiri", "Kora", "Kore", "Kori", "Korie", "Korrie", "Korry" ];
    words.forEach((each) {
      test('Gary with $each',
          () => expect(doubleMetaphoneFuzzyCompare('Gary', each), isTrue));
    });
  });
group('English - Metaphone John:', () {
  var words = ["Gena", "Gene", "Genia", "Genna", "Genni", "Gennie", "Genny", "Giana", "Gianna",
            "Gina", "Ginni", "Ginnie", "Ginny", "Jaine", "Jan", "Jana", "Jane", "Janey", "Jania",
            "Janie", "Janna", "Jany", "Jayne", "Jean", "Jeana", "Jeane", "Jeanie", "Jeanna",
            "Jeanne", "Jeannie", "Jen", "Jena", "Jeni", "Jenn", "Jenna", "Jennee", "Jenni",
            "Jennie", "Jenny", "Jinny", "Jo Ann", "Jo-Ann", "Jo-Anne", "Joan", "Joana", "Joane",
            "Joanie", "Joann", "Joanna", "Joanne", "Joeann", "Johna", "Johnna", "Joni", "Jonie",
            "Juana", "June", "Junia", "Junie"];
  words.forEach((each) {
    test('John with $each',
        () => expect(doubleMetaphoneFuzzyCompare('John', each), isTrue));
  });
});

group('English - Metaphone Knight:', () {
  var words = ["Hynda", "Nada", "Nadia", "Nady", "Nat", "Nata", "Natty", "Neda", "Nedda", "Nedi",
            "Netta", "Netti", "Nettie", "Netty", "Nita", "Nydia"];
  words.forEach((each) {
    test('Knight with $each',
        () => expect(doubleMetaphoneFuzzyCompare('Knight', each), isTrue));
  });
});


group('English - Metaphone Mary:', () {
  var words = [ "Mair", "Maire", "Mara", "Mareah", "Mari", "Maria", "Marie", "Mary", "Maura", "Maure",
            "Meara", "Merrie", "Merry", "Mira", "Moira", "Mora", "Moria", "Moyra", "Muire", "Myra", "Myrah" ];
  words.forEach((each) {
    test('Mary with $each',
        () => expect(doubleMetaphoneFuzzyCompare('Mary', each), isTrue));
  });
});


group('English - Metaphone Susan:', () {
  var words = [ "Siusan", "Sosanna", "Susan", "Susana", "Susann", "Susanna", "Susannah",
           "Susanne", "Suzann", "Suzanna", "Suzanne", "Zuzana" ];
  words.forEach((each) {
    test('Susan with $each',
        () => expect(doubleMetaphoneFuzzyCompare('Susan', each), isTrue));
  });
});

}


