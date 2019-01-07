import 'package:core/src/store/counter_store.dart';

class NullCounterStore implements CounterStore {
  @override
  Future<Map<String, int>> getCounterMap() => null;
}

class ValueCounterStore implements CounterStore {
  @override
  Future<Map<String, int>> getCounterMap() async => {'count': 24};
}
