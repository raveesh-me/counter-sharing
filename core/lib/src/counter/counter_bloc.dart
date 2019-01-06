import 'package:core/src/counter/counter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:core/src/store/counter_store.dart';
class CounterBloc{
  Counter _counter;

  CounterBloc({int initialValue}){
    this._counter = Counter(initialValue: initialValue);
  }

  BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();
  Stream<int> get countStream => _counterSubject.stream;

  init(CounterStore store) async {

  }

  increment(){
    _counter.increment();
    _counterSubject.add(_counter.count);
  }

  dispose() => _counterSubject.close();
}