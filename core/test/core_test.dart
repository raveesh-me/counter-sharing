import 'package:test/test.dart';
import 'package:core/core.dart';
import 'helpers/dummy_counter_stores.dart';

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

  group('counter BLoC needs to work with stores', () {
    test('async factory needs to work with a null store', () async {
      //arrange
      CounterBloc bloc = await CounterBloc.fromStore(NullCounterStore());
      //assert
      expect(bloc.countStream, emits(0));
    });
    test('async factory needs to work with a value store', () async {
      //arrange
      CounterBloc bloc = await CounterBloc.fromStore(ValueCounterStore());
      //assert
      expect(bloc.countStream, emits(24));
    });
    test('increment should work with null store', () async {
      //arrange
      CounterBloc bloc = await CounterBloc.fromStore(NullCounterStore());
      //act
      bloc.increment();
      CounterBloc newbloc = await CounterBloc.fromStore(NullCounterStore());
      //assert
      expect(bloc.countStream, emits(1));
      expect(newbloc.countStream, emits(0));
    });

    test('increment should work with value store', () async {
      //arrange
      CounterBloc bloc = await CounterBloc.fromStore(ValueCounterStore());
      //act
      bloc.increment();
      CounterBloc newBloc = await CounterBloc.fromStore(ValueCounterStore());
      //assert
      expect(newBloc.countStream, emits(25));
    });
  });
}
