import 'dart:io';

main() {
  stdout.writeln("Enter Something");
  var data = stdin.readLineSync();
  print("You Entered $data");
}
