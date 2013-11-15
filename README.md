Dart Phonetics
---

Copyright (C) 2013 Edwin Bühler. All Rights Reserved.

Author: Edwin Bühler <fulnir@gmail.com>


Calculates the phonetic code for the given string.

```dart
import 'package:phonetics/phonetics.dart';

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


## Kölner Phonetik

For the German language.

[de.wikipedia.org/wiki/Kölner_Phonetik](http://de.wikipedia.org/wiki/Kölner_Phonetik)


