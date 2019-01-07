import 'package:core/src/store/counter_store.dart';

class NullCounterStore implements CounterStore {
  @override
  Future<Map<String, int>> getCountMap() => null;
}

class ValueCounterStore implements CounterStore {
  @override
  Future<Map<String, int>> getCountMap() async => {'count': 24};
}
