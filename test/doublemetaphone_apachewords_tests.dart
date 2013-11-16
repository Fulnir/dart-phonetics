//
// Copyright (C) 2013 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//
// Tests from:
// http://svn.apache.org/repos/asf/commons/proper/codec/tags/CODEC_1_3_RC1/src/test/org/apache/commons/codec/language/DoubleMetaphoneTest.java
//

library doublemetaphone_apachewords_test.dart;
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

  logTest.info('English - Double Metaphone - Word pairs from apache.org');

  List<List> normalPairs =  [
                             ["beggining", "beginning"],
                             ["disition", "decision"],
                             ["pscolgst", "psychologist"],
                             ["suger", "sugar"],
                             ["syncorization", "synchronization"],
                             ["taht", "that"],
                             ["teh", "the"],
                             ["teridical", "theoretical"],
                             ["beggining", "beginning"],
                             ["disition", "decision"],
                             ["pscolgst", "psychologist"],
                             ["syncorization", "synchronization"],
                             ["taht", "that"],
                             ["teh", "the"],
                             ["teridical", "theoretical"]
                             ];

  List<List> minimalPairs =  [
                            ["alchohol", "alcohol"],
                            ["alchoholic", "alcoholic"],
                            ["elagent", "elegant"],
                            ["heighth", "height"],
                            ["psicolagest", "psychologist"],
                            ["psycolagest", "psychologist"],
                            ["segements", "segments"],
                            ["sicolagest", "psychologist"],
                            ["alchohol", "alcohol"],
                            ["alchoholic", "alcoholic"],
                            ["elagent", "elegant"],
                            ["heighth", "height"],
                            ["psicolagest", "psychologist"],
                            ["psycolagest", "psychologist"],
                            ["segements", "segments"],
                            ["sicolagest", "psychologist"]
  ];
  List<List> fuzzyPairs =  [
                            ["Circue", "Circle"],
                            ["abouy", "about"],
                            ["anonomy", "anatomy"],
                            ["ast", "at"],
                            ["autoamlly", "automatically"],
                            ["buch", "bush"],
                            ["cocamena", "cockamamie"],
                            ["compicated", "complicated"],
                            ["consident", "consistent"],
                            ["consident", "consonant"],
                            ["courst", "court"],
                            ["credetability", "credibility"],
                            ["ctitique", "critique"],
                            ["defenly", "defiantly"],
                            ["documtations", "documentation"],
                            ["dur", "due"],
                            ["duren", "during"],
                            ["dynaic", "dynamic"],
                            ["enligtment", "Enlightenment"],
                            ["enought", "enough"],
                            ["erro", "error"],
                            ["excution", "execution"],
                            ["exspidient", "expedient"],
                            ["extions", "extensions"],
                            ["factontion", "factorization"],
                            ["famdasy", "fantasy"],
                            ["febuary", "february"],
                            ["fluk", "flux"],
                            ["futs", "guts"],
                            ["gamne", "came"],
                            ["gobernement", "government"],
                            ["gobernment", "government"],
                            ["havne", "have"],
                            ["herlo", "hello"],
                            ["imfamy", "infamy"],
                            ["inital", "initial"],
                            ["intejilent", "intelligent"],
                            ["isotrop", "isotope"],
                            ["leasve", "leave"],
                            ["libary", "library"],
                            ["lilometer", "kilometer"],
                            ["meory", "memory"],
                            ["metter", "better"],
                            ["minum", "minimum"],
                            ["misilous", "miscellaneous"],
                            ["neccessary", "necessary"],
                            ["noticably", "noticeably"],
                            ["olf", "old"],
                            ["oving", "moving"],
                            ["paramers", "parameters"],
                            ["paranets", "parameters"],
                            ["partrucal", "particular"],
                            ["pataphysical", "metaphysical"],
                            ["patten", "pattern"],
                            ["permition", "permission"],
                            ["pompom", "pompon"],
                            ["prefices", "prefixes"],
                            ["pronisation", "pronunciation"],
                            ["ramplily", "rampantly"],
                            ["roon", "room"],
                            ["rought", "roughly"],
                            ["rudemtry", "rudimentary"],
                          ["saftly", "safely"],
                          ["scrabdle", "scrabble"],
                          ["sherbert", "sherbet"],
                          ["simpfilty", "simplicity"],
                          ["subisitions", "substitutions"],
                          ["subjecribed", "subscribed"],
                          ["tunnellike", "tunnel like"],
                          ["tured", "turned"],
                          ["upmost", "utmost"],
                          ["uranisium", "uranium"],
                          ["youe", "your"]];

  List<List> strongPairs =  [
  ["Accosinly", "Occasionally"],
  ["Maddness", "Madness"],
  ["Occusionaly", "Occasionally"],
  ["Steffen", "Stephen"],
  ["Thw", "The"],
  ["Unformanlly", "Unfortunately"],
  ["Unfortally", "Unfortunately"],
  ["abilitey", "ability"],
  ["absorbtion", "absorption"],
  ["accidently", "accidentally"],
  ["accomodate", "accommodate"],
  ["acommadate", "accommodate"],
  ["acord", "accord"],
  ["adultry", "adultery"],
  ["aggresive", "aggressive"],
  ["allieve", "alive"],
  ["alot", "a lot"],
  ["alright", "all right"],
  ["amature", "amateur"],
  ["ambivilant", "ambivalent"],
  ["amourfous", "amorphous"],
  ["annoint", "anoint"],
  ["annonsment", "announcement"],
  ["annoyting", "anting"],
  ["annuncio", "announce"],
  ["anotomy", "anatomy"],
  ["antidesestablishmentarianism", "antidisestablishmentarianism"],
  ["antidisestablishmentarism", "antidisestablishmentarianism"],
  ["anynomous", "anonymous"],
  ["appelet", "applet"],
  ["appreceiated", "appreciated"],
  ["appresteate", "appreciate"],
  ["aquantance", "acquaintance"],
  ["aricticure", "architecture"],
  ["asterick", "asterisk"],
  ["asymetric", "asymmetric"],
  ["atentively", "attentively"],
  ["bankrot", "bankrupt"],
  ["basicly", "basically"],
  ["batallion", "battalion"],
  ["bbrose", "browse"],
  ["beauro", "bureau"],
  ["beaurocracy", "bureaucracy"],
  ["behaviour", "behavior"],
  ["beleive", "believe"],
  ["belive", "believe"],
  ["blait", "bleat"],
  ["bouyant", "buoyant"],
  ["boygot", "boycott"],
  ["brocolli", "broccoli"],
  ["buder", "butter"],
  ["budr", "butter"],
  ["budter", "butter"],
  ["buracracy", "bureaucracy"],
  ["burracracy", "bureaucracy"],
  ["buton", "button"],
  ["byby", "by by"],
  ["cauler", "caller"],
  ["ceasar", "caesar"],
  ["cemetary", "cemetery"],
  ["changeing", "changing"],
  ["cheet", "cheat"],
  ["cimplicity", "simplicity"],
  ["circumstaces", "circumstances"],
  ["clob", "club"],
  ["coaln", "colon"],
  ["colleaque", "colleague"],
  ["colloquilism", "colloquialism"],
  ["columne", "column"],
  ["comitmment", "commitment"],
  ["comitte", "committee"],
  ["comittmen", "commitment"],
  ["comittmend", "commitment"],
  ["commerciasl", "commercials"],
  ["commited", "committed"],
  ["commitee", "committee"],
  ["companys", "companies"],
  ["comupter", "computer"],
  ["concensus", "consensus"],
  ["confusionism", "confucianism"],
  ["congradulations", "congratulations"],
  ["contunie", "continue"],
  ["cooly", "coolly"],
  ["copping", "coping"],
  ["cosmoplyton", "cosmopolitan"],
  ["crasy", "crazy"],
  ["croke", "croak"],
  ["crucifiction", "crucifixion"],
  ["crusifed", "crucified"],
  ["cumba", "combo"],
  ["custamisation", "customization"],
  ["dag", "dog"],
  ["daly", "daily"],
  ["defence", "defense"],
  ["definate", "definite"],
  ["definately", "definitely"],
  ["dependeble", "dependable"],
  ["descrption", "description"],
  ["descrptn", "description"],
  ["desparate", "desperate"],
  ["dessicate", "desiccate"],
  ["destint", "distant"],
  ["develepment", "developments"],
  ["developement", "development"],
  ["develpond", "development"],
  ["devulge", "divulge"],
  ["dieties", "deities"],
  ["dinasaur", "dinosaur"],
  ["dinasour", "dinosaur"],
  ["discuess", "discuss"],
  ["disect", "dissect"],
  ["disippate", "dissipate"],
  ["dispair", "despair"],
  ["distarct", "distract"],
  ["distart", "distort"],
  ["distroy", "destroy"],
  ["doenload", "download"],
  ["dongle", "dangle"],
  ["doog", "dog"],
  ["dramaticly", "dramatically"],
  ["drunkeness", "drunkenness"],
  ["ductioneery", "dictionary"],
  ["ecstacy", "ecstasy"],
  ["egsistence", "existence"],
  ["eitiology", "etiology"],
  ["embarass", "embarrass"],
  ["embarassment", "embarrassment"],
  ["embaress", "embarrass"],
  ["encapsualtion", "encapsulation"],
  ["encyclapidia", "encyclopedia"],
  ["encyclopia", "encyclopedia"],
  ["engins", "engine"],
  ["enhence", "enhance"],
  ["ennuui", "ennui"],
  ["enventions", "inventions"],
  ["envireminakl", "environmental"],
  ["enviroment", "environment"],
  ["epitomy", "epitome"],
  ["equire", "acquire"],
  ["errara", "error"],
  ["evaualtion", "evaluation"],
  ["excede", "exceed"],
  ["excercise", "exercise"],
  ["excpt", "except"],
  ["exhileration", "exhilaration"],
  ["existance", "existence"],
  ["expleyly", "explicitly"],
  ["explity", "explicitly"],
  ["failer", "failure"],
  ["faver", "favor"],
  ["faxe", "fax"],
  ["firey", "fiery"],
  ["fistival", "festival"],
  ["flatterring", "flattering"],
  ["flukse", "flux"],
  ["fone", "phone"],
  ["forsee", "foresee"],
  ["frustartaion", "frustrating"],
  ["funetik", "phonetic"],
  ["gaurd", "guard"],
  ["generly", "generally"],
  ["ghandi", "gandhi"],
  ["gotton", "gotten"],
  ["gracefull", "graceful"],
  ["gradualy", "gradually"],
  ["grammer", "grammar"],
  ["hallo", "hello"],
  ["hapily", "happily"],
  ["harrass", "harass"],
  ["heellp", "help"],
  ["hellp", "help"],
  ["helo", "hello"],
  ["hippie", "hippy"],
  ["hippopotamous", "hippopotamus"],
  ["hourse", "horse"],
  ["houssing", "housing"],
  ["howaver", "however"],
  ["howver", "however"],
  ["humaniti", "humanity"],
  ["hyfin", "hyphen"],
  ["hystrical", "hysterical"],
  ["illegitament", "illegitimate"],
  ["imbed", "embed"],
  ["imediaetly", "immediately"],
  ["immenant", "immanent"],
  ["implemtes", "implements"],
  ["inadvertant", "inadvertent"],
  ["incase", "in case"],
  ["incedious", "insidious"],
  ["incompleet", "incomplete"],
  ["incomplot", "incomplete"],
  ["inconvenant", "inconvenient"],
  ["inconvience", "inconvenience"],
  ["independant", "independent"],
  ["independenent", "independent"],
  ["indepnends", "independent"],
  ["indepth", "in depth"],
  ["indispensible", "indispensable"],
  ["inefficite", "inefficient"],
  ["infact", "in fact"],
  ["influencial", "influential"],
  ["innoculate", "inoculate"],
  ["insistant", "insistent"],
  ["insistenet", "insistent"],
  ["instulation", "installation"],
  ["intealignt", "intelligent"],
  ["intelegent", "intelligent"],
  ["intelegnent", "intelligent"],
  ["intelejent", "intelligent"],
  ["inteligent", "intelligent"],
  ["intelignt", "intelligent"],
  ["intellagant", "intelligent"],
  ["intellegent", "intelligent"],
  ["intellegint", "intelligent"],
  ["intellgnt", "intelligent"],
  ["intensionality", "intensionally"],
  ["internation", "international"],
  ["interpretate", "interpret"],
  ["interpretter", "interpreter"],
  ["intertes", "interested"],
  ["intertesd", "interested"],
  ["invermeantial", "environmental"],
  ["irresistable", "irresistible"],
  ["irritible", "irritable"],
  ["isreal", "israel"],
  ["johhn", "john"],
  ["kippur", "kipper"],
  ["knawing", "knowing"],
  ["lesure", "leisure"],
  ["liasion", "lesion"],
  ["liason", "liaison"],
  ["likly", "likely"],
  ["liquify", "liquefy"],
  ["lloyer", "layer"],
  ["lossing", "losing"],
  ["luser", "laser"],
  ["maintanence", "maintenance"],
  ["mandelbrot", "Mandelbrot"],
  ["marshall", "marshal"],
  ["maxium", "maximum"],
  ["mic", "mike"],
  ["midia", "media"],
  ["millenium", "millennium"],
  ["miniscule", "minuscule"],
  ["minkay", "monkey"],
  ["mischievious", "mischievous"],
  ["momento", "memento"],
  ["monkay", "monkey"],
  ["mosaik", "mosaic"],
  ["mostlikely", "most likely"],
  ["mousr", "mouser"],
  ["mroe", "more"],
  ["necesary", "necessary"],
  ["necesser", "necessary"],
  ["neice", "niece"],
  ["neighbour", "neighbor"],
  ["nemonic", "pneumonic"],
  ["nevade", "Nevada"],
  ["nickleodeon", "nickelodeon"],
  ["nieve", "naive"],
  ["noone", "no one"],
  ["notin", "not in"],
  ["nozled", "nuzzled"],
  ["objectsion", "objects"],
  ["ocassion", "occasion"],
  ["occuppied", "occupied"],
  ["occurence", "occurrence"],
  ["octagenarian", "octogenarian"],
  ["opposim", "opossum"],
  ["organise", "organize"],
  ["organiz", "organize"],
  ["orientate", "orient"],
  ["oscilascope", "oscilloscope"],
  ["parametic", "parameter"],
  ["permissable", "permissible"],
  ["permmasivie", "permissive"],
  ["persue", "pursue"],
  ["phantasia", "fantasia"],
  ["phenominal", "phenomenal"],
  ["playwrite", "playwright"],
  ["poeses", "poesies"],
  ["poligamy", "polygamy"],
  ["politict", "politic"],
  ["pollice", "police"],
  ["polypropalene", "polypropylene"],
  ["possable", "possible"],
  ["practicle", "practical"],
  ["pragmaticism", "pragmatism"],
  ["preceeding", "preceding"],
  ["precios", "precision"],
  ["preemptory", "peremptory"],
  ["prefixt", "prefixed"],
  ["presbyterian", "Presbyterian"],
  ["presue", "pursue"],
  ["presued", "pursued"],
  ["privielage", "privilege"],
  ["priviledge", "privilege"],
  ["proceedures", "procedures"],
  ["pronensiation", "pronunciation"],
  ["pronounciation", "pronunciation"],
  ["properally", "properly"],
  ["proplematic", "problematic"],
  ["protray", "portray"],
  ["quoz", "quiz"],
  ["radious", "radius"],
  ["reccomend", "recommend"],
  ["reccona", "raccoon"],
  ["recieve", "receive"],
  ["reconise", "recognize"],
  ["rectangeles", "rectangle"],
  ["reoccurring", "recurring"],
  ["repitition", "repetition"],
  ["replasments", "replacement"],
  ["respct", "respect"],
  ["respecally", "respectfully"],
  ["rsx", "RSX"],
  ["runnung", "running"],
  ["sacreligious", "sacrilegious"],
  ["salut", "salute"],
  ["searcheable", "searchable"],
  ["seferal", "several"],
  ["sence", "sense"],
  ["seperate", "separate"],
  ["sieze", "seize"],
  ["simplye", "simply"],
  ["sitte", "site"],
  ["slyph", "sylph"],
  ["smil", "smile"],
  ["sometmes", "sometimes"],
  ["soonec", "sonic"],
  ["specificialy", "specifically"],
  ["spel", "spell"],
  ["spoak", "spoke"],
  ["sponsered", "sponsored"],
  ["stering", "steering"],
  ["straightjacket", "straitjacket"],
  ["stumach", "stomach"],
  ["stutent", "student"],
  ["styleguide", "style guide"],
  ["subpena", "subpoena"],
  ["substations", "substitutions"],
  ["supercede", "supersede"],
  ["superfulous", "superfluous"],
  ["susan", "Susan"],
  ["swimwear", "swim wear"],
  ["taff", "tough"],
  ["tattos", "tattoos"],
  ["techniquely", "technically"],
  ["tem", "team"],
  ["teo", "two"],
  ["tesst", "test"],
  ["theridically", "theoretical"],
  ["thredically", "theoretically"],
  ["thruout", "throughout"],
  ["ths", "this"],
  ["titalate", "titillate"],
  ["tobagan", "tobaggon"],
  ["tommorrow", "tomorrow"],
  ["tomorow", "tomorrow"],
  ["trubbel", "trouble"],
  ["ttest", "test"],
  ["tyrrany", "tyranny"],
  ["unatourral", "unnatural"],
  ["unaturral", "unnatural"],
  ["unconisitional", "unconstitutional"],
  ["unconscience", "unconscious"],
  ["underladder", "under ladder"],
  ["unentelegible", "unintelligible"],
  ["unfortunently", "unfortunately"],
  ["unnaturral", "unnatural"],
  ["upcast", "up cast"],
  ["verison", "version"],
  ["vinagarette", "vinaigrette"],
  ["volunteerism", "voluntarism"],
  ["volye", "volley"],
  ["waite", "wait"],
  ["wan't", "won't"],
  ["warloord", "warlord"],
  ["whaaat", "what"],
  ["whard", "ward"],
  ["whimp", "wimp"],
  ["wicken", "weaken"],
  ["wierd", "weird"],
  ["wrank", "rank"],
  ["writeen", "righten"],
  ["writting", "writing"],
  ["wundeews", "windows"],
  ["yeild", "yield"],
  ["Maddness", "Madness"],
  ["Occusionaly", "Occasionally"],
  ["Steffen", "Stephen"],
  ["Thw", "The"],
  ["Unformanlly", "Unfortunately"],
  ["Unfortally", "Unfortunately"],
  ["abilitey", "ability"],
  ["absorbtion", "absorption"],
  ["accidently", "accidentally"],
  ["accomodate", "accommodate"],
  ["acommadate", "accommodate"],
  ["acord", "accord"],
  ["adultry", "adultery"],
  ["aggresive", "aggressive"],
  ["allieve", "alive"],
  ["alot", "a lot"],
  ["alright", "all right"],
  ["amature", "amateur"],
  ["ambivilant", "ambivalent"],
  ["amourfous", "amorphous"],
  ["annoint", "anoint"],
  ["annonsment", "announcement"],
  ["annoyting", "anting"],
  ["annuncio", "announce"],
  ["anotomy", "anatomy"],
  ["antidesestablishmentarianism", "antidisestablishmentarianism"],
  ["antidisestablishmentarism", "antidisestablishmentarianism"],
  ["anynomous", "anonymous"],
  ["appelet", "applet"],
  ["appreceiated", "appreciated"],
  ["appresteate", "appreciate"],
  ["aquantance", "acquaintance"],
  ["aricticure", "architecture"],
  ["asterick", "asterisk"],
  ["asymetric", "asymmetric"],
  ["atentively", "attentively"],
  ["bankrot", "bankrupt"],
  ["basicly", "basically"],
  ["batallion", "battalion"],
  ["bbrose", "browse"],
  ["beauro", "bureau"],
  ["beaurocracy", "bureaucracy"],
  ["behaviour", "behavior"],
  ["beleive", "believe"],
  ["belive", "believe"],
  ["blait", "bleat"],
  ["bouyant", "buoyant"],
  ["boygot", "boycott"],
  ["brocolli", "broccoli"],
  ["buder", "butter"],
  ["budr", "butter"],
  ["budter", "butter"],
  ["buracracy", "bureaucracy"],
  ["burracracy", "bureaucracy"],
  ["buton", "button"],
  ["byby", "by by"],
  ["cauler", "caller"],
  ["ceasar", "caesar"],
  ["cemetary", "cemetery"],
  ["changeing", "changing"],
  ["cheet", "cheat"],
  ["cimplicity", "simplicity"],
  ["circumstaces", "circumstances"],
  ["clob", "club"],
  ["coaln", "colon"],
  ["colleaque", "colleague"],
  ["colloquilism", "colloquialism"],
  ["columne", "column"],
  ["comitmment", "commitment"],
  ["comitte", "committee"],
  ["comittmen", "commitment"],
  ["comittmend", "commitment"],
  ["commerciasl", "commercials"],
  ["commited", "committed"],
  ["commitee", "committee"],
  ["companys", "companies"],
  ["comupter", "computer"],
  ["concensus", "consensus"],
  ["confusionism", "confucianism"],
  ["congradulations", "congratulations"],
  ["contunie", "continue"],
  ["cooly", "coolly"],
  ["copping", "coping"],
  ["cosmoplyton", "cosmopolitan"],
  ["crasy", "crazy"],
  ["croke", "croak"],
  ["crucifiction", "crucifixion"],
  ["crusifed", "crucified"],
  ["cumba", "combo"],
  ["custamisation", "customization"],
  ["dag", "dog"],
  ["daly", "daily"],
  ["defence", "defense"],
  ["definate", "definite"],
  ["definately", "definitely"],
  ["dependeble", "dependable"],
  ["descrption", "description"],
  ["descrptn", "description"],
  ["desparate", "desperate"],
  ["dessicate", "desiccate"],
  ["destint", "distant"],
  ["develepment", "developments"],
  ["developement", "development"],
  ["develpond", "development"],
  ["devulge", "divulge"],
  ["dieties", "deities"],
  ["dinasaur", "dinosaur"],
  ["dinasour", "dinosaur"],
  ["discuess", "discuss"],
  ["disect", "dissect"],
  ["disippate", "dissipate"],
  ["dispair", "despair"],
  ["distarct", "distract"],
  ["distart", "distort"],
  ["distroy", "destroy"],
  ["doenload", "download"],
  ["dongle", "dangle"],
  ["doog", "dog"],
  ["dramaticly", "dramatically"],
  ["drunkeness", "drunkenness"],
  ["ductioneery", "dictionary"],
  ["ecstacy", "ecstasy"],
  ["egsistence", "existence"],
  ["eitiology", "etiology"],
  ["embarass", "embarrass"],
  ["embarassment", "embarrassment"],
  ["embaress", "embarrass"],
  ["encapsualtion", "encapsulation"],
  ["encyclapidia", "encyclopedia"],
  ["encyclopia", "encyclopedia"],
  ["engins", "engine"],
  ["enhence", "enhance"],
  ["ennuui", "ennui"],
  ["enventions", "inventions"],
  ["envireminakl", "environmental"],
  ["enviroment", "environment"],
  ["epitomy", "epitome"],
  ["equire", "acquire"],
  ["errara", "error"],
  ["evaualtion", "evaluation"],
  ["excede", "exceed"],
  ["excercise", "exercise"],
  ["excpt", "except"],
  ["exhileration", "exhilaration"],
  ["existance", "existence"],
  ["expleyly", "explicitly"],
  ["explity", "explicitly"],
  ["failer", "failure"],
  ["faver", "favor"],
  ["faxe", "fax"],
  ["firey", "fiery"],
  ["fistival", "festival"],
  ["flatterring", "flattering"],
  ["flukse", "flux"],
  ["fone", "phone"],
  ["forsee", "foresee"],
  ["frustartaion", "frustrating"],
  ["funetik", "phonetic"],
  ["gaurd", "guard"],
  ["generly", "generally"],
  ["ghandi", "gandhi"],
  ["gotton", "gotten"],
  ["gracefull", "graceful"],
  ["gradualy", "gradually"],
  ["grammer", "grammar"],
  ["hallo", "hello"],
  ["hapily", "happily"],
  ["harrass", "harass"],
  ["heellp", "help"],
  ["hellp", "help"],
  ["helo", "hello"],
  ["hippie", "hippy"],
  ["hippopotamous", "hippopotamus"],
  ["hourse", "horse"],
  ["houssing", "housing"],
  ["howaver", "however"],
  ["howver", "however"],
  ["humaniti", "humanity"],
  ["hyfin", "hyphen"],
  ["hystrical", "hysterical"],
  ["illegitament", "illegitimate"],
  ["imbed", "embed"],
  ["imediaetly", "immediately"],
  ["immenant", "immanent"],
  ["implemtes", "implements"],
  ["inadvertant", "inadvertent"],
  ["incase", "in case"],
  ["incedious", "insidious"],
  ["incompleet", "incomplete"],
  ["incomplot", "incomplete"],
  ["inconvenant", "inconvenient"],
  ["inconvience", "inconvenience"],
  ["independant", "independent"],
  ["independenent", "independent"],
  ["indepnends", "independent"],
  ["indepth", "in depth"],
  ["indispensible", "indispensable"],
  ["inefficite", "inefficient"],
  ["infact", "in fact"],
  ["influencial", "influential"],
  ["innoculate", "inoculate"],
  ["insistant", "insistent"],
  ["insistenet", "insistent"],
  ["instulation", "installation"],
  ["intealignt", "intelligent"],
  ["intelegent", "intelligent"],
  ["intelegnent", "intelligent"],
  ["intelejent", "intelligent"],
  ["inteligent", "intelligent"],
  ["intelignt", "intelligent"],
  ["intellagant", "intelligent"],
  ["intellegent", "intelligent"],
  ["intellegint", "intelligent"],
  ["intellgnt", "intelligent"],
  ["intensionality", "intensionally"],
  ["internation", "international"],
  ["interpretate", "interpret"],
  ["interpretter", "interpreter"],
  ["intertes", "interested"],
  ["intertesd", "interested"],
  ["invermeantial", "environmental"],
  ["irresistable", "irresistible"],
  ["irritible", "irritable"],
  ["isreal", "israel"],
  ["johhn", "john"],
  ["kippur", "kipper"],
  ["knawing", "knowing"],
  ["lesure", "leisure"],
  ["liasion", "lesion"],
  ["liason", "liaison"],
  ["likly", "likely"],
  ["liquify", "liquefy"],
  ["lloyer", "layer"],
  ["lossing", "losing"],
  ["luser", "laser"],
  ["maintanence", "maintenance"],
  ["mandelbrot", "Mandelbrot"],
  ["marshall", "marshal"],
  ["maxium", "maximum"],
  ["mic", "mike"],
  ["midia", "media"],
  ["millenium", "millennium"],
  ["miniscule", "minuscule"],
  ["minkay", "monkey"],
  ["mischievious", "mischievous"],
  ["momento", "memento"],
  ["monkay", "monkey"],
  ["mosaik", "mosaic"],
  ["mostlikely", "most likely"],
  ["mousr", "mouser"],
  ["mroe", "more"],
  ["necesary", "necessary"],
  ["necesser", "necessary"],
  ["neice", "niece"],
  ["neighbour", "neighbor"],
  ["nemonic", "pneumonic"],
  ["nevade", "Nevada"],
  ["nickleodeon", "nickelodeon"],
  ["nieve", "naive"],
  ["noone", "no one"],
  ["notin", "not in"],
  ["nozled", "nuzzled"],
  ["objectsion", "objects"],
  ["ocassion", "occasion"],
  ["occuppied", "occupied"],
  ["occurence", "occurrence"],
  ["octagenarian", "octogenarian"],
  ["opposim", "opossum"],
  ["organise", "organize"],
  ["organiz", "organize"],
  ["orientate", "orient"],
  ["oscilascope", "oscilloscope"],
  ["parametic", "parameter"],
  ["permissable", "permissible"],
  ["permmasivie", "permissive"],
  ["persue", "pursue"],
  ["phantasia", "fantasia"],
  ["phenominal", "phenomenal"],
  ["playwrite", "playwright"],
  ["poeses", "poesies"],
  ["poligamy", "polygamy"],
  ["politict", "politic"],
  ["pollice", "police"],
  ["polypropalene", "polypropylene"],
  ["possable", "possible"],
  ["practicle", "practical"],
  ["pragmaticism", "pragmatism"],
  ["preceeding", "preceding"],
  ["precios", "precision"],
  ["preemptory", "peremptory"],
  ["prefixt", "prefixed"],
  ["presbyterian", "Presbyterian"],
  ["presue", "pursue"],
  ["presued", "pursued"],
  ["privielage", "privilege"],
  ["priviledge", "privilege"],
  ["proceedures", "procedures"],
  ["pronensiation", "pronunciation"],
  ["pronounciation", "pronunciation"],
  ["properally", "properly"],
  ["proplematic", "problematic"],
  ["protray", "portray"],
  ["quoz", "quiz"],
  ["radious", "radius"],
  ["reccomend", "recommend"],
  ["reccona", "raccoon"],
  ["recieve", "receive"],
  ["reconise", "recognize"],
  ["rectangeles", "rectangle"],
  ["reoccurring", "recurring"],
  ["repitition", "repetition"],
  ["replasments", "replacement"],
  ["respct", "respect"],
  ["respecally", "respectfully"],
  ["rsx", "RSX"],
  ["runnung", "running"],
  ["sacreligious", "sacrilegious"],
  ["salut", "salute"],
  ["searcheable", "searchable"],
  ["seferal", "several"],
  ["sence", "sense"],
  ["seperate", "separate"],
  ["sieze", "seize"],
  ["simplye", "simply"],
  ["sitte", "site"],
  ["slyph", "sylph"],
  ["smil", "smile"],
  ["sometmes", "sometimes"],
  ["soonec", "sonic"],
  ["specificialy", "specifically"],
  ["spel", "spell"],
  ["spoak", "spoke"],
  ["sponsered", "sponsored"],
  ["stering", "steering"],
  ["straightjacket", "straitjacket"],
  ["stumach", "stomach"],
  ["stutent", "student"],
  ["styleguide", "style guide"],
  ["subpena", "subpoena"],
  ["substations", "substitutions"],
  ["supercede", "supersede"],
  ["superfulous", "superfluous"],
  ["susan", "Susan"],
  ["swimwear", "swim wear"],
  ["taff", "tough"],
  ["tattos", "tattoos"],
  ["techniquely", "technically"],
  ["tem", "team"],
  ["teo", "two"],
  ["tesst", "test"],
  ["theridically", "theoretical"],
  ["thredically", "theoretically"],
  ["thruout", "throughout"],
  ["ths", "this"],
  ["titalate", "titillate"],
  ["tobagan", "tobaggon"],
  ["tommorrow", "tomorrow"],
  ["tomorow", "tomorrow"],
  ["trubbel", "trouble"],
  ["ttest", "test"],
  ["tyrrany", "tyranny"],
  ["unatourral", "unnatural"],
  ["unaturral", "unnatural"],
  ["unconisitional", "unconstitutional"],
  ["unconscience", "unconscious"],
  ["underladder", "under ladder"],
  ["unentelegible", "unintelligible"],
  ["unfortunently", "unfortunately"],
  ["unnaturral", "unnatural"],
  ["upcast", "up cast"],
  ["verison", "version"],
  ["vinagarette", "vinaigrette"],
  ["volunteerism", "voluntarism"],
  ["volye", "volley"],
  ["waite", "wait"],
  ["wan't", "won't"],
  ["warloord", "warlord"],
  ["whaaat", "what"],
  ["whard", "ward"],
  ["whimp", "wimp"],
  ["wicken", "weaken"],
  ["wierd", "weird"],
  ["wrank", "rank"],
  ["writeen", "righten"],
  ["writting", "writing"],
  ["wundeews", "windows"],
  ["yeild", "yield"]
  ];


  group('Apache.org word strongPairs:', () {
    strongPairs.forEach((each) {
      test('$each', () => expect(doubleMetaphoneStrongCompare(each[0],each[1]), isTrue));
    });
  });
  group('Apache.org word normalPairs:', () {
    normalPairs.forEach((each) {
      test('$each', () => expect(doubleMetaphoneNormalCompare(each[0],each[1]), isTrue));
    });
  });
  group('Apache.org word minimalPairs:', () {
    minimalPairs.forEach((each) {
      test('$each', () => expect(doubleMetaphoneMinimalCompare(each[0],each[1]), isTrue));
    });
  });
  group('Apache.org word fuzzyPairs:', () {
    fuzzyPairs.forEach((each) {
      test('$each', () => expect(doubleMetaphoneFuzzyCompare(each[0],each[1]), isTrue));
    });
  });

}

