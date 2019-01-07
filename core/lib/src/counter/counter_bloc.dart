import 'package:core/src/counter/counter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:core/src/store/counter_store.dart';

class CounterBloc {
  Counter _counter;
  CounterStore _store;

  BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();
  Stream<int> get countStream => _counterSubject.stream;

  CounterBloc({int initialValue, CounterStore store}) {
    this._counter = Counter(initialValue: initialValue);
    this._store = store;
    _counterSubject.add(_counter.count);
  }

  static Future<CounterBloc> fromStore(CounterStore store) async {
    Map<String, int> _map = await store.getCountMap();
    int _initialValue;
    if (_map == null)
      _initialValue = 0;
    else {
      _initialValue = _map['count'];
    }
    return new CounterBloc(initialValue: _initialValue, store: store);
  }

  increment() {
    _counter.increment();
    _counterSubject.add(_counter.count);
  }

  dispose() => _counterSubject.close();
}
