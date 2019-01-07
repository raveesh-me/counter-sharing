import 'package:test/test.dart';
import 'package:core/core.dart';

main() {
  test('testing counter BLoC', () {
    //Arrange
    CounterBloc counterBloc = CounterBloc(initialValue: 2);
    //Act
    counterBloc.increment();
    //Assert
    expect(counterBloc.countStream, emits(3));
    //clean
    counterBloc.dispose();
  });

  group('testing counter BLoC with Store', () {
    test('testing async factory', () async {
      //Arrange
      CounterBloc counterBloc = await CounterBloc.fromStore(CounterStore());
      //Assert
      expect(counterBloc.countStream, emits(24));
    });
  });
}
