//
// $ dart tool/hop_runner.dart --color docs --allow-dirty
//
library sparse_list.hop_runner;


import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';

void main(List<String> args) {


  addTask('docs', createDartDocTask(['lib/phonetics.dart']));

  runHop(args, paranoid: false);
}