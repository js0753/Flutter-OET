import 'dart:io';

main() {
  stdout.writeln("Enter a List of length 5");
  List<int> l1 = new List(5);
  for (int i = 0; i < 5; i++) l1[i] = int.parse(stdin.readLineSync());
  int max = 0;
  l1.forEach((e) => e > max ? max = e : max = max);
  print("Max element of list is $max");
}
