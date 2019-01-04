import 'counter.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc{
  Counter _counter;

  CounterBloc({int initialValue}){
    this._counter = Counter(initialValue: initialValue);
  }

  BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();
  Stream<int> get countStream => _counterSubject.stream;

  increment(){
    _counter.increment();
    _counterSubject.add(_counter.count);
  }

  dispose() => _counterSubject.close();
}