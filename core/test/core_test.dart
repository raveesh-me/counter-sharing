import 'package:test/test.dart';
import 'package:core/core.dart';

main() {
  test('testing the counter', () {
    //Setup (Arrange)
    Counter counter = Counter(initialValue: 2);
    assert(counter.count == 2);
    //Execution (Act)
    counter.increment();
    //Validation (Assert)
    expect(counter.count, equals(3));
  });

  group('testing counter BLoC', () {
    test('bloc exists', () {
      //Arrange
      CounterBloc counterBloc = CounterBloc(counter: Counter(initialValue: 2));

    });
  });
}
