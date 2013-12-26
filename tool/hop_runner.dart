//
// $ dart tool/hop_runner.dart --color docs --allow-dirty
//
library phonetics.hop_runner;


import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';

void main(List<String> args) {


  addTask('docs', createDartDocTask(['lib/phonetics.dart'],
      linkApi: true,
      excludeLibs: ['intl', 'logging', 'dart.pkg.collection.wrappers',
                    'dart.collection_helpers.wrappers', 'number_symbol_data',
                    'number_symbols', 'intl_helpers', 'date_symbols',
                    'date_format_internal']));

  runHop(args, paranoid: false);
}