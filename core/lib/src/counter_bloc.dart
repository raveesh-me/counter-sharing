import 'counter.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc{
  Counter _counter;

  CounterBloc({Counter counter}){
    this._counter = counter ?? Counter();
  }

  BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();
  get countStream => _counterSubject.stream;

  increment(){
    _counter.increment();
    _counterSubject.add(_counter.count);
  }

  dispose() => _counterSubject.close();
}