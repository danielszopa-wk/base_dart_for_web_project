import 'dart:html';

void main() {
  querySelector('#output')?.text = 'Your Dart app is running.';
  printTimes();
}

void printTimes() {
  const size = 10000000;
  final stopwatch1 = Stopwatch();
  final stopwatch2 = Stopwatch();

  final numbers = List<int>.generate(size, (i) => i);
  stopwatch1.start();
  final numbers1 = getNumbers1(numbers);
  stopwatch1.stop();

  stopwatch2.start();
  final numbers2 = getNumbers2(numbers);
  stopwatch2.stop();

  // Do something with results so that they don't get compiled out.
  [
    ...numbers1,
    ...numbers2,
  ].map((n) => print(n));

  print('Map iteration time = ${stopwatch1.elapsedMilliseconds}');
  print('For loop iteration time = ${stopwatch2.elapsedMilliseconds}');
}

List<int> getNumbers1(List<int> numbers) {
  return numbers.where((i) => i % 10 == 0).map((i) => i * 10).toList();
}

List<int> getNumbers2(List<int> numbers) {
  final mapped = <int>[];
  for (final i in numbers) {
    if (i % 10 == 0) mapped.add(i * 10);
  }
  return mapped;
}
