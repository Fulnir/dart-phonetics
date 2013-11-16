//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//
// Some parts based on M. Peters js code
// https://github.com/maritz/js-double-metaphone
//
// This Implementation is based on the algorithm by Lawrence Philips
//
// inputKey Article http://drdobbs.com/184401251?pgno=2
// http://en.wikipedia.org/wiki/Metaphone
//

part of phonetics;

const List<String> vowels = const ['A', 'E', 'I', 'O', 'U'];
//final isVowel = (String aString) => vowels.contains(aString);
final isVowel = (String aString, int pos) => vowels.contains(aString.substring(pos, (pos + 1)));
final Slavo_Germanic = (String aString) {
  return (aString.contains('WK')) || (aString.indexOf('CZ', 0) >= 0) || (aString.indexOf('WITZ', 0) >= 0);
};
final  string_at = (string, start, length, list) {
    if ((start < 0) || (start >= string.length)) {
      return false;
    }
    //if (string.length >= (start + length)) {
      for (var i=0, len = list.length; i < len; i++) {
        if (list[i] == string.substring(start, (start + length))) {
          return true;
        }
      }
    //}
    return false;
  };

/**
 * Calculates the "Double Metaphone" code for the given string.
 * It's the phonetic code for the  English language.
 *
 *     main() {
 *       print(asDoubleMetaphonePhonetic('Dart')); // Returns 'TRT'
 *     }
 *
 * Returns the "Double Metaphone" elements primary and secondary as List.
 *
 * asMetaphonePhonetic('Dart'); // Returns ['TRT', 'TRT']
 * asMetaphonePhonetic('This is the Basic thing'); // Returns ['0SS0', 'TSST']
 */
List<String> asDoubleMetaphonePhoneticList(String aString) {
  if (aString == null || aString.isEmpty) return ['',''];
  var startIndex =  0, skipCount = 0,  current =  0;
  var length   = aString.length;
  var last     = length - 1;
  var primary = '', secondary = '';
  var inputKey =  aString.toUpperCase() + "     ";
  var addPrimaryTranslation = (String tailString) => primary = primary + tailString;
  var addSecondaryTranslation = (String tailString) => secondary = secondary + tailString;

  if(inputKey.length > 1) {
    if (['GN', 'KN', 'PN', 'WR', 'PS'].contains(inputKey.substring(0, 2))) {
      current++;
    }
  }

  while ((primary.length < 4) || (secondary.length < 4)) {
    if (current >= aString.length) {
      break;
    }
    switch (inputKey.substring(current, (current + 1))) {
      case 'A':
      case 'E':
      case 'I':
      case 'O':
      case 'U':
      case 'Y':
        if (current == 0) {
          addPrimaryTranslation('A');
          addSecondaryTranslation('A');
        }
        current += 1;
        break;
      case 'B':
        addPrimaryTranslation('P');
        addSecondaryTranslation('P');
        if (inputKey.substring(current + 1, current + 2) == 'B')
          current += 2;
        else
          current += 1;
        break;
      case 'Ç':
        addPrimaryTranslation('S');
        addSecondaryTranslation('S');
        current += 1;
        break;
      case 'C':
          // various gremanic
          if ((current > 1)
              && !isVowel(inputKey, current - 2)
              && string_at(inputKey, current - 1, 3,
                        ["ACH"])
              && ((inputKey.substring(current + 2, current + 3) != 'I')
                  && ((inputKey.substring(current + 2, current + 3) != 'E')
                      || string_at(inputKey, current - 2, 6,
                                ["BACHER", "MACHER"])))) {

            addPrimaryTranslation('K');
            addSecondaryTranslation('K');
            current += 2;
            break;
          }
          //  'caesar'
          if ((current == 0)
              && string_at(inputKey, current, 6,
                         ["CAESAR"])) {
            addPrimaryTranslation('S');
            addSecondaryTranslation('S');
            current += 2;
            break;
          }
          // 'chianti'
          if (string_at(inputKey, current, 4,
                         ["CHIA"])) {
            addPrimaryTranslation('K');
            addSecondaryTranslation('K');
            current += 2;
            break;
          }

          if (string_at(inputKey, current, 2,
                         ["CH"])) {

            // find 'michael'
            if ((current > 0)
                && string_at(inputKey, current, 4,
                         ["CHAE"])) {
              addPrimaryTranslation('K');
              addSecondaryTranslation('X');
              current += 2;
              break;
            }

            // greek roots e.g. 'chemistry', 'chorus'
            if ((current == 0)
                && (string_at(inputKey, current + 1, 5,
                         ["HARAC", "HARIS"])
                    || string_at(inputKey, current + 1, 3,
                              ["HOR", "HYM", "HIA", "HEM"]))
                && !string_at(inputKey, 0, 5, ["CHORE"])) {
              addPrimaryTranslation('K');
              addSecondaryTranslation('K');
              current += 2;
              break;
            }

            // germanic, greek, or otherwise 'ch' for 'kh' sound
            if ((string_at(inputKey, 0, 4, ["VAN ", "VON "])
                 || string_at(inputKey, 0, 3, ["SCH"]))
                // 'architect' but not 'arch', orchestra', 'orchid'
                || string_at(inputKey, current - 2, 6,
                         ["ORCHES", "ARCHIT", "ORCHID"])
                || string_at(inputKey, current + 2, 1,
                         ["T", "S"])
                || ((string_at(inputKey, current - 1, 1,
                         ["A","O","U","E"])
                     || (current == 0))
                    // e.g. 'wachtler', 'weschsler', but not 'tichner'
                    && string_at(inputKey, current + 2, 1,
                         ["L","R","N","M","B","H","F","V","W"," "]))) {
              addPrimaryTranslation('K');
              addSecondaryTranslation('K');
            } else {
              if (current > 0) {
                if (string_at(inputKey, 0, 2, ["MC"])) {
                  // e.g. 'McHugh'
                  addPrimaryTranslation('K');
                  addSecondaryTranslation('K');
                } else {
                  addPrimaryTranslation('X');
                  addSecondaryTranslation('K');
                }
              } else {
                addPrimaryTranslation('X');
                addSecondaryTranslation('X');
              }
            }
            current += 2;
            break;
          }

          // e.g. 'czerny'
          if (string_at(inputKey, current, 2, ["CZ"])
              && !string_at(inputKey, current -2, 4,
                         ["WICZ"])) {
            addPrimaryTranslation('S');
            addSecondaryTranslation('X');
            current += 2;
            break;
          }

          // e.g. 'focaccia'
          if (string_at(inputKey, current + 1, 3,
                     ["CIA"])) {
            addPrimaryTranslation('X');
            addSecondaryTranslation('X');
            current += 3;
            break;
          }

          // double 'C', but not McClellan'
          if (string_at(inputKey, current, 2, ["CC"])
              && !((current == 1)
                   && (inputKey.substring(0, 1) == 'M'))) {
            // 'bellocchio' but not 'bacchus'
            if (string_at(inputKey, current + 2, 1,
                       ["I","E","H"])
                && !string_at(inputKey, current + 2, 2,
                          ["HU"])) {
              // 'accident', 'accede', 'succeed'
              if (((current == 1)
                   && (inputKey.substring(current - 1, current) == 'A'))
                  || string_at(inputKey, current - 1, 5,
                            ["UCCEE", "UCCES"])) {
                primary   += "KS";
                addSecondaryTranslation('KS');
                // 'bacci', 'bertucci', other italian
              } else {
                primary   += "X";
                addSecondaryTranslation('X');
              }
              current += 3;
              break;
            } else {
              // Pierce's rule
              addPrimaryTranslation("K");
              addSecondaryTranslation('K');
              current += 2;
              break;
            }
          }

          if (string_at(inputKey, current, 2,
                     ["CK","CG","CQ"])) {
            addPrimaryTranslation("K");
            addSecondaryTranslation('K');
            current += 2;
            break;
          }

          if (string_at(inputKey, current, 2,
                     ["CI","CE","CY"])) {
            // italian vs. english
            if (string_at(inputKey, current, 3,
                       ["CIO","CIE","CIA"])) {
              addPrimaryTranslation("S");
              addSecondaryTranslation('X');
            } else {
              primary   += "S";
              addSecondaryTranslation('S');
            }
            current += 2;
            break;
          }

          // else
          addPrimaryTranslation("K");
          addSecondaryTranslation('K');

          // name sent in 'mac caffrey', 'mac gregor'
          if (string_at(inputKey, current + 1, 2,
                     [" C"," Q"," G"])) {
            current += 3;
          } else {
            if (string_at(inputKey, current + 1, 1,
                       ["C","K","Q"])
                && !string_at(inputKey, current + 1, 2,
                           ["CE","CI"])) {
              current += 2;
            } else {
              current += 1;
            }
          }
          break;

      case 'D':
        if (string_at(inputKey, current, 2,
            ["DG"])) {
          if (string_at(inputKey, current + 2, 1,
              ["I","E","Y"])) {
            // e.g. 'edge'
            addPrimaryTranslation("J");
            addSecondaryTranslation('J');
            current += 3;
            break;
          } else {
            // e.g. 'edgar'
            addPrimaryTranslation("TK");
            addSecondaryTranslation("TK");
            current += 2;
            break;
          }
        }

        if (string_at(inputKey, current, 2,
            ["DT","DD"])) {
          addPrimaryTranslation("T");
          addSecondaryTranslation('T');
          current += 2;
          break;
        }

        // else
        addPrimaryTranslation("T");
        addSecondaryTranslation('T');
        current += 1;
        break;

      case 'F':
        if (inputKey.substring(current + 1, current + 2) == 'F')
          current += 2;
        else
          current += 1;
        addPrimaryTranslation("F");
        addSecondaryTranslation('F');
        break;

      case 'G':
        if (inputKey.substring(current + 1, current + 2) == 'H') {
          if ((current > 0)
              && !isVowel(inputKey, current - 1)) {
            addPrimaryTranslation("K");
            addSecondaryTranslation('K');
            current += 2;
            break;
          }

          if (current < 3) {
            // 'ghislane', 'ghiradelli'
            if (current == 0) {
              if (inputKey.substring(current + 2, current + 3) == 'I') {
                primary   += "J";
                addSecondaryTranslation('J');
              } else {
                addPrimaryTranslation("K");
                addSecondaryTranslation('K');
              }
              current += 2;
              break;
            }
          }

          // Parker's rule (with some further refinements) - e.g. 'hugh'
          if (((current > 1)
              && string_at(inputKey, current - 2, 1,
                  ["B","H","D"]))
                  // e.g. 'bough'
                  || ((current > 2)
                      &&  string_at(inputKey, current - 3, 1,
                          ["B","H","D"]))
                          // e.g. 'broughton'
                          || ((current > 3)
                              && string_at(inputKey, current - 4, 1,
                                  ["B","H"]))) {
            current += 2;
            break;
          } else {
            // e.g. 'laugh', 'McLaughlin', 'cough', 'gough', 'rough', 'tough'
            if ((current > 2)
                && (inputKey.substring(current - 1, current) == 'U')
                && string_at(inputKey, current - 3, 1,
                    ["C","G","L","R","T"])) {
              addPrimaryTranslation("F");
              addSecondaryTranslation('F');
            } else if ( (current > 0) && inputKey.substring(current - 1, current) != 'I') {
              addPrimaryTranslation("K");
              addSecondaryTranslation('K');
            }
            current += 2;
            break;
          }
        }

        if (inputKey.substring(current + 1, current + 2) == 'N') {
          if ((current == 1) && isVowel(inputKey, 0)
              && !Slavo_Germanic(inputKey)) {
            primary   += "KN";
            secondary += "N";
          } else {
            // not e.g. 'cagney'
            if (!string_at(inputKey, current + 2, 2,
                ["EY"])
                && (inputKey.substring(current + 1, current + 2) != "Y")
                && !Slavo_Germanic(inputKey)) {
              addPrimaryTranslation("N");
              addSecondaryTranslation("KN");
            } else {
              addPrimaryTranslation("KN");
              addSecondaryTranslation("KN");
            }
          }
          current += 2;
          break;
        }

        // 'tagliaro'
        if (string_at(inputKey, current + 1, 2,
            ["LI"])
            && !Slavo_Germanic(inputKey)) {
          addPrimaryTranslation("KL");
          addSecondaryTranslation('L');
          current += 2;
          break;
        }

        // -ges-, -gep-, -gel- at beginning
        if ((current == 0)
            && ((inputKey.substring(current + 1, current + 2) == 'Y')
                || string_at(inputKey, current + 1, 2,
                    ["ES","EP","EB","EL","EY","IB","IL","IN","IE",
                     "EI","ER"]))) {
          addPrimaryTranslation("K");
          addSecondaryTranslation('J');
          current += 2;
          break;
        }

        // -ger-, -gy-
        if ((string_at(inputKey, current + 1, 2,
            ["ER"])
            || (inputKey.substring(current + 1, current + 2) == 'Y'))
            && !string_at(inputKey, 0, 6,
                ["DANGER","RANGER","MANGER"])
                && !string_at(inputKey, current -1, 1,
                    ["E", "I"])
                    && !string_at(inputKey, current -1, 3,
                        ["RGY","OGY"])) {
          addPrimaryTranslation("K");
          addSecondaryTranslation('J');
          current += 2;
          break;
        }

        // italian e.g. 'biaggi'
        if (string_at(inputKey, current + 1, 1,
            ["E","I","Y"])
            || string_at(inputKey, current -1, 4,
                ["AGGI","OGGI"])) {
          // obvious germanic
          if ((string_at(inputKey, 0, 4, ["VAN ", "VON "])
              || string_at(inputKey, 0, 3, ["SCH"]))
              || string_at(inputKey, current + 1, 2,
                  ["ET"])) {
            addPrimaryTranslation("K");
            addSecondaryTranslation('K');
          } else {
            // always soft if french ending
            if (string_at(inputKey, current + 1, 4,
                ["IER "])) {
              addPrimaryTranslation("J");
              addSecondaryTranslation('J');
            } else {
              addPrimaryTranslation("J");
              addSecondaryTranslation('K');
            }
          }
          current += 2;
          break;
        }

        if (inputKey.substring(current + 1, current + 2) == 'G')
          current += 2;
        else
          current += 1;

        addPrimaryTranslation('K');
        addSecondaryTranslation('K');
        break;

      case 'H':
        // only keep if first & before vowel or btw. 2 vowels
        if (((current == 0) ||
            isVowel(inputKey, current - 1))
            && isVowel(inputKey, current + 1)) {
          addPrimaryTranslation('H');
          addSecondaryTranslation('H');
          current += 2;
        } else
          current += 1;
        break;

      case 'J':
        // obvious spanish, 'jose', 'san jacinto'
        if (string_at(inputKey, current, 4,
            ["JOSE"])
            || string_at(inputKey, 0, 4, ["SAN "])) {
          if (((current == 0)
              && (inputKey.substring(current + 4, current + 5) == ' '))
              || string_at(inputKey, 0, 4, ["SAN "])) {
            addPrimaryTranslation('H');
            addSecondaryTranslation('H');
          } else {
            addPrimaryTranslation('J');
            addSecondaryTranslation('H');
          }
          current += 1;
          break;
        }

        if ((current == 0)
            && !string_at(inputKey, current, 4,
                ["JOSE"])) {
          addPrimaryTranslation('J');  // Yankelovich/Jankelowicz
          addSecondaryTranslation('A');
        } else {
          // spanish pron. of .e.g. 'bajador'
          if (isVowel(inputKey, current - 1)
              && !Slavo_Germanic(inputKey)
              && ((inputKey.substring(current + 1, current + 2) == 'A')
                  || (inputKey.substring(current + 1, current + 2) == 'O'))) {
            addPrimaryTranslation('J');
            addSecondaryTranslation('H');
          } else {
            if (current == last) {
              addPrimaryTranslation('J');
              addSecondaryTranslation('');
            } else {
              if (!string_at(inputKey, current + 1, 1,
                  ["L","T","K","S","N","M","B","Z"])
                  && !string_at(inputKey, current - 1, 1,
                      ["S","K","L"])) {
                addPrimaryTranslation('J');
                addSecondaryTranslation('J');
              }
            }
          }
        }

        if (inputKey.substring(current + 1, current + 2) == 'J') // it could happen
          current += 2;
        else
          current += 1;
        break;

      case 'K':
        if (inputKey.substring(current + 1, current + 2) == 'K')
          current += 2;
        else
          current += 1;
        addPrimaryTranslation('K');
        addSecondaryTranslation('K');
        break;

      case 'L':
        if (inputKey.substring(current + 1, current + 2) == 'L') {
          // spanish e.g. 'cabrillo', 'gallegos'
          if (((current == (length - 3))
              && string_at(inputKey, current - 1, 4,
                  ["ILLO","ILLA","ALLE"]))
                  || ((string_at(inputKey, last-1, 2,
                      ["AS","OS"])
                      || string_at(inputKey, last, 1,
                          ["A","O"]))
                          && string_at(inputKey, current - 1, 4,
                              ["ALLE"]))) {
            addPrimaryTranslation('L');
            addSecondaryTranslation('');
            current += 2;
            break;
          }
          current += 2;
        } else
          current += 1;
        addPrimaryTranslation("L");
        addSecondaryTranslation('L');
        break;

      case 'M':
        if ((string_at(inputKey, current - 1, 3,
            ["UMB"])
            && (((current + 1) == last)
                || string_at(inputKey, current + 2, 2,
                    ["ER"])))
                    // 'dumb', 'thumb'
                    || (inputKey.substring(current + 1, current + 2) == 'M')) {
          current += 2;
        } else {
          current += 1;
        }
        addPrimaryTranslation("M");
        addSecondaryTranslation("M");
        break;

      case 'N':
        if (inputKey.substring(current + 1, current + 2) == 'N')
          current += 2;
        else
          current += 1;
        addPrimaryTranslation("N");
        addSecondaryTranslation("N");
        break;

      case 'Ñ':
        current += 1;
        addPrimaryTranslation("N");
        addSecondaryTranslation("N");
        break;

      case 'P':
        if (inputKey.substring(current + 1, current + 2) == 'H') {
          current += 2;
          addPrimaryTranslation("F");
          addSecondaryTranslation('F');
          break;
        }

        // also account for "campbell" and "raspberry"
        if (string_at(inputKey, current + 1, 1,
            ["P","B"]))
          current += 2;
        else
          current += 1;
        addPrimaryTranslation("P");
        addSecondaryTranslation('P');
        break;

      case 'Q':
        if (inputKey.substring(current + 1, current + 2) == 'Q')
          current += 2;
        else
          current += 1;
        addPrimaryTranslation("K");
        addSecondaryTranslation('K');
        break;

      case 'R':
        // french e.g. 'rogier', but exclude 'hochmeier'
        if ((current == last)
            && !Slavo_Germanic(inputKey)
            && string_at(inputKey, current - 2, 2,
                ["IE"])
                && !string_at(inputKey, current - 4, 2,
                    ["ME","MA"])) {
          addPrimaryTranslation("");
          addSecondaryTranslation('R');
        } else {
          addPrimaryTranslation("R");
          addSecondaryTranslation('R');
        }
        if (inputKey.substring(current + 1, current + 2) == 'R')
          current += 2;
        else
          current += 1;
        break;

      case 'S':
        // special cases 'island', 'isle', 'carlisle', 'carlysle'
        if (string_at(inputKey, current - 1, 3,
            ["ISL","YSL"])) {
          current += 1;
          break;
        }

        // special case 'sugar-'
        if ((current == 0)
            && string_at(inputKey, current, 5,
                ["SUGAR"])) {
          addPrimaryTranslation("X");
          addSecondaryTranslation('S');
          current += 1;
          break;
        }

        if (string_at(inputKey, current, 2,
            ["SH"])) {
          // germanic
          if (string_at(inputKey, current + 1, 4,
              ["HEIM","HOEK","HOLM","HOLZ"])) {
            addPrimaryTranslation("S");
            addSecondaryTranslation('S');
          } else {
            addPrimaryTranslation("X");
            addSecondaryTranslation('X');
          }
          current += 2;
          break;
        }

        // italian & armenian
        if (string_at(inputKey, current, 3,
            ["SIO","SIA"])
            || string_at(inputKey, current, 4,
                ["SIAN"])) {
          if (!Slavo_Germanic(inputKey)) {
            addPrimaryTranslation("S");
            addSecondaryTranslation('X');
          } else {
            addPrimaryTranslation("S");
            addSecondaryTranslation('S');
          }
          current += 3;
          break;
        }

        // german & anglicisations, e.g. 'smith' match 'schmidt', 'snider' match 'schneider'
        // also, -sz- in slavic language altho in hungarian it is pronounced 's'
        if (((current == 0)
            && string_at(inputKey, current + 1, 1,
                ["M","N","L","W"]))
                || string_at(inputKey, current + 1, 1,
                    ["Z"])) {
          addPrimaryTranslation("S");
          addSecondaryTranslation('X');
          if (string_at(inputKey, current + 1, 1,
              ["Z"]))
            current += 2;
          else
            current += 1;
          break;
        }

        if (string_at(inputKey, current, 2,
            ["SC"])) {
          // Schlesinger's rule
          if (inputKey.substring(current + 2, current + 3) == 'H')
            // dutch origin, e.g. 'school', 'schooner'
            if (string_at(inputKey, current + 3, 2,
                ["OO","ER","EN","UY","ED","EM"])) {
              // 'schermerhorn', 'schenker'
              if (string_at(inputKey, current + 3, 2,
                  ["ER","EN"])) {
                addPrimaryTranslation("X");
                addSecondaryTranslation("SK");
              } else {
                addPrimaryTranslation("SK");
                addSecondaryTranslation("SK");
              }
              current += 3;
              break;
            } else {
              if ((current == 0)
                  && !isVowel(inputKey, 3)
                  && (inputKey.substring(current + 1, current + 4) != 'W')) {
                addPrimaryTranslation("X");
                addSecondaryTranslation('S');
              } else {
                addPrimaryTranslation("X");
                addSecondaryTranslation('X');
              }
              current += 3;
              break;
            }

          if (string_at(inputKey, current + 2, 1,
              ["I","E","Y"])) {
            addPrimaryTranslation("S");
            addSecondaryTranslation('S');
            current += 3;
            break;
          }

          // else
          addPrimaryTranslation("SK");
          addSecondaryTranslation('SK');
          current += 3;
          break;
        }

        // french e.g. 'resnais', 'artois'
        if ((current == last)
            && string_at(inputKey, current - 2, 2,
                ["AI","OI"])) {
          addPrimaryTranslation("");
          addSecondaryTranslation('S');
        } else {
          addPrimaryTranslation("S");
          addSecondaryTranslation('S');
        }

        if (string_at(inputKey, current + 1, 1,
            ["S","Z"]))
          current += 2;
        else
          current += 1;
        break;

      case 'T':
        if (string_at(inputKey, current, 4,
            ["TION"])) {
          addPrimaryTranslation("X");
          addSecondaryTranslation('X');
          current += 3;
          break;
        }

        if (string_at(inputKey, current, 3,
            ["TIA","TCH"])) {
          addPrimaryTranslation("X");
          addSecondaryTranslation('X');
          current += 3;
          break;
        }

        if (string_at(inputKey, current, 2,
            ["TH"])
            || string_at(inputKey, current, 3,
                ["TTH"])) {
          // special case 'thomas', 'thames' or germanic
          if (string_at(inputKey, current + 2, 2,
              ["OM","AM"])
              || string_at(inputKey, 0, 4, ["VAN ","VON "])
              || string_at(inputKey, 0, 3, ["SCH"])) {
            addPrimaryTranslation("T");
            addSecondaryTranslation('T');
          } else {
            addPrimaryTranslation("0");
            addSecondaryTranslation('T');
          }
          current += 2;
          break;
        }

        if (string_at(inputKey, current + 1, 1,
            ["T","D"]))
          current += 2;
        else
          current += 1;
        addPrimaryTranslation("T");
        addSecondaryTranslation('T');
        break;

      case 'V':
        if (inputKey.substring(current + 1, current + 2) == 'V')
          current += 2;
        else
          current += 1;
        addPrimaryTranslation("F");
        addSecondaryTranslation('F');
        break;

      case 'W':
        // can also be in middle of word
        if (string_at(inputKey, current, 2, ["WR"])) {
          addPrimaryTranslation("R");
          addSecondaryTranslation('R');
          current += 2;
          break;
        }

        if ((current == 0)
            && (isVowel(inputKey, current + 1)
                || string_at(inputKey, current, 2,
                    ["WH"]))) {
          // Wasserman should match Vasserman
          if (isVowel(inputKey, current + 1)) {
            addPrimaryTranslation("A");
            addSecondaryTranslation('F');
          } else {
            // need Uomo to match Womo
            addPrimaryTranslation("A");
            addSecondaryTranslation('A');
          }
        }

        // Arnow should match Arnoff
        if(current > 0) {
          if (((current == last)
              && isVowel(inputKey, current - 1))
              || string_at(inputKey, current - 1, 5,
                  ["EWSKI","EWSKY","OWSKI","OWSKY"])
                  || string_at(inputKey, 0, 3, ["SCH"])) {
            addPrimaryTranslation("");
            addSecondaryTranslation('F');
            current += 1;
            break;
          }
        }

        // polish e.g. 'filipowicz'
        if (string_at(inputKey, current, 4,
            ["WICZ","WITZ"])) {
          addPrimaryTranslation("TS");
          addSecondaryTranslation('FX');
          current += 4;
          break;
        }

        // else skip it
        current += 1;
        break;

      case 'X':
        // french e.g. breaux
        if (current == 0 ) {
          addPrimaryTranslation('S');
          addSecondaryTranslation('S');
          current++;
        } else {
        if (!((current == last)
            && (string_at(inputKey, current - 3, 3,
                ["IAU", "EAU"])
                || string_at(inputKey, current - 2, 2,
                    ["AU", "OU"])))) {
          addPrimaryTranslation("KS");
          addSecondaryTranslation('KS');
        }

        if (string_at(inputKey, current + 1, 1,
            ["C","X"]))
          current += 2;
        else
          current += 1;
        }
        break;

      case 'Z':
        // chinese pinyin e.g. 'zhao'
        if (inputKey.substring(current + 1, current + 2) == "H") {
          addPrimaryTranslation("J");
          addSecondaryTranslation('J');
          current += 2;
          break;
        } else if (string_at(inputKey, current + 1, 2,
            ["ZO", "ZI", "ZA"])
            || (Slavo_Germanic(inputKey)
                && ((current > 0)
                    && inputKey.substring(current - 1, current) != 'T'))) {
          addPrimaryTranslation("S");
          addSecondaryTranslation("TS");
        } else {
          addPrimaryTranslation("S");
          addSecondaryTranslation('S');
        }

        if (inputKey.substring(current + 1, current + 2) == 'Z')
          current += 2;
        else
          current += 1;
        break;


      default:
        current++;
    }
  }

  return [primary, secondary];
}

/*
 * Strongest Match
Primary Key (1) = Primary Key (2)

Normal Match
Secondary Key (1) = Primary Key (2)
Primary Key (1) = Secondary Key (2)

Minimal Match
Secondary Key (1) = Secondary Key (2)

Fuzzy Match
a0bcd ~ a1cd
 */
/// Returns the first element (primary) from asDoubleMetaphonePhoneticList
/// as "Metaphone" String.
///
/// doubleMetaphoneFuzzyCompare('Smith', 'Schmidt'); // Returns true
/// doubleMetaphoneFuzzyCompare('Smith', 'Schmitz'); // Returns false
bool doubleMetaphoneFuzzyCompare(String a, String b) {
  var mA = asDoubleMetaphonePhoneticList(a);
  var mB = asDoubleMetaphonePhoneticList(b);
  if (mA[0] == mB[0]) {
    return true;
  } else if (mA[0] == mB[1]) {
    return true;
  } else if (mA[1] == mB[1]) {
    return true;
  } else if (mA[1] == mB[0]) {

    return true;
  }
  return _fuzzyCompare(mA, mB);
}
/// Strongest Match
/// Primary Key (1) = Primary Key (2)
bool doubleMetaphoneStrongCompare(String a, String b) {
  var mA = asDoubleMetaphonePhoneticList(a);
  var mB = asDoubleMetaphonePhoneticList(b);
  if (mA[0] == mB[0]) {
    return true;
  }
  return false;
}
/// Normal Match
/// Secondary Key (1) = Primary Key (2)
/// Primary Key (1) = Secondary Key (2)
bool doubleMetaphoneNormalCompare(String a, String b) {
  var mA = asDoubleMetaphonePhoneticList(a);
  var mB = asDoubleMetaphonePhoneticList(b);
  if (mA[0] == mB[0]) {
    return true;
  } else if (mA[0] == mB[1]) {
    return true;
  } else if (mA[1] == mB[0]) {
    return true;
  }
  return false;
}
/// Minimal Match
/// Secondary Key (1) = Secondary Key (2)
bool doubleMetaphoneMinimalCompare(String a, String b) {
  var mA = asDoubleMetaphonePhoneticList(a);
  var mB = asDoubleMetaphonePhoneticList(b);
  if (mA[0] == mB[0]) {
    return true;
  } else if (mA[0] == mB[1]) {
    return true;
  } else if (mA[1] == mB[1]) {
    return true;
  } else if (mA[1] == mB[0]) {
    return true;
  }
  return false;
}
/// Fuzzy Match
/// a0bcd ~ a1cd
bool _fuzzyCompare(List a, List b) {
  var count = 0;
  var shortest = a[0].length;
  num diff = (a[0].length - b[0].length).abs();
  if (diff > 1) {
    return false;
  }
  if (a[0].length > b[0].length) {
    shortest = b[0].length;
  }
  for (var i = 0; i < shortest; i++) {
    if (!(a[0].contains( b[0][i]) )){
      count++;
    }
  }
  var maxErrorCount = shortest;
  //second
  shortest = a[1].length;
  diff = (a[1].length - b[1].length).abs();
  if (diff > 1) {
    return false;
  }
  if (a[1].length > b[1].length) {
    shortest = b[1].length;
  }
  for (var i = 0; i < shortest; i++) {
    if (!(a[1].contains( b[1][i]) )){
      count++;
    }
  }
  maxErrorCount = ((maxErrorCount + shortest) / 2).abs();
  if (count > maxErrorCount) return false;

  return true;
}
/// Returns the "Double Metaphone" elements primary and secondary as String
/// separated with "-"
/// If both primary and secondary are equal, only the primary returns.
///
/// asMetaphonePhonetic('Dart'); // Returns 'TRT'
/// asMetaphonePhonetic('This is the Basic thing'); // Returns '0SS0-TSST'
String asDoubleMetaphonePhonetic(String aString) {
  asDoubleMetaphonePhoneticList(aString);
  var primary = asDoubleMetaphonePhoneticList(aString)[0];
  var secondary = asDoubleMetaphonePhoneticList(aString)[1];
  if ((secondary.isEmpty) || (primary == secondary)) {
    return asDoubleMetaphonePhoneticList(aString)[0];
  } else {
    return primary +  '-' + secondary ;
  }
}


// That's all ;-)