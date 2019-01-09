import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCounterStore implements CounterStore {
  SharedPreferences _preferences;

  SharedPreferencesCounterStore(SharedPreferences preferences) {
    this._preferences = preferences;
  }

  @override
  Future<Map<String, int>> getCountMap() async {
    return {'count': _preferences.getInt('count')};
  }

  @override
  setCount(int count) {
    _preferences.setInt('count', count);
  }
}
