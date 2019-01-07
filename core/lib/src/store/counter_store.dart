abstract class CounterStore {
  Future<Map<String, int>> getCountMap();
  setCount(int count);
}
