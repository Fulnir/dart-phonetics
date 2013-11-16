//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//


library doublemetaphone_combinations_test.dart;
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

  logTest.info('English - Double Metaphone Combinations');


  // A lot of character combinations. Some crash ?
  group('English - Double Metaphone combinations:', () {
    var testchars = 'abcdefghijklmnopqrstuvwxyzüöäßñ€Ç -+*?!'; // 'üöäßñ€Ç' 'abcdefghijklmnopqrstuvwxyzüöäßñ€Ç'
    test('Combination $testchars', () {
      for (var a = 0; a < testchars.length; a++) {
        var phonetic = asDoubleMetaphonePhoneticList(testchars[a]);
        for (var b = 0; b < testchars.length; b++) {
          print('abc.. $a $b  - ${testchars[a]}${testchars[b]}}');
          var phonetic = asDoubleMetaphonePhoneticList(testchars[a] + testchars[b]);
          for (var c = 0; c < testchars.length; c++) {
            var phonetic = asDoubleMetaphonePhoneticList(testchars[a] + testchars[b] + testchars[c] );


            for (var d = 0; d < testchars.length; d++) {
              for (var e = 0; e < testchars.length; e++) {
                var teststring = testchars[a] + testchars[b] + testchars[c] + testchars[d] + testchars[e] ;
                var phonetic = asDoubleMetaphonePhonetic(teststring);
                /*
                for (var f = 0; f < testchars.length; f++) {
                  var teststring = testchars[a] + testchars[b] + testchars[c] + testchars[d] + testchars[e] + testchars[f] ;
                      //expect(phonetic is String, isTrue);
                  var phonetic = asDoubleMetaphonePhonetic('teststring');
                  //print('Combination $teststring double-metaphone $phonetic');
                }
                */
              }
            }


          }
        }
      }
      expect(true, isTrue);
    });
  });
}


