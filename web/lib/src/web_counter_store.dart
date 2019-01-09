import 'dart:indexed_db' as idb;
import 'dart:html';
import 'package:core/core.dart';

class WebCounterStore implements CounterStore {
  Future<idb.Transaction> counterTransaction() async{
    idb.Database db =  await window.indexedDB.open('counter', version: 1,
        onUpgradeNeeded: (idb.VersionChangeEvent e) {
          idb.Database _db = e.target.result as idb.Database;
          _db.createObjectStore('counter');
        });
    return db.transaction('counter', 'readwrite');
  }

  @override
  Future<Map<String, int>> getCountMap() async {
    int _initialCount;
    if (idb.IdbFactory.supported) {
      idb.Transaction tx = await counterTransaction();
      _initialCount = await tx.objectStore('counter').getObject('count') as int;
      tx.completed;
    }else{
      _initialCount = int.parse(window.localStorage['count'] ?? '0');
    }
    return {'count': _initialCount};
  }


  @override
  setCount(int count) async {
    if(idb.IdbFactory.supported){
      idb.Transaction tx = await counterTransaction();
      tx.objectStore('counter').put(count, "count");
    }else{
      window.localStorage.update('count', (old) => '$count');
    }
  }
}
