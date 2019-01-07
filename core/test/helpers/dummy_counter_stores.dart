import 'package:core/src/store/counter_store.dart';

class NullCounterStore implements CounterStore {
  @override
  Future<Map<String, int>> counter() => null;
}

class ValueCounterStore implements CounterStore {
  @override
  Future<Map<String, int>> counter() async => {'count': 24};
}
