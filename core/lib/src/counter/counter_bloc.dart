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
    int _initialValue;
    try {
      Map<String, int> _map = await store.counter();
      _initialValue = _map['count'] ?? 0;
    } on Exception catch (e) {
       print(e);
       _initialValue = 0;
    }
    this._counter = Counter(initialValue: _initialValue);
    _counterSubject.add(_counter.count);
  }

  increment(){
    _counter.increment();
    _counterSubject.add(_counter.count);
  }

  dispose() => _counterSubject.close();
}