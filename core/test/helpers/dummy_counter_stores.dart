import 'package:core/src/store/counter_store.dart';

class NullCounterStore implements CounterStore {
  @override
  Future<Map<String, int>> getCountMap() => null;

  @override
  setCount(int count) {
    // TODO: implement setCount
    return null;
  }
}

class ValueCounterStore implements CounterStore {
  static Map<String, int> _map = {'count': 24};

  @override
  Future<Map<String, int>> getCountMap() async => _map;

  @override
  setCount(int count) {
    _map = {'count': count};
  }
}
