![Phonetics!](https://raw.github.com/Fulnir/dart-phonetics/master/Icon.png)
Dart Phonetics
---

[![Build Status](https://drone.io/github.com/Fulnir/dart-phonetics/status.png)](https://drone.io/github.com/Fulnir/dart-phonetics/latest)

Calculates the phonetic code for the given string.

```dart
import 'package:phonetics/phonetics.dart';

main() {
  print(phonetic('Dart', 'en'));            // Returns D630
  print(asColognePhonetic('Dart'));         // Returns 272
  print(asSoundexPhonetic('Dart'));         // Returns D630
  print(asDoubleMetaphonePhonetic('Dart')); // Returns TRT
  print(doubleMetaphoneFuzzyCompare('John', 'Jean'); // Returns true
}
```

##Soundex

For the English language.

Metaphone

[en.wikipedia.org/wiki/Metaphone](http://en.wikipedia.org/wiki/Metaphone)

Soundex

[en.wikipedia.org/wiki/Soundex](http://en.wikipedia.org/wiki/Soundex)


## Kölner Phonetik

For the German language.

[de.wikipedia.org/wiki/Kölner_Phonetik](http://de.wikipedia.org/wiki/Kölner_Phonetik)


