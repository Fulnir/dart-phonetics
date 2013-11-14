# Dart Soundex
---

Copyright (C) 2013 Edwin BŸhler. All Rights Reserved.

Author: Edwin BŸhler <edbuehler@icloud.com>


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


## Kšlner Phonetik

For the German language.

[de.wikipedia.org/wiki/Kšlner_Phonetik](http://de.wikipedia.org/wiki/Kšlner_Phonetik)


