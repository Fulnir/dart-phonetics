# Dart Soundex
---

Copyright (C) 2013 Edwin B�hler. All Rights Reserved.

Author: Edwin B�hler <edbuehler@icloud.com>


Calculates the phonetic code for the given string.

```dart
import 'package:dart_phonetic/dart_phonetic.dart';

main() {
  print(phonetic('Dart', 'en'));     // Returns D630
  print(asColognePhonetic('Dart'));  // Returns 272
  print(asSoundexPhonetic('Dart'));  // Returns D630
}
```

##Soundex

For the English language.

*Will be replaced with metaphone*

[en.wikipedia.org/wiki/Soundex](http://en.wikipedia.org/wiki/Soundex)


## K�lner Phonetik

For the German language.

[de.wikipedia.org/wiki/K�lner_Phonetik](http://de.wikipedia.org/wiki/K�lner_Phonetik)


